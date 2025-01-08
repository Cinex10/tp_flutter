import 'package:flutter/material.dart';

class AppConstants {
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Animation Curves
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve bounceCurve = Curves.elasticOut;

  // Layout Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const double defaultSpacing = 8.0;

  // Priority Colors
  static const Map<int, Color> priorityColors = {
    1: Colors.green,
    2: Colors.orange,
    3: Colors.red,
  };

  // Categories
  static const List<String> defaultCategories = [
    'Personnel',
    'Travail',
    'Shopping',
    'Santé',
    'Autres',
  ];
}
