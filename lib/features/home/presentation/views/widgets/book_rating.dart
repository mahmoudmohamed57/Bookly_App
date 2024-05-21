import 'package:bookly/core/utils/color_manager.dart';
import 'package:bookly/core/utils/font_manager.dart';
import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;

  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: AppSize.s15,
          color: ColorManager.yellowColor,
        ),
        const SizedBox(width: AppSize.s6),
        Text(
          rating.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(width: AppSize.s6),
        Opacity(
          opacity: AppSize.s_5,
          child: Text(
            '($count)',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
        )
      ],
    );
  }
}
