import 'package:equatable/equatable.dart';

/// Recipe entity representing a complete recipe
class Recipe extends Equatable {
  final String id;
  final String name;
  final String description;
  final List<String> ingredients;
  final List<RecipeStep> steps;
  final NutritionInfo? nutritionInfo;
  final int? cookingTime; // in minutes
  final int? servings;
  final RecipeComplexity complexity;
  final List<String> tags;
  final String? imageUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isSaved;

  const Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.steps,
    this.nutritionInfo,
    this.cookingTime,
    this.servings,
    this.complexity = RecipeComplexity.medium,
    this.tags = const [],
    this.imageUrl,
    required this.createdAt,
    this.updatedAt,
    this.isSaved = false,
  });

  Recipe copyWith({
    String? id,
    String? name,
    String? description,
    List<String>? ingredients,
    List<RecipeStep>? steps,
    NutritionInfo? nutritionInfo,
    int? cookingTime,
    int? servings,
    RecipeComplexity? complexity,
    List<String>? tags,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSaved,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      nutritionInfo: nutritionInfo ?? this.nutritionInfo,
      cookingTime: cookingTime ?? this.cookingTime,
      servings: servings ?? this.servings,
      complexity: complexity ?? this.complexity,
      tags: tags ?? this.tags,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    ingredients,
    steps,
    nutritionInfo,
    cookingTime,
    servings,
    complexity,
    tags,
    imageUrl,
    createdAt,
    updatedAt,
    isSaved,
  ];
}

/// Recipe step with detailed instructions
class RecipeStep extends Equatable {
  final int stepNumber;
  final String instruction;
  final int? duration; // in minutes
  final List<String>? tips;

  const RecipeStep({
    required this.stepNumber,
    required this.instruction,
    this.duration,
    this.tips,
  });

  @override
  List<Object?> get props => [stepNumber, instruction, duration, tips];
}

/// Nutrition information for a recipe
class NutritionInfo extends Equatable {
  final int? calories;
  final double? protein; // in grams
  final double? carbohydrates; // in grams
  final double? fat; // in grams
  final double? fiber; // in grams
  final double? sugar; // in grams
  final int? sodium; // in mg
  final Map<String, dynamic>? additionalInfo;

  const NutritionInfo({
    this.calories,
    this.protein,
    this.carbohydrates,
    this.fat,
    this.fiber,
    this.sugar,
    this.sodium,
    this.additionalInfo,
  });

  @override
  List<Object?> get props => [
    calories,
    protein,
    carbohydrates,
    fat,
    fiber,
    sugar,
    sodium,
    additionalInfo,
  ];
}

/// Recipe complexity levels
enum RecipeComplexity {
  simple,
  medium,
  complex;

  String get displayName {
    switch (this) {
      case RecipeComplexity.simple:
        return 'Simple';
      case RecipeComplexity.medium:
        return 'Medium';
      case RecipeComplexity.complex:
        return 'Complex';
    }
  }

  String get description {
    switch (this) {
      case RecipeComplexity.simple:
        return 'Quick & Easy';
      case RecipeComplexity.medium:
        return 'Moderate Effort';
      case RecipeComplexity.complex:
        return 'Advanced Cooking';
    }
  }
}

