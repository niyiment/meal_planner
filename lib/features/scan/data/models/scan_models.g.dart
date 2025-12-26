// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScanState _$ScanStateFromJson(Map<String, dynamic> json) => _ScanState(
  status:
      $enumDecodeNullable(_$ScanStatusEnumMap, json['status']) ??
      ScanStatus.initial,
  selectedImage: _jsonToFile(json['selectedImage'] as String?),
  detectedIngredients:
      (json['detectedIngredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  streamingRecipe: json['streamingRecipe'] as String?,
  errorMessage: json['errorMessage'] as String?,
  progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$ScanStateToJson(_ScanState instance) =>
    <String, dynamic>{
      'status': _$ScanStatusEnumMap[instance.status]!,
      'selectedImage': _fileToJson(instance.selectedImage),
      'detectedIngredients': instance.detectedIngredients,
      'streamingRecipe': instance.streamingRecipe,
      'errorMessage': instance.errorMessage,
      'progress': instance.progress,
    };

const _$ScanStatusEnumMap = {
  ScanStatus.initial: 'initial',
  ScanStatus.imageSelected: 'imageSelected',
  ScanStatus.detectingIngredients: 'detectingIngredients',
  ScanStatus.ingredientsDetected: 'ingredientsDetected',
  ScanStatus.generatingRecipe: 'generatingRecipe',
  ScanStatus.recipeGenerated: 'recipeGenerated',
  ScanStatus.error: 'error',
};

_RecipeOptions _$RecipeOptionsFromJson(Map<String, dynamic> json) =>
    _RecipeOptions(
      servings: (json['servings'] as num?)?.toInt() ?? 4,
      dietaryRestrictions: json['dietaryRestrictions'] as String?,
      cuisinePreference: json['cuisinePreference'] as String?,
      complexity: json['complexity'] as String?,
      excludeIngredients:
          (json['excludeIngredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      additionalNotes: json['additionalNotes'] as String?,
    );

Map<String, dynamic> _$RecipeOptionsToJson(_RecipeOptions instance) =>
    <String, dynamic>{
      'servings': instance.servings,
      'dietaryRestrictions': instance.dietaryRestrictions,
      'cuisinePreference': instance.cuisinePreference,
      'complexity': instance.complexity,
      'excludeIngredients': instance.excludeIngredients,
      'additionalNotes': instance.additionalNotes,
    };

_AiRecipeResponse _$AiRecipeResponseFromJson(Map<String, dynamic> json) =>
    _AiRecipeResponse(
      name: json['name'] as String,
      description: json['description'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => RecipeStepDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      nutritionInfo: json['nutritionInfo'] == null
          ? null
          : NutritionInfoDto.fromJson(
              json['nutritionInfo'] as Map<String, dynamic>,
            ),
      cookingTime: (json['cookingTime'] as num?)?.toInt(),
      servings: (json['servings'] as num?)?.toInt(),
      complexity: json['complexity'] as String? ?? 'medium',
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$AiRecipeResponseToJson(_AiRecipeResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'nutritionInfo': instance.nutritionInfo,
      'cookingTime': instance.cookingTime,
      'servings': instance.servings,
      'complexity': instance.complexity,
      'tags': instance.tags,
    };

_RecipeStepDto _$RecipeStepDtoFromJson(Map<String, dynamic> json) =>
    _RecipeStepDto(
      stepNumber: (json['stepNumber'] as num).toInt(),
      instruction: json['instruction'] as String,
      duration: (json['duration'] as num?)?.toInt(),
      tips:
          (json['tips'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$RecipeStepDtoToJson(_RecipeStepDto instance) =>
    <String, dynamic>{
      'stepNumber': instance.stepNumber,
      'instruction': instance.instruction,
      'duration': instance.duration,
      'tips': instance.tips,
    };

_NutritionInfoDto _$NutritionInfoDtoFromJson(Map<String, dynamic> json) =>
    _NutritionInfoDto(
      calories: (json['calories'] as num?)?.toInt(),
      protein: (json['protein'] as num?)?.toDouble(),
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      fiber: (json['fiber'] as num?)?.toDouble(),
      sugar: (json['sugar'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NutritionInfoDtoToJson(_NutritionInfoDto instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'protein': instance.protein,
      'carbohydrates': instance.carbohydrates,
      'fat': instance.fat,
      'fiber': instance.fiber,
      'sugar': instance.sugar,
      'sodium': instance.sodium,
    };
