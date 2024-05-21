import 'package:bookly/core/presentation/constant.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constant.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullNumber on num? {
  num orZero() {
    if (this == null) {
      return Constant.zero;
    } else {
      return this!;
    }
  }
}
