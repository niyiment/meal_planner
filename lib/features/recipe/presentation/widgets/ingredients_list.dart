import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meal_planner/core/constants/app_dimension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/extensions/extensions.dart';


class IngredientsList extends StatefulWidget {
  final List<String> ingredients;
  final int? servings;

  const IngredientsList({
    super.key,
    required this.ingredients,
    this.servings,
  });

  @override
  State<IngredientsList> createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  final Set<int> _checkedIngredients = {};

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ingredients',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.servings != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppDimension.radiusSmall),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.people_rounded,
                        size: 16,
                        color: context.theme.primaryColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.servings} servings',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),

          // Ingredients list
          Expanded(
            child: ListView.separated(
              itemCount: widget.ingredients.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final ingredient = widget.ingredients[index];
                final isChecked = _checkedIngredients.contains(index);

                return CheckboxListTile(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _checkedIngredients.add(index);
                      } else {
                        _checkedIngredients.remove(index);
                      }
                    });
                  },
                  title: Text(
                    ingredient,
                    style: TextStyle(
                      decoration: isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: isChecked ? Colors.grey : null,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColors.successColor,
                ).animate(delay: (50 * index).ms).fadeIn().slideX(begin: -0.2);
              },
            ),
          ),

          // Shopping list button
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _createShoppingList,
            icon: const Icon(Icons.shopping_cart_rounded),
            label: const Text('Create Shopping List'),
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }

  void _createShoppingList() {
    final unchecked = widget.ingredients
        .asMap()
        .entries
        .where((entry) => !_checkedIngredients.contains(entry.key))
        .map((entry) => entry.value)
        .toList();

    if (unchecked.isEmpty) {
      context.showSnackBar('All ingredients are checked!');
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Text(
              'Shopping List',
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Items needed:',
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...unchecked.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 6,
                    color: context.theme.primaryColor,
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(item)),
                ],
              ),
            )),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

