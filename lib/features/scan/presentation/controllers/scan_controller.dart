import 'dart:io';

import 'package:meal_planner/features/recipe/domain/entities/recipe_entity.dart';
import 'package:meal_planner/features/scan/data/models/scan_models.dart';
import 'package:meal_planner/features/scan/data/repositories/scan_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_controller.g.dart';

@riverpod
class ScanController extends _$ScanController {
  @override
  ScanState build() {
    return const ScanState();
  }

  // set image
  void setImage(File image) {
    state = state.copyWith(
      status: ScanStatus.imageSelected,
      selectedImage: image,
      errorMessage: null,
    );
  }

  // clear current scan
  void clearScan() {
    state = const ScanState();
  }

  // Detect ingredients from image
  Future<void> detectIngredients() async {
    if (state.selectedImage == null) return;

    state = state.copyWith(
      status: ScanStatus.detectingIngredients,
      errorMessage: null,
    );

    final repository = ref.read(scanRepositoryProvider);
    final result = await repository.detectIngredients(state.selectedImage!);

    result.when(
      success: (ingredient) {
        state = state.copyWith(
          status: ScanStatus.ingredientsDetected,
          detectedIngredients: ingredient,
        );
      },
      failure: (error) {
        state = state.copyWith(
          status: ScanStatus.error,
          errorMessage: error.message,
        );
      },
    );
  }

  // Generate recipe with streaming
  Future<RecipeEntity?> generateRecipeStreaming({
    int? servings,
    String? dietaryRestrictions,
    String? additionalNotes,
  }) async {
    if (state.selectedImage == null) return null;

    state = state.copyWith(
      status: ScanStatus.generatingRecipe,
      streamingRecipe: '',
      progress: 0.0,
      errorMessage: null,
    );

    final repository = ref.read(scanRepositoryProvider);
    final buffer = StringBuffer();

    try {
      await for (final chunk in repository.generateRecipeStream(
        state.selectedImage!,
        additionalPrompt: additionalNotes,
        servings: servings,
        dietaryRestrictions: dietaryRestrictions,
      )) {
        buffer.write(chunk);
        state = state.copyWith(
          streamingRecipe: buffer.toString(),
          progress: (buffer.length / 2000).clamp(0.0, 1.0),
        );
      }

      // Parse complete recipe
      final result = await repository.generateRecipe(
        state.selectedImage!,
        additionalPrompt: additionalNotes,
        servings: servings,
        dietaryRestrictions: dietaryRestrictions,
      );

      return result.when(
        success: (recipe) {
          state = state.copyWith(
            status: ScanStatus.recipeGenerated,
            streamingRecipe: null,
            progress: 1.0,
          );
          return recipe;
        },
        failure: (error) {
          state = state.copyWith(
            status: ScanStatus.error,
            errorMessage: error.message,
          );
          return null;
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: ScanStatus.error,
        errorMessage: e.toString(),
      );
      return null;
    }
  }

  // Generate recipe without streaming
  Future<RecipeEntity?> generateRecipe({
    int? servings,
    String? dietaryRestrictions,
    String? additionalNotes,
  }) async {
    if (state.selectedImage == null) return null;

    state = state.copyWith(
      status: ScanStatus.generatingRecipe,
      errorMessage: null,
    );

    final repository = ref.read(scanRepositoryProvider);
    final result = await repository.generateRecipe(
      state.selectedImage!,
      additionalPrompt: additionalNotes,
      servings: servings,
      dietaryRestrictions: dietaryRestrictions,
    );

    result.when(
      success: (recipe) {
        state = state.copyWith(
          status: ScanStatus.recipeGenerated,
          streamingRecipe: null,
        );
        return recipe;
      },
      failure: (error) {
        state = state.copyWith(
          status: ScanStatus.error,
          errorMessage: error.message,
        );
        return null;
      },
    );
  }
}

@riverpod
class ScanOptions extends _$ScanOptions {
  @override
  RecipeOptions build() {
    return const RecipeOptions();
  }

  void updateServings(int servings) {
    state = state.copyWith(servings: servings);
  }

  void updateDietaryRestrictions(String restrictions) {
    state = state.copyWith(dietaryRestrictions: restrictions);
  }

  void updateCuisinePreference(String cuisine) {
    state = state.copyWith(cuisinePreference: cuisine);
  }

  void updateComplexity(String complexity) {
    state = state.copyWith(complexity: complexity);
  }

  void addExcludeIngredient(String ingredient) {
    state = state.copyWith(excludeIngredients: [
      ...state.excludeIngredients,
        ingredient,
    ]);
  }

  void updateAdditionalNotes(String notes) {
    state = state.copyWith(additionalNotes: notes);
  }

  void removeExcludeIngredient(String ingredient) {
    state = state.copyWith(
      excludeIngredients: state.excludeIngredients.where((i) => i != ingredient).toList(),
    );
  }

  void reset() {
    state = const RecipeOptions();
  }

}
