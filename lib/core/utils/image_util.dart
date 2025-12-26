

import 'package:image/image.dart' as img;
import 'package:meal_planner/core/constants/app_constant.dart';
import 'dart:io';

import '../errors/exceptions.dart';

class ImageUtil {
  /// Compress and resize image to meet size requirements
  static Future<File> compressImage(File imageFile) async {
    try {
      // Read image file
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);
      if (image == null) {
        throw const InvalidImageFormatException();
      }

      // Calculate new dimensions while maintaining aspect ratio
      final resizeImage = _resizeImage(image);

      // Compress image
      final compressedImage = img.encodeJpg(
        resizeImage,
        quality: AppConstants.imageQuality,
      );

      // Write compressed image to temporary file
      final compressedFile = File('${imageFile.path}_compressed.jpg');
      await compressedFile.writeAsBytes(compressedImage);

      return compressedFile;
    } catch (e) {
      if (e is ImageException) rethrow;
      throw ImageException('Failed to compress image: $e');
    }
  }

  // Resize image to meet size requirements
  static img.Image _resizeImage(img.Image image) {
    final maxSize = AppConstants.maxImageSize;
    final width = image.width;
    final height = image.height;

    if (width <= maxSize && height <= maxSize) {
      return image;
    }

    // Calculate scale factor
    final scale = maxSize / (width > height ? width : height);
    final newHeight = (height * scale).round();
    final newWidth = (width * scale).round();

    return img.copyResize(
        image,
        width: newWidth,
        height: newHeight,
      interpolation: img.Interpolation.linear
    );
  }

  // Convert image to base64 string
  static Future<String> imageToBase64(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      return bytes.toString();
    } catch (e) {
      throw ImageException('Failed to convert image to base64: $e');
    }
  }

  // Validate image file
  static Future<bool> validateImage(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);
      if (image == null) {
        throw const InvalidImageFormatException();
      }
      return true;
    } catch (e) {
      if (e is ImageException) rethrow;
      return false;
    }
  }

  static Future<double> getImageSizeInMB(File imageFile) async {
    final imageLength = await imageFile.length();
    return imageLength / (1024 * 1024);
  }

  // Check if image needs compression
  static Future<bool> needsCompression(File imageFile) async {
    final imageSize = await getImageSizeInMB(imageFile);
    return imageSize > 5.0; // compress if larger than 5MB
  }
}