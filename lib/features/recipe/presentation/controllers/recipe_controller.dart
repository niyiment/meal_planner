
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_planner/features/recipe/data/repositories/receipe_repository_impl.dart';
import 'package:meal_planner/features/recipe/domain/entities/recipe_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_controller.g.dart';

/// Controller for all recipes
@riverpod
class RecipeController extends _$RecipeController {
  @override
  Future<List<RecipeEntity>> build() async {
    final repository = ref.watch(recipeRepositoryProvider);
    final result = await repository.getAllRecipes();
    return result.dataOrNull ?? [];
  }

  Future<void> saveRecipe(RecipeEntity recipe) async {
    final repository = ref.read(recipeRepositoryProvider);
    await repository.saveRecipe(recipe);
    ref.invalidateSelf();
  }

  Future<void> updateRecipe(RecipeEntity recipe) async {
    final repository = ref.read(recipeRepositoryProvider);
    await repository.updateRecipe(recipe);
    ref.invalidateSelf();
  }

  Future<void> deleteRecipe(String id) async {
    final repository = ref.read(recipeRepositoryProvider);
    await repository.deleteRecipe(id);
    ref.invalidateSelf();
  }

  Future<void> toggleSaved(RecipeEntity recipe) async {
    final updatedRecipe = recipe.copyWith(isSaved: !recipe.isSaved);
    await updateRecipe(updatedRecipe);
  }
}

/// Provider for saved recipes (streaming)
@riverpod
Stream<List<RecipeEntity>> savedRecipes(Ref ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return repository.watchSavedRecipes();
}

/// Provider for a single recipe by ID
@riverpod
Future<RecipeEntity?> recipeById(Ref ref, String id) async {
  final repository = ref.watch(recipeRepositoryProvider);
  final result = await repository.getRecipeById(id);
  return result.dataOrNull;
}

/// Provider for recent recipes (last 10)
@riverpod
Future<List<RecipeEntity>> recentRecipes(Ref ref) async {
  final allRecipes = await ref.watch(recipeControllerProvider.future);
  allRecipes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return allRecipes.take(10).toList();
}

/// Provider for recipe search
@riverpod
class RecipeSearch extends _$RecipeSearch {
  @override
  Future<List<RecipeEntity>> build(String query) async {
    if (query.isEmpty) return [];

    final allRecipes = await ref.watch(recipeControllerProvider.future);
    return allRecipes.where((recipe) {
      final lowerQuery = query.toLowerCase();
      return recipe.name.toLowerCase().contains(lowerQuery) ||
          recipe.description.toLowerCase().contains(lowerQuery) ||
          recipe.tags.any((tag) => tag.toLowerCase().contains(lowerQuery));
    }).toList();
  }
}


