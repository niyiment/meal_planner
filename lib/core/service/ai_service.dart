import 'dart:io';

import '../errors/result.dart';
import '../../features/recipe/domain/entities/recipe_entity.dart';

/// Abstract AI service interface
abstract class AiService {
  Stream<String> generateRecipeStream(File image, {
    String? additionalPrompt,
    int? servings,
    String? dietaryRestrictions,
  });

  Future<Result<RecipeEntity>> generateRecipe(File image, {
    String? additionalPrompt,
    int? servings,
    String? dietaryRestrictions,
  });

  Future<Result<List<String>>> detectIngredients(File image);

  Future<Result<Map<String, dynamic>>> getNutritionInfo(
      List<String> ingredients,
      );
}


