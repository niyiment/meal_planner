import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/core/constants/app_dimension.dart';
import 'package:meal_planner/core/theme/app_colors.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../../core/extensions/extensions.dart';
import '../../domain/entities/recipe_entity.dart';
import '../controllers/recipe_controller.dart';
import '../widgets/nutrition_card.dart';
import '../widgets/ingredients_list.dart';
import '../widgets/cooking_steps.dart';
import '../widgets/recipe_tags.dart';

class RecipeDetailScreen extends ConsumerStatefulWidget {
  final String recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  ConsumerState<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends ConsumerState<RecipeDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipeAsync = ref.watch(recipeByIdProvider(widget.recipeId));

    return Scaffold(
      body: recipeAsync.when(
        data: (recipe) {
          if (recipe == null) {
            return _buildNotFoundView();
          }
          return _buildRecipeDetail(recipe);
        },
        loading: () => _buildLoadingView(),
        error: (error, stack) => _buildErrorView(error.toString()),
      ),
    );
  }

  Widget _buildRecipeDetail(RecipeEntity recipe) {
    return CustomScrollView(
      slivers: [
        // App Bar with Image
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(AppDimension.radiusSmall),
              ),
              child: Text(
                recipe.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            background: recipe.imageUrl != null
                ? Image.network(recipe.imageUrl!, fit: BoxFit.cover)
                : Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                    ),
                    child: const Icon(
                      Icons.restaurant_rounded,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
          ),
          leading: IconButton(
            onPressed: () => context.go('/home'),
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () => _toggleSaved(recipe),
              icon: Icon(
                recipe.isSaved
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_outline_rounded,
                color: Colors.black,
              ),
            ),
            PopupMenuButton(
              iconColor: Colors.black,
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () => _exportPdf(recipe),
                  child: const Row(
                    children: [
                      Icon(Icons.picture_as_pdf_rounded, color: Colors.black),
                      SizedBox(width: 12),
                      Text('Export PDF'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => _deleteRecipe(recipe),
                  child: const Row(
                    children: [
                      Icon(Icons.delete_rounded, color: AppColors.errorColor),
                      SizedBox(width: 12),
                      Text(
                        'Delete',
                        style: TextStyle(color: AppColors.errorColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        // Content
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Info Card
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.description,
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 16,
                          runSpacing: 8,
                          children: [
                            _buildInfoChip(
                              Icons.schedule_rounded,
                              '${recipe.cookingTime ?? "??"} min',
                            ),
                            _buildInfoChip(
                              Icons.people_rounded,
                              '${recipe.servings ?? "??"} servings',
                            ),
                            _buildInfoChip(
                              Icons.signal_cellular_alt_rounded,
                              recipe.complexity.displayName,
                            ),
                          ],
                        ),
                        if (recipe.tags.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          RecipeTags(tags: recipe.tags),
                        ],
                      ],
                    ),
                  ),
                ).animate().fadeIn().slideY(begin: 0.1),
              ),

              // Tabs
              TabBar(
                controller: _tabController,
                labelColor: context.theme.primaryColor,
                tabs: const [
                  Tab(text: 'Ingredients'),
                  Tab(text: 'Steps'),
                  Tab(text: 'Nutrition'),
                ],
              ),

              // Tab Views
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    IngredientsList(
                      ingredients: recipe.ingredients,
                      servings: recipe.servings,
                    ),
                    CookingSteps(steps: recipe.steps),
                    recipe.nutritionInfo != null
                        ? NutritionCard(nutritionInfo: recipe.nutritionInfo!)
                        : _buildNoNutritionView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      backgroundColor: context.theme.primaryColor.withValues(alpha: 0.1),
      side: BorderSide.none,
    );
  }

  Widget _buildNoNutritionView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 64,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Nutrition information not available',
            style: context.textTheme.bodyLarge?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingView() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildNotFoundView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off_rounded, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text('Recipe not found', style: context.textTheme.headlineSmall),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 64,
            color: context.theme.colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text('Error loading recipe', style: context.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(error),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleSaved(RecipeEntity recipe) async {
    await ref.read(recipeControllerProvider.notifier).toggleSaved(recipe);
    if (mounted) {
      context.showSnackBar(
        recipe.isSaved ? 'Removed from saved' : 'Added to saved',
      );
    }
  }

  Future<void> _exportPdf(RecipeEntity recipe) async {
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (context) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                child: pw.Text(
                  recipe.name,
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(recipe.description),
              pw.SizedBox(height: 20),
              pw.Header(level: 1, text: 'Ingredients'),
              ...recipe.ingredients.map(
                (ingredient) => pw.Bullet(text: ingredient),
              ),
              pw.SizedBox(height: 20),
              pw.Header(level: 1, text: 'Instructions'),
              ...recipe.steps.map(
                (step) => pw.Paragraph(
                  text: '${step.stepNumber}. ${step.instruction}',
                ),
              ),
            ],
          ),
        ),
      );

      await Printing.layoutPdf(onLayout: (format) async => pdf.save());

      if (mounted) {
        context.showSnackBar('PDF exported successfully');
      }
    } catch (e) {
      if (mounted) {
        context.showErrorSnackBar('Failed to export PDF: $e');
      }
    }
  }

  Future<void> _deleteRecipe(RecipeEntity recipe) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Recipe'),
        content: Text('Are you sure you want to delete "${recipe.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: context.theme.colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await ref.read(recipeControllerProvider.notifier).deleteRecipe(recipe.id);
      if (mounted) {
        context.pop();
        context.showSnackBar('Recipe deleted');
      }
    }
  }
}
