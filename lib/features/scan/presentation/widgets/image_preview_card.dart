
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meal_planner/core/constants/app_dimension.dart';
import 'package:meal_planner/core/theme/app_colors.dart';
import 'package:meal_planner/core/extensions/extensions.dart';

class ImagePreviewCard extends StatelessWidget {
  final File image;

  const ImagePreviewCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimension.radiusLarge),
        boxShadow: AppColors.cardShadow,
      ),
      child: Stack(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimension.radiusLarge),
            child: Image.file(
              image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimension.radiusLarge),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

