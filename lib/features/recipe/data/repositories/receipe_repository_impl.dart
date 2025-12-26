import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/recipe_entity.dart';
import '../../domain/repositories/recipe_repository.dart';


/// Recipe repository implementation
class RecipeRepositoryImpl implements RecipeRepository {
  final AppDatabase _database;

  RecipeRepositoryImpl(this._database);

  @override
  Future<Result<List<RecipeEntity>>> getAllRecipes() async {
    try {
      final dbRecipes = await _database.getAllRecipes();
      final recipes = dbRecipes.map(_mapFromDb).toList();
      return Success(recipes);
    } on CacheException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(CacheException('Failed to get recipes: $e'));
    }
  }

  @override
  Future<Result<RecipeEntity?>> getRecipeById(String id) async {
    try {
      final dbRecipe = await _database.getRecipeById(id);
      if (dbRecipe == null) return const Success(null);
      return Success(_mapFromDb(dbRecipe));
    } catch (e) {
      return Failure(CacheException('Failed to get recipe: $e'));
    }
  }

  @override
  Future<Result<List<RecipeEntity>>> getSavedRecipes() async {
    try {
      final dbRecipes = await _database.getSavedRecipes();
      final recipes = dbRecipes.map(_mapFromDb).toList();
      return Success(recipes);
    } catch (e) {
      return Failure(CacheException('Failed to get saved recipes: $e'));
    }
  }

  @override
  Future<Result<void>> saveRecipe(RecipeEntity recipe) async {
    try {
      final companion = _mapToDb(recipe);
      await _database.insertRecipe(companion);
      return const Success(null);
    } catch (e) {
      return Failure(CacheException('Failed to save recipe: $e'));
    }
  }

  @override
  Future<Result<void>> updateRecipe(RecipeEntity recipe) async {
    try {
      final companion = _mapToDb(recipe);
      await _database.updateRecipe(companion);
      return const Success(null);
    } catch (e) {
      return Failure(CacheException('Failed to update recipe: $e'));
    }
  }

  @override
  Future<Result<void>> deleteRecipe(String id) async {
    try {
      await _database.deleteRecipe(id);
      return const Success(null);
    } catch (e) {
      return Failure(CacheException('Failed to delete recipe: $e'));
    }
  }

  @override
  Stream<List<RecipeEntity>> watchSavedRecipes() {
    return _database.watchSavedRecipes().map(
          (dbRecipes) => dbRecipes.map(_mapFromDb).toList(),
    );
  }

  // Map database recipe to entity
  RecipeEntity _mapFromDb(Recipe dbRecipe) {
    return RecipeEntity(
      id: dbRecipe.id,
      name: dbRecipe.name,
      description: dbRecipe.description,
      ingredients: (jsonDecode(dbRecipe.ingredients) as List)
          .map((e) => e.toString())
          .toList(),
      steps: (jsonDecode(dbRecipe.steps) as List)
          .map((s) => RecipeStep(
        stepNumber: s['stepNumber'] ?? 0,
        instruction: s['instruction'] ?? '',
        duration: s['duration'],
        tips: s['tips'] != null
            ? (s['tips'] as List).map((t) => t.toString()).toList()
            : null,
      ))
          .toList(),
      nutritionInfo: dbRecipe.nutritionInfo != null
          ? _parseNutritionInfo(jsonDecode(dbRecipe.nutritionInfo!))
          : null,
      cookingTime: dbRecipe.cookingTime,
      servings: dbRecipe.servings,
      complexity: _parseComplexity(dbRecipe.complexity),
      tags: (jsonDecode(dbRecipe.tags) as List)
          .map((e) => e.toString())
          .toList(),
      imageUrl: dbRecipe.imageUrl,
      createdAt: dbRecipe.createdAt,
      updatedAt: dbRecipe.updatedAt,
      isSaved: dbRecipe.isSaved,
    );
  }

  // Map entity to database companion
  RecipesCompanion _mapToDb(RecipeEntity recipe) {
    return RecipesCompanion(
      id: Value(recipe.id),
      name: Value(recipe.name),
      description: Value(recipe.description),
      ingredients: Value(jsonEncode(recipe.ingredients)),
      steps: Value(jsonEncode(
        recipe.steps.map((s) => {
          'stepNumber': s.stepNumber,
          'instruction': s.instruction,
          'duration': s.duration,
          'tips': s.tips,
        }).toList(),
      )),
      nutritionInfo: recipe.nutritionInfo != null
          ? Value(jsonEncode({
        'calories': recipe.nutritionInfo!.calories,
        'protein': recipe.nutritionInfo!.protein,
        'carbohydrates': recipe.nutritionInfo!.carbohydrates,
        'fat': recipe.nutritionInfo!.fat,
        'fiber': recipe.nutritionInfo!.fiber,
        'sugar': recipe.nutritionInfo!.sugar,
        'sodium': recipe.nutritionInfo!.sodium,
      }))
          : const Value(null),
      cookingTime: Value(recipe.cookingTime),
      servings: Value(recipe.servings),
      complexity: Value(recipe.complexity.name),
      tags: Value(jsonEncode(recipe.tags)),
      imageUrl: Value(recipe.imageUrl),
      createdAt: Value(recipe.createdAt),
      updatedAt: Value(recipe.updatedAt ?? DateTime.now()),
      isSaved: Value(recipe.isSaved),
    );
  }

  NutritionInfo _parseNutritionInfo(Map<String, dynamic> json) {
    return NutritionInfo(
      calories: json['calories'],
      protein: json['protein']?.toDouble(),
      carbohydrates: json['carbohydrates']?.toDouble(),
      fat: json['fat']?.toDouble(),
      fiber: json['fiber']?.toDouble(),
      sugar: json['sugar']?.toDouble(),
      sodium: json['sodium'],
    );
  }

  RecipeComplexity _parseComplexity(String complexity) {
    switch (complexity.toLowerCase()) {
      case 'simple':
        return RecipeComplexity.simple;
      case 'complex':
        return RecipeComplexity.complex;
      default:
        return RecipeComplexity.medium;
    }
  }
}

/// Provider for database
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

/// Provider for recipe repository
final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return RecipeRepositoryImpl(database);
});
