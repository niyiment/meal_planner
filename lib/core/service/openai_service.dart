import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_planner/core/constants/app_constant.dart';

import '../errors/exceptions.dart';
import '../errors/result.dart';
import '../network/api_client.dart';
import '../utils/image_util.dart';
import '../../features/recipe/data/models/recipe_generation_request.dart';
import '../../features/recipe/domain/entities/recipe_entity.dart';
import 'ai_service.dart';
import '../../features/scan/data/models/scan_models.dart';


/// Provider for OpenAI service
final openAiServiceProvider = Provider<OpenAiService>((ref) {
  final dio = ref.watch(dioProvider);
  return OpenAiService(dio);
});

class OpenAiService implements AiService {
  final Dio _dio;

  OpenAiService(this._dio) {
    _dio.options.baseUrl = AppConstants.openAiBaseUrl;
    _dio.options.headers['Authorization'] = 'Bearer ${AppConstants.openAiApiKey}';
    _dio.options.headers['Content-Type'] = 'application/json';
  }

  @override
  Stream<String> generateRecipeStream(
      File image, {
        String? additionalPrompt,
        int? servings,
        String? dietaryRestrictions,
      }) async* {
    try {
      final compressedImage = await ImageUtil.compressImage(image);
      final imageBytes = await compressedImage.readAsBytes();
      final base64Image = base64Encode(imageBytes);

      final request = RecipeGenerationRequest(
        image: image,
        additionalPrompt: additionalPrompt,
        servings: servings,
        dietaryRestrictions: dietaryRestrictions,
      );

      final response = await _dio.post(
        '/chat/completions',
        data: {
          'model': AppConstants.openAiVisionModel,
          'messages': [
            {
              'role': 'user',
              'content': [
                {
                  'type': 'text',
                  'text': request.buildPrompt(),
                },
                {
                  'type': 'image_url',
                  'image_url': {
                    'url': 'data:image/jpeg;base64,$base64Image',
                  },
                },
              ],
            },
          ],
          'stream': true,
        },
        options: Options(
          responseType: ResponseType.stream,
          headers: {'Accept': 'text/event-stream'},
        ),
      );

      await for (final chunk in (response.data as ResponseBody).stream) {
        final text = utf8.decode(chunk);
        final lines = text.split('\n').where((line) => line.isNotEmpty);

        for (final line in lines) {
          if (line.startsWith('data: ')) {
            final data = line.substring(6).trim();
            if (data == '[DONE]') continue;

            try {
              final json = jsonDecode(data);
              final delta = json['choices']?[0]?['delta'];
              final content = delta?['content'];

              if (content != null && content is String) {
                yield content;
              }
            } catch (_) {
              continue;
            }
          }
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const InvalidApiKeyException();
      } else if (e.response?.statusCode == 429) {
        throw const RateLimitException();
      }
      throw AiServiceException('Failed to generate recipe: ${e.message}');
    } catch (e) {
      throw AiServiceException('Unexpected error: $e');
    }
  }

  @override
  Future<Result<RecipeEntity>> generateRecipe(
      File image, {
        String? additionalPrompt,
        int? servings,
        String? dietaryRestrictions,
      }) async {
    try {
      final buffer = StringBuffer();

      await for (final chunk in generateRecipeStream(
        image,
        additionalPrompt: additionalPrompt,
        servings: servings,
        dietaryRestrictions: dietaryRestrictions,
      )) {
        buffer.write(chunk);
      }

      final responseText = buffer.toString();

      // Extract JSON from response (might have markdown code blocks)
      final jsonMatch = RegExp(r'```json\s*(.*?)\s*```', dotAll: true)
          .firstMatch(responseText);

      final jsonText = jsonMatch?.group(1) ?? responseText;
      final jsonResponse = jsonDecode(jsonText) as Map<String, dynamic>;

      final aiResponse = AiRecipeResponse.fromJson(jsonResponse);
      final recipe = _mapToRecipe(aiResponse);

      return Success(recipe);
    } on AiServiceException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(AiServiceException('Failed to parse recipe: $e'));
    }
  }

  @override
  Future<Result<List<String>>> detectIngredients(File image) async {
    try {
      final compressedImage = await ImageUtil.compressImage(image);
      final imageBytes = await compressedImage.readAsBytes();
      final base64Image = base64Encode(imageBytes);

      final response = await _dio.post(
        '/chat/completions',
        data: {
          'model': AppConstants.openAiVisionModel,
          'messages': [
            {
              'role': 'user',
              'content': [
                {
                  'type': 'text',
                  'text': 'Analyze this image and list all the food ingredients you can identify.\nReturn ONLY a JSON array of ingredient names, nothing else.\nExample: ["tomatoes", "garlic", "onions", "olive oil"]',
                },
                {
                  'type': 'image_url',
                  'image_url': {
                    'url': 'data:image/jpeg;base64,$base64Image',
                  },
                },
              ],
            },
          ],
        },
      );

      final content = response.data['choices'][0]['message']['content'] as String;

      // Extract JSON array from response
      final jsonMatch = RegExp(r'\[.*\]', dotAll: true).firstMatch(content);
      final jsonText = jsonMatch?.group(0) ?? content;

      final ingredients = (jsonDecode(jsonText) as List)
          .map((e) => e.toString())
          .toList();

      return Success(ingredients);
    } on DioException catch (e) {
      return Failure(NetworkException(e.message ?? 'Network error'));
    } catch (e) {
      return Failure(AiServiceException('Failed to detect ingredients: $e'));
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getNutritionInfo(
      List<String> ingredients,
      ) async {
    try {
      final response = await _dio.post(
        '/chat/completions',
        data: {
          'model': AppConstants.openAiVisionModel,
          'messages': [
            {
              'role': 'user',
              'content': 'Provide estimated nutrition information for a recipe using these ingredients: ${ingredients.join(", ")}.\nReturn as JSON with this structure:\n{\n  "calories": 450,\n  "protein": 25.5,\n  "carbohydrates": 30.0,\n  "fat": 15.0,\n  "fiber": 5.0,\n  "sugar": 8.0,\n  "sodium": 400\n}',
            },
          ],
        },
      );

      final content = response.data['choices'][0]['message']['content'] as String;
      final jsonMatch = RegExp(r'\{.*\}', dotAll: true).firstMatch(content);
      final jsonText = jsonMatch?.group(0) ?? content;

      final nutritionInfo = jsonDecode(jsonText) as Map<String, dynamic>;

      return Success(nutritionInfo);
    } catch (e) {
      return Failure(AiServiceException('Failed to get nutrition info: $e'));
    }
  }

  RecipeEntity _mapToRecipe(AiRecipeResponse response) {
    return RecipeEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: response.name,
      description: response.description,
      ingredients: response.ingredients,
      steps: response.steps
          .map((step) => RecipeStep(
        stepNumber: step.stepNumber,
        instruction: step.instruction,
        duration: step.duration,
        tips: step.tips,
      ))
          .toList(),
      nutritionInfo: response.nutritionInfo != null
          ? NutritionInfo(
        calories: response.nutritionInfo!.calories,
        protein: response.nutritionInfo!.protein,
        carbohydrates: response.nutritionInfo!.carbohydrates,
        fat: response.nutritionInfo!.fat,
        fiber: response.nutritionInfo!.fiber,
        sugar: response.nutritionInfo!.sugar,
        sodium: response.nutritionInfo!.sodium,
      )
          : null,
      cookingTime: response.cookingTime,
      servings: response.servings,
      complexity: _parseComplexity(response.complexity),
      tags: response.tags,
      createdAt: DateTime.now(),
      isSaved: false,
    );
  }

  RecipeComplexity _parseComplexity(String complexity) {
    switch (complexity.toLowerCase()) {
      case 'simple':
      case 'easy':
        return RecipeComplexity.simple;
      case 'complex':
      case 'hard':
      case 'advanced':
        return RecipeComplexity.complex;
      default:
        return RecipeComplexity.medium;
    }
  }
}

