
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meal_planner/core/extensions/extensions.dart';
import 'package:meal_planner/core/theme/app_colors.dart';


class StreamingRecipeView extends StatelessWidget {
  final String streamingText;
  final double progress;

  const StreamingRecipeView({
    super.key,
    required this.streamingText,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Progress indicator
        Card(
          elevation: 0,
          color: context.theme.primaryColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Generating Recipe...',
                            style: context.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'AI is crafting your perfect recipe',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation(
                    context.theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ).animate(onPlay: (controller) => controller.repeat())
            .shimmer(duration: 2000.ms, color: Colors.white.withOpacity(0.3)),

        const SizedBox(height: 16),

        // Streaming text
        if (streamingText.isNotEmpty)
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: AppColors.warningColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Recipe Preview',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: Text(
                      streamingText,
                      style: context.textTheme.bodyMedium?.copyWith(
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Typing indicator
                  Row(
                    children: [
                      _buildTypingDot(context, 0),
                      const SizedBox(width: 4),
                      _buildTypingDot(context, 1),
                      const SizedBox(width: 4),
                      _buildTypingDot(context, 2),
                    ],
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(),
      ],
    );
  }

  Widget _buildTypingDot(BuildContext context, int index) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        shape: BoxShape.circle,
      ),
    ).animate(onPlay: (controller) => controller.repeat())
        .fadeOut(
      delay: (200 * index).ms,
      duration: 600.ms,
    );
  }
}

