import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';

part 'scan_models.freezed.dart';
part 'scan_models.g.dart';


String? _fileToJson(File? file) => file?.path;
File? _jsonToFile(String? path) => path != null ? File(path) : null;

/// Scan state model
@freezed
sealed class ScanState with _$ScanState { 
  const factory ScanState({
    @Default(ScanStatus.initial) ScanStatus status,
    @JsonKey(toJson: _fileToJson, fromJson: _jsonToFile)
    File? selectedImage,
    @Default([]) List<String> detectedIngredients,
    String? streamingRecipe,
    String? errorMessage,
    @Default(0.0) double progress,
  }) = _ScanState;

  factory ScanState.fromJson(Map<String, dynamic> json) =>
      _$ScanStateFromJson(json);
}

/// Scan status enum
enum ScanStatus {
  initial,
  imageSelected,
  detectingIngredients,
  ingredientsDetected,
  generatingRecipe,
  recipeGenerated,
  error,
}

/// Recipe generation options
@freezed
sealed class RecipeOptions with _$RecipeOptions {
  const factory RecipeOptions({
    @Default(4) int servings,
    String? dietaryRestrictions,
    String? cuisinePreference,
    String? complexity,
    @Default([]) List<String> excludeIngredients,
    String? additionalNotes,
  }) = _RecipeOptions;

  factory RecipeOptions.fromJson(Map<String, dynamic> json) =>
      _$RecipeOptionsFromJson(json);
}

/// AI response model
@freezed
sealed class AiRecipeResponse with _$AiRecipeResponse {
  const factory AiRecipeResponse({
    required String name,
    required String description,
    required List<String> ingredients,
    required List<RecipeStepDto> steps,
    NutritionInfoDto? nutritionInfo,
    int? cookingTime,
    int? servings,
    @Default('medium') String complexity,
    @Default([]) List<String> tags,
  }) = _AiRecipeResponse;

  factory AiRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$AiRecipeResponseFromJson(json);
}

/// Recipe step DTO
@freezed
sealed class RecipeStepDto with _$RecipeStepDto {
  const factory RecipeStepDto({
    required int stepNumber,
    required String instruction,
    int? duration,
    @Default([]) List<String> tips,
  }) = _RecipeStepDto;

  factory RecipeStepDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepDtoFromJson(json);
}

/// Nutrition info DTO
@freezed
sealed class NutritionInfoDto with _$NutritionInfoDto {
  const factory NutritionInfoDto({
    int? calories,
    double? protein,
    double? carbohydrates,
    double? fat,
    double? fiber,
    double? sugar,
    int? sodium,
  }) = _NutritionInfoDto;

  factory NutritionInfoDto.fromJson(Map<String, dynamic> json) =>
      _$NutritionInfoDtoFromJson(json);
}
