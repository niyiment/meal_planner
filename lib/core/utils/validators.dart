class Validators {
  /// Validate API key format
  static String? validateApiKey(String? value) {
    if (value == null || value.isEmpty) {
      return 'API key is required';
    }

    if (value.length < 20) {
      return 'API key seems too short';
    }

    return null;
  }

  /// Validate recipe name
  static String? validateRecipeName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Recipe name is required';
    }

    if (value.length < 3) {
      return 'Recipe name must be at least 3 characters';
    }

    if (value.length > 100) {
      return 'Recipe name must be less than 100 characters';
    }

    return null;
  }

  /// Validate ingredients
  static String? validateIngredients(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingredients are required';
    }

    if (value.length < 10) {
      return 'Please provide more details about ingredients';
    }

    return null;
  }

  /// Validate cooking time
  static String? validateCookingTime(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Optional field
    }

    final time = int.tryParse(value);
    if (time == null) {
      return 'Please enter a valid number';
    }

    if (time < 1) {
      return 'Cooking time must be at least 1 minute';
    }

    if (time > 1440) {
      return 'Cooking time seems too long';
    }

    return null;
  }

  /// Validate servings
  static String? validateServings(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Optional field
    }

    final servings = int.tryParse(value);
    if (servings == null) {
      return 'Please enter a valid number';
    }

    if (servings < 1) {
      return 'Servings must be at least 1';
    }

    if (servings > 100) {
      return 'Servings seems too high';
    }

    return null;
  }

  /// Validate not empty
  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validate minimum length
  static String? validateMinLength(String? value, int minLength, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    if (value.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }

    return null;
  }

  /// Validate maximum length
  static String? validateMaxLength(String? value, int maxLength, String fieldName) {
    if (value != null && value.length > maxLength) {
      return '$fieldName must be less than $maxLength characters';
    }

    return null;
  }

  /// Validate URL
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Optional field
    }

    final urlPattern = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );

    if (!urlPattern.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }
}
