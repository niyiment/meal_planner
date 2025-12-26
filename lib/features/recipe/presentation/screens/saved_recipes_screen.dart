import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/extensions.dart';
import '../controllers/recipe_controller.dart';
import '../widgets/recipe_card_widget.dart';


class SavedRecipesScreen extends ConsumerWidget {
  const SavedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedRecipesStream = ref.watch(savedRecipesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Recipes'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement search
              context.showSnackBar('Search coming soon!');
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: savedRecipesStream.when(
        data: (recipes) {
          if (recipes.isEmpty) {
            return _buildEmptyState(context);
          }
          return _buildRecipesList(context, recipes);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 64,
                color: context.theme.colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading recipes',
                style: context.textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(error.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bookmark_border_rounded,
              size: 120,
              color: Colors.grey,
            ).animate().scale(delay: 200.ms),
            const SizedBox(height: 24),
            Text(
              'No Saved Recipes',
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Recipes you save will appear here.\nStart scanning ingredients to create your first recipe!',
              style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.go('/home'),
              icon: const Icon(Icons.camera_alt_rounded),
              label: const Text('Scan Ingredients'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ).animate().fadeIn(delay: 300.ms),
      ),
    );
  }

  Widget _buildRecipesList(BuildContext context, List<dynamic> recipes) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                 Icon(
                  Icons.bookmark_rounded,
                  color: context.theme.primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  '${recipes.length} ${recipes.length == 1 ? 'Recipe' : 'Recipes'}',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ).animate().fadeIn(),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final recipe = recipes[index];
                return RecipeCardWidget(
                  recipe: recipe,
                  onTap: () => context.go('/recipe/${recipe.id}'),
                ).animate(delay: (50 * index).ms).fadeIn().scale(
                  begin: const Offset(0.8, 0.8),
                );
              },
              childCount: recipes.length,
            ),
          ),
        ),

        const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
      ],
    );
  }
}

