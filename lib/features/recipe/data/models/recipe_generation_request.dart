import 'dart:io';

/// Recipe generation request
class RecipeGenerationRequest {
  final File image;
  final String? additionalPrompt;
  final int? servings;
  final String? dietaryRestrictions;
  final String? complexity;
  final List<String>? excludeIngredients;

  const RecipeGenerationRequest({
    required this.image,
    this.additionalPrompt,
    this.servings,
    this.dietaryRestrictions,
    this.complexity,
    this.excludeIngredients,
  });

  /// Build system prompt for AI
  String buildPrompt() {
    final buffer = StringBuffer();

    buffer.write('You are a professional chef and nutritionist. ');
    buffer.write('Analyze the image of ingredients and create a detailed recipe.\n');
    buffer.write('Please provide the response in the following JSON format:\n');
    buffer.write('{ "name": "Recipe name", "description": "Brief description",\n');
    buffer.write('  "ingredients": ["ingredient 1", "ingredient 2", ...],\n');
    buffer.write('  "steps": [{"stepNumber": 1, "instruction": "Step instruction", "duration": 5}, ...],\n');
    buffer.write('  "nutritionInfo": {"calories": 450,"protein": 25.5,"carbohydrates": 30.0,\n');
    buffer.write('  "fat": 15.0,"fiber": 5.0,"sugar": 8.0,"sodium": 400 },\n');
    buffer.write('  "cookingTime": 30, "servings": 4, "complexity": "medium",\n');
    buffer.write('  "tags": ["tag1", "tag2", ...]}\n');

    if (servings != null) {
      buffer.write('Servings: $servings\n');
    }

    if (dietaryRestrictions != null && dietaryRestrictions!.isNotEmpty) {
      buffer.write('Dietary restrictions: $dietaryRestrictions\n');
    }

    if (excludeIngredients != null && excludeIngredients!.isNotEmpty) {
      buffer.write('Exclude these ingredients: ${excludeIngredients!.join(", ")}\n');
    }

    if (complexity != null) {
      buffer.write('Recipe complexity: $complexity\n');
    }

    if (additionalPrompt != null && additionalPrompt!.isNotEmpty) {
      buffer.write('Additional requirements: $additionalPrompt\n');
    }

    buffer.write('\nProvide only the JSON response, no additional text.');

    return buffer.toString();
  }
}
