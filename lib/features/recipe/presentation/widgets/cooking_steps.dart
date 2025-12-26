import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meal_planner/core/constants/app_dimension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/extensions/extensions.dart';
import '../../domain/entities/recipe_entity.dart';

class CookingSteps extends StatefulWidget {
  final List<RecipeStep> steps;

  const CookingSteps({super.key, required this.steps});

  @override
  State<CookingSteps> createState() => _CookingStepsState();
}

class _CookingStepsState extends State<CookingSteps> {
  int _currentStep = 0;
  final Set<int> _completedSteps = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with progress
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cooking Steps',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: context.theme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppDimension.radiusSmall),
                ),
                child: Text(
                  '${_completedSteps.length}/${widget.steps.length}',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Progress bar
          LinearProgressIndicator(
            value: widget.steps.isEmpty
                ? 0
                : _completedSteps.length / widget.steps.length,
            backgroundColor: Colors.grey.withValues(alpha: 0.2),
            valueColor: const AlwaysStoppedAnimation(AppColors.successColor),
          ),

          const SizedBox(height: 24),

          // Steps list
          Expanded(
            child: ListView.separated(
              itemCount: widget.steps.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final step = widget.steps[index];
                final isCompleted = _completedSteps.contains(index);
                final isCurrent = index == _currentStep;

                return _buildStepCard(
                  step: step,
                  index: index,
                  isCompleted: isCompleted,
                  isCurrent: isCurrent,
                );
              },
            ),
          ),

          // Navigation buttons
          const SizedBox(height: 16),
          Row(
            children: [
              if (_currentStep > 0)
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _currentStep--;
                      });
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('Previous'),
                  ),
                ),
              if (_currentStep > 0 && _currentStep < widget.steps.length - 1)
                const SizedBox(width: 12),
              if (_currentStep < widget.steps.length - 1)
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      setState(() {
                        _completedSteps.add(_currentStep);
                        _currentStep++;
                      });
                    },
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: const Text('Next Step'),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard({
    required RecipeStep step,
    required int index,
    required bool isCompleted,
    required bool isCurrent,
  }) {
    return Card(
      elevation: isCurrent ? 4 : 0,
      color: isCompleted
          ? AppColors.successColor.withOpacity(0.05)
          : isCurrent
          ? context.theme.primaryColor.withOpacity(0.05)
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimension.radiusLarge),
        side: BorderSide(
          color: isCompleted
              ? AppColors.successColor
              : isCurrent
              ? context.theme.primaryColor
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _currentStep = index;
          });
        },
        borderRadius: BorderRadius.circular(AppDimension.radiusLarge),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step number and checkbox
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isCompleted
                          ? AppColors.successColor
                          : isCurrent
                          ? context.theme.primaryColor
                          : Colors.grey.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: isCompleted
                          ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 24,
                      )
                          : Text(
                        '${step.stepNumber}',
                        style: TextStyle(
                          color: isCurrent ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Step ${step.stepNumber}',
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isCompleted
                                ? AppColors.successColor
                                : isCurrent
                                ? context.theme.primaryColor
                                : null,
                          ),
                        ),
                        if (step.duration != null)
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule_rounded,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${step.duration} min',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: isCompleted,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _completedSteps.add(index);
                        } else {
                          _completedSteps.remove(index);
                        }
                      });
                    },
                    activeColor: AppColors.successColor,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Instruction
              Text(
                step.instruction,
                style: context.textTheme.bodyLarge?.copyWith(
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: isCompleted ? Colors.grey : null,
                  height: 1.6,
                ),
              ),

              // Tips
              if (step.tips != null && step.tips!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.tertiary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppDimension.radiusSmall),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lightbulb_rounded,
                            size: 16,
                            color: context.theme.colorScheme.tertiary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Tips',
                            style: context.textTheme.labelMedium?.copyWith(
                              color: context.theme.colorScheme.tertiary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ...step.tips!.map((tip) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• '),
                            Expanded(
                              child: Text(
                                tip,
                                style: context.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    ).animate(delay: (50 * index).ms).fadeIn().slideX(begin: 0.2);
  }
}

