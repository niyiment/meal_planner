import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/result.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';
import '../../../../core/service/ai_service.dart';
import '../../domain/repositories/scan_repository.dart';
import '../../../../core/service/openai_service.dart';

/// Scan repository implementation
class ScanRepositoryImpl implements ScanRepository {
  final AiService _aiService;

  ScanRepositoryImpl(this._aiService);

  @override
  Stream<String> generateRecipeStream(
      File image, {
        String? additionalPrompt,
        int? servings,
        String? dietaryRestrictions,
      }) {
    return _aiService.generateRecipeStream(
      image,
      additionalPrompt: additionalPrompt,
      servings: servings,
      dietaryRestrictions: dietaryRestrictions,
    );
  }

  @override
  Future<Result<RecipeEntity>> generateRecipe(
      File image, {
        String? additionalPrompt,
        int? servings,
        String? dietaryRestrictions,
      }) {
    return _aiService.generateRecipe(
      image,
      additionalPrompt: additionalPrompt,
      servings: servings,
      dietaryRestrictions: dietaryRestrictions,
    );
  }

  @override
  Future<Result<List<String>>> detectIngredients(File image) {
    return _aiService.detectIngredients(image);
  }

  @override
  Future<Result<Map<String, dynamic>>> getNutritionInfo(
      List<String> ingredients,
      ) {
    return _aiService.getNutritionInfo(ingredients);
  }
}

/// Provider for scan repository
final scanRepositoryProvider = Provider<ScanRepository>((ref) {
  final aiService = ref.watch(openAiServiceProvider);
  return ScanRepositoryImpl(aiService);
});
