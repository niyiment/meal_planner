class AppConstants {
  // API Configuration
  static const String openAiBaseUrl = 'https://api.openai.com/v1';
  static const String geminiBaseUrl = 'https://generativelanguage.googleapis.com/v1beta';

  // API Keys - These should be loaded from environment or secure storage
  static const String openAiApiKeyEnv = 'OPENAI_API_KEY';
  static const String geminiApiKeyEnv = 'GEMINI_API_KEY';

  // Network
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const int maxRetries = 3;

  // Storage Keys
  static const String selectedAiProviderKey = 'selected_ai_provider';
  static const String onboardingCompletedKey = 'onboarding_completed';
  static const String themeModeKey = 'theme_mode';

  // Cache
  static const int maxCachedRecipes = 100;
  static const Duration cacheExpiration = Duration(days: 30);

  // Image Processing
  static const int maxImageSize = 2048;
  static const int imageQuality = 85;

  // AI Models
  static const String openAiVisionModel = 'gpt-4-vision-preview';
  static const String geminiVisionModel = 'gemini-pro-vision';

  // App Info
  static const String appName = 'AI Meal Planner';
  static const String appVersion = '1.0.0';
}

enum AiProvider {
  openai('OpenAI', 'GPT-4 Vision'),
  gemini('Google', 'Gemini Pro Vision');

  const AiProvider(this.displayName, this.modelName);
  final String displayName;
  final String modelName;
}

enum RecipeComplexity {
  simple('Simple', 'Quick & Easy'),
  medium('Medium', 'Moderate Effort'),
  complex('Complex', 'Advanced Cooking');

  const RecipeComplexity(this.label, this.description);
  final String label;
  final String description;
}
