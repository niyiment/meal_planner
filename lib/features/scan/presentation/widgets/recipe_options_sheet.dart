import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/core/constants/app_dimension.dart';
import '../../../../core/extensions/extensions.dart';
import '../../data/models/scan_models.dart';


class RecipeOptionsSheet extends ConsumerStatefulWidget {
  const RecipeOptionsSheet({super.key});

  @override
  ConsumerState<RecipeOptionsSheet> createState() => _RecipeOptionsSheetState();
}

class _RecipeOptionsSheetState extends ConsumerState<RecipeOptionsSheet> {
  int _servings = 4;
  String? _selectedDietaryRestriction;
  String? _selectedCuisine;
  String? _selectedComplexity;
  final List<String> _excludedIngredients = [];
  final TextEditingController _notesController = TextEditingController();

  final List<String> _dietaryRestrictions = [
    'None',
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Dairy-Free',
    'Keto',
    'Paleo',
  ];

  final List<String> _cuisines = [
    'Any',
    'Italian',
    'Mexican',
    'Asian',
    'Mediterranean',
    'American',
    'Indian',
    'French',
  ];

  final List<String> _complexities = [
    'Simple',
    'Medium',
    'Complex',
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppDimension.radiusXLarge),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Icon(
                    Icons.tune_rounded,
                    color: context.theme.primaryColor,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Recipe Options',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      }
                    },
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
            ),

            const Divider(),

            // Options
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Servings
                    _buildSectionTitle('Servings'),
                    const SizedBox(height: 12),
                    _buildServingsSlider(),
                    const SizedBox(height: 24),

                    // Dietary Restrictions
                    _buildSectionTitle('Dietary Restrictions'),
                    const SizedBox(height: 12),
                    _buildChipSelection(
                      options: _dietaryRestrictions,
                      selected: _selectedDietaryRestriction,
                      onSelected: (value) {
                        setState(() {
                          _selectedDietaryRestriction = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),

                    // Cuisine Preference
                    _buildSectionTitle('Cuisine Preference'),
                    const SizedBox(height: 12),
                    _buildChipSelection(
                      options: _cuisines,
                      selected: _selectedCuisine,
                      onSelected: (value) {
                        setState(() {
                          _selectedCuisine = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),

                    // Complexity
                    _buildSectionTitle('Complexity'),
                    const SizedBox(height: 12),
                    _buildChipSelection(
                      options: _complexities,
                      selected: _selectedComplexity,
                      onSelected: (value) {
                        setState(() {
                          _selectedComplexity = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),

                    // Additional Notes
                    _buildSectionTitle('Additional Notes (Optional)'),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _notesController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: 'E.g., Make it spicy, use less oil, etc.',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Generate Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: FilledButton(
                onPressed: _generateRecipe,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.auto_awesome),
                    SizedBox(width: 8),
                    Text('Generate Recipe'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildServingsSlider() {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Number of servings'),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(AppDimension.radiusSmall),
                  ),
                  child: Text(
                    '$_servings',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Slider(
              value: _servings.toDouble(),
              min: 1,
              max: 12,
              divisions: 11,
              label: '$_servings servings',
              onChanged: (value) {
                setState(() {
                  _servings = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChipSelection({
    required List<String> options,
    required String? selected,
    required ValueChanged<String> onSelected,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = option == selected;
        return FilterChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              onSelected(option);
            }
          },
          backgroundColor: context.colorScheme.surface,
          selectedColor: context.theme.primaryColor,
          checkmarkColor: Colors.white,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : context.textTheme.bodyMedium?.color,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        );
      }).toList(),
    );
  }

  void _generateRecipe() {
    final options = RecipeOptions(
      servings: _servings,
      dietaryRestrictions: _selectedDietaryRestriction == 'None'
          ? null
          : _selectedDietaryRestriction,
      cuisinePreference: _selectedCuisine == 'Any' ? null : _selectedCuisine,
      complexity: _selectedComplexity?.toLowerCase(),
      excludeIngredients: _excludedIngredients,
      additionalNotes: _notesController.text.isEmpty
          ? null
          : _notesController.text,
    );

    context.pop(options);
  }
}

