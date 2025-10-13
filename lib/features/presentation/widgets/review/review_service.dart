import 'package:flutter/material.dart';

class ReviewService {
  ReviewService._();

  /// Validates the form and performs submission side-effects (SnackBar + pop).
  /// Returns true if the form was valid and submission proceeded.
  static Future<bool> submitReview(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    required String name,
    required String email,
    required String message,
    required int rating,
  }) async {
    // Simple validation using the provided formKey
    if (formKey.currentState?.validate() ?? false) {
      // Here you could call an API or save locally. For now, show a SnackBar.
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Review submitted')));

      // Simulate a small delay to mimic network call (optional)
      await Future.delayed(const Duration(milliseconds: 200));

      Navigator.pop(context);
      return true;
    }

    return false;
  }
}
