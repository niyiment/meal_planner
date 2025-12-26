
import 'dart:io';

import '../../../../core/errors/result.dart';
import '../../../recipe/domain/entities/recipe_entity.dart';


/// Repository interface for scan operations
abstract class ScanRepository {
  Stream<String> generateRecipeStream(
      File image, {
        String? additionalPrompt,
        int? servings,
        String? dietaryRestrictions,
      });

  Future<Result<RecipeEntity>> generateRecipe(
      File image, {
        String? additionalPrompt,
        int? servings,
        String? dietaryRestrictions,
      });

  Future<Result<List<String>>> detectIngredients(File image);

  Future<Result<Map<String, dynamic>>> getNutritionInfo(
      List<String> ingredients,
      );
}
