import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Extensions for BuildContext
extension BuildContextExtensions on BuildContext {
  /// Get theme
  ThemeData get theme => Theme.of(this);

  /// Get text theme
  TextTheme get textTheme => theme.textTheme;

  /// Get color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Get media query
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get screen size
  Size get screenSize => mediaQuery.size;

  /// Get screen width
  double get screenWidth => screenSize.width;

  /// Get screen height
  double get screenHeight => screenSize.height;

  /// Check if keyboard is open
  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0;

  /// Show snackbar
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colorScheme.error : null,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Show error snackbar
  void showErrorSnackBar(String message) {
    showSnackBar(message, isError: true);
  }
}

/// Extensions for String
extension StringExtensions on String {
  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalize each word
  String get capitalizeWords {
    if (isEmpty) return this;
    return split(' ')
        .map((word) => word.capitalize)
        .join(' ');
  }

  /// Check if string is empty or null
  bool get isNullOrEmpty => isEmpty;

  /// Truncate string
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }

  /// Remove extra whitespace
  String get removeExtraSpaces {
    return trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Convert to title case
  String get toTitleCase {
    return split(' ')
        .map((word) => word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}

/// Extensions for DateTime
extension DateTimeExtensions on DateTime {
  /// Format as readable date
  String get formatted => DateFormat('MMM dd, yyyy').format(this);

  /// Format as readable date with time
  String get formattedWithTime => DateFormat('MMM dd, yyyy HH:mm').format(this);

  /// Format as time only
  String get timeFormatted => DateFormat('HH:mm').format(this);

  /// Format as relative time (e.g., "2 hours ago")
  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }
}

/// Extensions for num
extension NumExtensions on num {
  /// Format as currency
  String get asCurrency => '\$${toStringAsFixed(2)}';

  /// Format as percentage
  String get asPercentage => '${(this * 100).toStringAsFixed(1)}%';

  /// Format with commas
  String get withCommas {
    return NumberFormat('#,###').format(this);
  }
}

/// Extensions for List
extension ListExtensions<T> on List<T> {
  /// Get first element or null
  T? get firstOrNull => isEmpty ? null : first;

  /// Get last element or null
  T? get lastOrNull => isEmpty ? null : last;

  /// Check if list is null or empty
  bool get isNullOrEmpty => isEmpty;
}