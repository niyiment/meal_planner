import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_planner/features/home/presentation/screens/main_navigation_shell.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/recipe/presentation/screens/recipe_detail_screen.dart';
import '../../features/recipe/presentation/screens/saved_recipes_screen.dart';
import '../../features/scan/presentation/screens/scan_screen.dart';


// Route names
class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String scan = '/scan';
  static const String recipeDetail = '/recipe/:id';
  static const String savedRecipes = '/saved';
}

// Router provider
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    routes: [
      // Home
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const MainNavigationShell(
              currentIndex: 0,
              child: HomeScreen(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.savedRecipes,
        name: 'savedRecipes',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const MainNavigationShell(
            currentIndex: 1,
            child: SavedRecipesScreen(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.scan,
        name: 'scan',
        builder: (context, state) {
          final image = state.extra as File?;
          return ScanScreen(image: image);
        },
      ),
      GoRoute(
        path: AppRoutes.recipeDetail,
        name: 'recipeDetail',
        builder: (context, state) {
          final recipeId = state.pathParameters['id']!;
          return RecipeDetailScreen(recipeId: recipeId);
        },
      ),
    ],
    errorBuilder: (context, state) => ErrorWidget(error: state.error),
  );
});

class ErrorWidget extends StatelessWidget {
  final Exception? error;

  const ErrorWidget({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: ${error.toString()}'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}

