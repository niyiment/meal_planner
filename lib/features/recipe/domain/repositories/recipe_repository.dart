
import '../../../../core/errors/result.dart';
import '../entities/recipe_entity.dart';

abstract class RecipeRepository {
  Future<Result<List<RecipeEntity>>> getAllRecipes();
  Future<Result<RecipeEntity?>> getRecipeById(String id);
  Future<Result<List<RecipeEntity>>> getSavedRecipes();
  Future<Result<void>> saveRecipe(RecipeEntity recipe);
  Future<Result<void>> updateRecipe(RecipeEntity recipe);
  Future<Result<void>> deleteRecipe(String id);
  Stream<List<RecipeEntity>> watchSavedRecipes();
}
