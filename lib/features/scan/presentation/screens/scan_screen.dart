
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/core/constants/app_dimension.dart';
import 'package:meal_planner/core/routes/app_router.dart';
import 'package:meal_planner/core/theme/app_colors.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../recipe/presentation/controllers/recipe_controller.dart';
import '../../data/models/scan_models.dart';
import '../controllers/scan_controller.dart';
import '../widgets/image_preview_card.dart';
import '../widgets/ingredient_list_view.dart';
import '../widgets/recipe_options_sheet.dart';
import '../widgets/streaming_recipe_view.dart';


class ScanScreen extends ConsumerStatefulWidget {
  final File? image;

  const ScanScreen({super.key, this.image});

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.image != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(scanControllerProvider.notifier).setImage(widget.image!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanState = ref.watch(scanControllerProvider);
    final scanNotifier = ref.read(scanControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Ingredients'),
        actions: [
          if (scanState.status == ScanStatus.imageSelected ||
              scanState.status == ScanStatus.ingredientsDetected)
            IconButton(
              onPressed: () {
                scanNotifier.clearScan();
                if (context.canPop()) {
                  context.pop();
                }
              },
              icon: const Icon(Icons.refresh_rounded),
              tooltip: 'Start Over',
            ),
        ],
      ),
      body: SafeArea(
        child: _buildBody(scanState, scanNotifier),
      ),
    );
  }

  Widget _buildBody(ScanState state, ScanController notifier) {
    if (state.status == ScanStatus.error) {
      return _buildErrorView(state.errorMessage ?? 'An error occurred');
    }

    return Column(
      children: [
        // Image Preview
        if (state.selectedImage != null)
          Padding(
            padding: const EdgeInsets.all(16),
            child: ImagePreviewCard(
              image: state.selectedImage!,
            ),
          ).animate().fadeIn().slideY(begin: -0.2),

        // Content based on status
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state.status == ScanStatus.imageSelected)
                  _buildInitialActions(context, notifier),

                if (state.status == ScanStatus.detectingIngredients)
                  _buildDetectingView(),

                if (state.status == ScanStatus.ingredientsDetected)
                  Column(
                    children: [
                      IngredientListView(
                        ingredients: state.detectedIngredients,
                      ),
                      const SizedBox(height: 24),
                      _buildGenerateButton(notifier),
                    ],
                  ),

                if (state.status == ScanStatus.generatingRecipe)
                  StreamingRecipeView(
                    streamingText: state.streamingRecipe ?? '',
                    progress: state.progress,
                  ),

                if (state.status == ScanStatus.recipeGenerated)
                  _buildSuccessView(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInitialActions(BuildContext context, ScanController notifier) {
    return Column(
      children: [
        Icon(
          Icons.auto_awesome,
          size: 64,
          color: context.theme.primaryColor,
        ).animate().scale(delay: 200.ms),
        const SizedBox(height: 16),
        Text(
          'Image Ready!',
          style: context.textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          'Let\'s analyze your ingredients and create an amazing recipe.',
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        FilledButton.icon(
          onPressed: () => notifier.detectIngredients(),
          icon: const Icon(Icons.search_rounded),
          label: const Text('Detect Ingredients'),
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.all(20),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => _showOptionsAndGenerate(notifier),
          icon: const Icon(Icons.tune_rounded),
          label: const Text('Generate with Options'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 300.ms);
  }

  Widget _buildDetectingView() {
    return Column(
      children: [
        const SizedBox(height: 32),
        const CircularProgressIndicator(),
        const SizedBox(height: 24),
        Text(
          'Analyzing ingredients...',
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Using AI to identify what\'s in your photo',
          style: context.textTheme.bodySmall?.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    ).animate().fadeIn();
  }

  Widget _buildGenerateButton(ScanController notifier) {
    return FilledButton.icon(
      onPressed: () => _showOptionsAndGenerate(notifier),
      icon: const Icon(Icons.restaurant_rounded),
      label: const Text('Generate Recipe'),
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(20),
        minimumSize: const Size(double.infinity, 56),
      ),
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _buildSuccessView(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.successColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppDimension.radiusLarge),
            border: Border.all(
              color: AppColors.successColor.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.check_circle_rounded,
                size: 64,
                color: AppColors.successColor,
              ),
              const SizedBox(height: 16),
              Text(
                'Recipe Generated!',
                style: context.textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Your recipe has been created and saved',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ).animate().scale().fadeIn(),
      ],
    );
  }

  Widget _buildErrorView(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: AppColors.errorColor,
            ),
            const SizedBox(height: 16),
            Text(
              'Oops! Something went wrong',
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                ref.read(scanControllerProvider.notifier).clearScan();
                context.go(AppRoutes.home);
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showOptionsAndGenerate(ScanController notifier) async {
    final options = await showModalBottomSheet<RecipeOptions>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const RecipeOptionsSheet(),
    );

    if (options != null && mounted) {
      final recipe = await notifier.generateRecipeStreaming(
        servings: options.servings,
        dietaryRestrictions: options.dietaryRestrictions,
        additionalNotes: options.additionalNotes,
      );

      if (recipe != null && mounted) {
        await ref.read(recipeControllerProvider.notifier).saveRecipe(recipe);

        if (mounted) {
          context.go('/recipe/${recipe.id}');
        }
      }
    }
  }
}
