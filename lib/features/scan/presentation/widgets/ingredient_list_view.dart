
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meal_planner/core/constants/app_dimension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/extensions/extensions.dart';

class IngredientListView extends StatelessWidget {
  final List<String> ingredients;

  const IngredientListView({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimension.radiusLarge),
        side: BorderSide(
          color: AppColors.successColor.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.successColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppDimension.radiusSmall),
                  ),
                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.successColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingredients Detected',
                        style: context.textTheme.titleLarge,
                      ),
                      Text(
                        '${ingredients.length} items found',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ingredients.asMap().entries.map((entry) {
                final index = entry.key;
                final ingredient = entry.value;
                return _buildIngredientChip(context, ingredient, index);
              }).toList(),
            ),
          ],
        ),
      ),
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _buildIngredientChip(BuildContext context, String ingredient, int index) {
    return Chip(
      label: Text(ingredient.capitalize),
      avatar: CircleAvatar(
        backgroundColor: context.theme.primaryColor.withValues(alpha: 0.2),
        child: Text(
          '${index + 1}',
          style: TextStyle(
            fontSize: 12,
            color: context.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: context.theme.primaryColor.withValues(alpha: 0.05),
      side: BorderSide(
        color: context.theme.primaryColor.withValues(alpha: 0.2),
        width: 1,
      ),
    ).animate(delay: (50 * index).ms).fadeIn().scale(begin: const Offset(0.8, 0.8));
  }
}

