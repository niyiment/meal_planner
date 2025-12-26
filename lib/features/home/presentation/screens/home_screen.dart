import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_planner/core/constants/app_dimension.dart';
import 'package:meal_planner/core/theme/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../recipe/presentation/controllers/recipe_controller.dart';
import '../../../recipe/presentation/widgets/recipe_card_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  int _selectedIndex = 0;

  Future<void> _handleCameraCapture() async {
    final status = await Permission.camera.request();

    if (status.isGranted) {
      final image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 2048,
        maxHeight: 2048,
      );

      if (image != null && mounted) {
        context.go('/scan', extra: File(image.path));
      }
    } else if (status.isPermanentlyDenied) {
      if (mounted) {
        _showPermissionDialog('Camera');
      }
    } else {
      if (mounted) {
        context.showErrorSnackBar('Camera permission denied');
      }
    }
  }

  Future<void> _handleGalleryPick() async {
    final status = await Permission.photos.request();

    if (status.isGranted || status.isLimited) {
      final image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image != null && mounted) {
        context.go('/scan', extra: File(image.path));
      }
    } else if (status.isPermanentlyDenied) {
      if (mounted) {
        _showPermissionDialog('Photos');
      }
    } else {
      if (mounted) {
        context.showErrorSnackBar('Photo library permission denied');
      }
    }
  }

  void _showPermissionDialog(String permissionType) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: Text(
          '$permissionType permission is required. Please enable it in settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(context);
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Chef!',
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().fadeIn().slideX(begin: -0.2),
                    const SizedBox(height: 4),
                    Text(
                      'What shall we cook today?',
                      style: context.textTheme.bodyLarge,
                    ).animate(delay: 100.ms).fadeIn().slideX(begin: -0.2),
                  ],
                ),
              ),
            ),

            // Main action cards
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _buildActionCard(
                      icon: Icons.camera_alt_rounded,
                      title: 'Scan Ingredients',
                      description: 'Take a photo of your fridge',
                      onTap: _handleCameraCapture,
                      gradient: AppColors.primaryGradient,
                    ).animate(delay: 200.ms).fadeIn().scale(),

                    const SizedBox(height: 16),

                    _buildActionCard(
                      icon: Icons.photo_library_rounded,
                      title: 'Choose from Gallery',
                      description: 'Select an existing photo',
                      onTap: _handleGalleryPick,
                      gradient: AppColors.accentGradient,
                    ).animate(delay: 300.ms).fadeIn().scale(),
                  ],
                ),
              ),
            ),

            // Recent recipes section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Recipes',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.go('/saved'),
                      child: const Text('See All'),
                    ),
                  ],
                ).animate(delay: 400.ms).fadeIn(),
              ),
            ),

            _buildRecentRecipes(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
    required Gradient gradient,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimension.radiusLarge),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(AppDimension.radiusLarge),
          boxShadow: AppColors.elevatedShadow,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(AppDimension.radiusMedium),
              ),
              child: Icon(icon, size: 32, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentRecipes() {
    final recentRecipesAsync = ref.watch(recentRecipesProvider);

    return recentRecipesAsync.when(
      data: (recipes) {
        if (recipes.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Icon(
                      Icons.restaurant_menu_rounded,
                      size: 64,
                      color: Colors.grey.withValues(alpha: 0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No recipes yet',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Scan your first ingredient to get started!',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                if (index >= recipes.length) return null;
                final recipe = recipes[index];
                return RecipeCardWidget(
                  recipe: recipe,
                  onTap: () => context.go('/recipe/${recipe.id}'),
                ).animate(delay: (50 * index).ms).fadeIn().scale(
                  begin: const Offset(0.8, 0.8),
                );
              },
              childCount: recipes.length > 6 ? 6 : recipes.length,
            ),
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      error: (error, stack) => SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
