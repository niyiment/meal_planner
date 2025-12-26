
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class RecipeTags extends StatelessWidget {
  final List<String> tags;

  const RecipeTags({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags.map((tag) {
        return Chip(
          label: Text(tag),
          backgroundColor: _getColorForTag(tag),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        );
      }).toList(),
    );
  }

  Color _getColorForTag(String tag) {
    final lowerTag = tag.toLowerCase();

    if (lowerTag.contains('quick') || lowerTag.contains('easy')) {
      return AppColors.successColor;
    }
    if (lowerTag.contains('healthy') || lowerTag.contains('diet')) {
      return AppColors.successColor;
    }
    if (lowerTag.contains('vegetarian') || lowerTag.contains('vegan')) {
      return const Color(0xFF06D6A0);
    }
    if (lowerTag.contains('spicy') || lowerTag.contains('hot')) {
      return AppColors.errorColor;
    }
    if (lowerTag.contains('italian') || lowerTag.contains('mexican') ||
        lowerTag.contains('asian') || lowerTag.contains('indian')) {
      return AppColors.warningColor;
    }

    return AppColors.infoColor;
  }
}

