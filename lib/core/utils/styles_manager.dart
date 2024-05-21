import 'package:bookly/core/utils/font_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:flutter/cupertino.dart';

abstract class Styles {
  static const textStyle14 = TextStyle(
    fontSize: FontSizeManager.s14,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontFamilyManager.montserrat,
  );
  static const textStyle16 = TextStyle(
    fontSize: FontSizeManager.s16,
    fontWeight: FontWeightManager.medium,
    fontFamily: FontFamilyManager.montserrat,
  );
  static const textStyle18 = TextStyle(
    fontSize: FontSizeManager.s18,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontFamilyManager.montserrat,
  );
  static const textStyle20 = TextStyle(
    fontSize: FontSizeManager.s20,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontFamilyManager.montserrat,
  );
  static const textStyle30 = TextStyle(
    fontSize: FontSizeManager.s30,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontFamilyManager.gtSectraFine,
    letterSpacing: AppSize.s1_2,
  );
}
