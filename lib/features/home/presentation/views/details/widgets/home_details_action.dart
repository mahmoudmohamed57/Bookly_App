import 'package:bookly/core/functions/launch_url.dart';
import 'package:bookly/core/utils/color_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  final BookEntity bookEntity;
  const BooksAction({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: ColorManager.whiteColor,
              textColor: ColorManager.blackColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s15),
                bottomLeft: Radius.circular(AppSize.s15),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUr(context, bookEntity.previewLink);
              },
              fontSize: AppSize.s15,
              text: getText(bookEntity),
              backgroundColor: ColorManager.orangeColor,
              textColor: ColorManager.whiteColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppSize.s15),
                bottomRight: Radius.circular(AppSize.s15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookEntity bookEntity) {
    if (bookEntity.previewLink == '') {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
