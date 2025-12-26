import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  // App Info
  static String get appName => dotenv.env['APP_NAME'] ?? 'AI Meal Planner';
  static String get appVersion => dotenv.env['APP_VERSION'] ?? '1.0.0';
  static bool get enableAnalytics => dotenv.env['ENABLE_ANALYTICS']?.toLowerCase() == 'true';
  static bool get enableCrashlytics => dotenv.env['ENABLE_CRASHLYTICS']?.toLowerCase() == 'true';

  // API Configuration
  static String get openAiBaseUrl => dotenv.env['OPENAI_BASE_URL'] ?? 'https://api.openai.com/v1';
  static String get geminiBaseUrl => dotenv.env['GEMINI_BASE_URL'] ?? 'https://generativelanguage.googleapis.com/v1beta';

  // API Keys - These should be loaded from environment or secure storage
  static String get openAiApiKey => dotenv.env['OPENAI_API_KEY'] ?? 'Your OpenAI API key';
  static String get geminiApiKey => dotenv.env['GEMINI_API_KEY'] ?? 'Your Gemini API key';

  // AI Models
  static const String openAiVisionModel = 'gpt-5-nano';
  static const String geminiVisionModel = 'gemini-pro-vision';

  // Network
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds:60);
  static const int maxRetries = 3;

  // Storage Keys
  static const String selectedAiProviderKey = 'selected_ai_provider';
  static const String onboardingCompletedKey = 'onboarding_completed';
  static const String themeModeKey = 'theme_mode';

  // Cache
  static const int maxCachedRecipes = 100;
  static const Duration cacheExpiration = Duration(days: 7);

  // Image Processing
  static const int maxImageSize = 2048;
  static const int imageQuality = 85;
}

enum AiProvider {
  openai('OpenAI', 'GPT-4 Vision'),
  gemini('Google', 'Gemini Pro Vision');

  const AiProvider(this.displayName, this.modelName);
  final String displayName;
  final String modelName;
}

enum RecipeComplexityEnum {
  simple('Simple', 'Quick & Easy'),
  medium('Medium', 'Moderate Effort'),
  complex('Complex', 'Advanced Cooking');

  const RecipeComplexityEnum(this.label, this.description);
  final String label;
  final String description;
}


