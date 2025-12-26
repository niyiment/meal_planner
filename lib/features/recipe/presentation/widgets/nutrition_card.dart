
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meal_planner/core/constants/app_dimension.dart';
import 'package:meal_planner/core/theme/app_colors.dart';
import '../../../../core/extensions/extensions.dart';
import '../../domain/entities/recipe_entity.dart';


class NutritionCard extends StatelessWidget {
  final NutritionInfo nutritionInfo;

  const NutritionCard({super.key, required this.nutritionInfo});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        // crossAxisAlignment: .start,
        children: [
          Text(
            'Nutrition Information',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Per serving',
            style: context.textTheme.bodySmall?.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),

          // Calories card
          if (nutritionInfo.calories != null)
            Card(
              elevation: 0,
              color: context.theme.primaryColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.theme.primaryColor,
                        borderRadius: BorderRadius.circular(AppDimension.radiusSmall),
                      ),
                      child: const Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${nutritionInfo.calories}',
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColor,
                          ),
                        ),
                        const Text('Calories'),
                      ],
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn().scale(),

          // Macronutrients grid
          SizedBox(
              height: size.height * 0.3,
              child: _buildMacronutrientsGrid(context)
          ),

          // Micronutrients
          SizedBox(
              height: size.height * 0.15,
              child: _buildMicronutrients(context),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMacronutrientsGrid(BuildContext context) {
    final macros = [
      _MacroData(
        'Protein',
        nutritionInfo.protein,
        'g',
        Icons.fitness_center_rounded,
        context.theme.primaryColor,
      ),
      _MacroData(
        'Carbs',
        nutritionInfo.carbohydrates,
        'g',
        Icons.grain_rounded,
        context.theme.colorScheme.secondary,
      ),
      _MacroData(
        'Fat',
        nutritionInfo.fat,
        'g',
        Icons.opacity_rounded,
        context.theme.colorScheme.secondary,
      ),
      _MacroData(
        'Fiber',
        nutritionInfo.fiber,
        'g',
        Icons.eco_rounded,
        AppColors.successColor,
      ),
    ].where((macro) => macro.value != null).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      itemCount: macros.length,
      itemBuilder: (context, index) {
        final macro = macros[index];
        return _buildMacroCard(context, macro, index);
      },
    );
  }

  Widget _buildMacroCard(BuildContext context, _MacroData macro, int index) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  macro.icon,
                  color: macro.color,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  macro.name,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${macro.value!.toStringAsFixed(1)}${macro.unit}',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: macro.color,
              ),
            ),
          ],
        ),
      ),
    ).animate(delay: (50 * index).ms).fadeIn().scale(begin: const Offset(0.8, 0.8));
  }

  Widget _buildMicronutrients(BuildContext context) {
    final micros = <Widget>[];

    if (nutritionInfo.sugar != null) {
      micros.add(_buildMicroRow(
        'Sugar',
        '${nutritionInfo.sugar!.toStringAsFixed(1)}g',
        Icons.cake_rounded,
      ));
    }

    if (nutritionInfo.sodium != null) {
      micros.add(_buildMicroRow(
        'Sodium',
        '${nutritionInfo.sodium}mg',
        Icons.water_drop_rounded,
      ));
    }

    if (micros.isEmpty) return const SizedBox.shrink();

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Other Nutrients',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...micros,
          ],
        ),
      ),
    ).animate().fadeIn().slideY(begin: 0.1);
  }

  Widget _buildMicroRow(String name, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Text(name),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _MacroData {
  final String name;
  final double? value;
  final String unit;
  final IconData icon;
  final Color color;

  _MacroData(this.name, this.value, this.unit, this.icon, this.color);
}



