import 'package:bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

SnackBar buildErrorWidget(String errorMessage) {
  return SnackBar(
    content: Text(errorMessage, style: const TextStyle()),
    duration: const Duration(seconds: AppTransitionDuration.s3),
  );
}
