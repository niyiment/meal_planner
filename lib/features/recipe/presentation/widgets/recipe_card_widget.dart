import 'package:flutter/material.dart';
import 'package:meal_planner/core/constants/app_dimension.dart';
import 'package:meal_planner/core/theme/app_colors.dart';
import '../../../../core/extensions/extensions.dart';
import '../../domain/entities/recipe_entity.dart';


class RecipeCardWidget extends StatelessWidget {
  final RecipeEntity recipe;
  final VoidCallback? onTap;

  const RecipeCardWidget({
    super.key,
    required this.recipe,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimension.radiusLarge),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image or placeholder
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                    ),
                    child: recipe.imageUrl != null
                        ? Image.network(
                      recipe.imageUrl!,
                      fit: BoxFit.cover,
                    )
                        : const Icon(
                      Icons.restaurant_rounded,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                  // Gradient overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Saved indicator
                  if (recipe.isSaved)
                     Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.bookmark_rounded,
                        color: AppColors.warningColor,
                        size: 24,
                      ),
                    ),
                  // Complexity badge
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getComplexityColor(recipe.complexity)
                            .withOpacity(0.9),
                        borderRadius:
                        BorderRadius.circular(AppDimension.radiusSmall),
                      ),
                      child: Text(
                        recipe.complexity.displayName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        if (recipe.cookingTime != null) ...[
                          const Icon(
                            Icons.schedule_rounded,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${recipe.cookingTime}m',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        if (recipe.servings != null) ...[
                          const Icon(
                            Icons.people_rounded,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${recipe.servings}',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getComplexityColor(RecipeComplexity complexity) {
    switch (complexity) {
      case RecipeComplexity.simple:
        return AppColors.successColor;
      case RecipeComplexity.medium:
        return AppColors.warningColor;
      case RecipeComplexity.complex:
        return AppColors.errorColor;
    }
  }
}

