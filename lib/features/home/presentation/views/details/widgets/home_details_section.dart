import 'package:bookly/core/utils/font_manager.dart';
import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/presentation/views/details/widgets/home_details_action.dart';
import 'package:bookly/features/home/presentation/views/home/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeDetailsSection extends StatelessWidget {
  final BookEntity bookEntity;
  const HomeDetailsSection({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * AppSize.s_2),
          child: CustomBookImage(imageUrl: bookEntity.image),
        ),
        const SizedBox(height: AppSize.s40),
        Text(
          bookEntity.title,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeightManager.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSize.s5),
        Opacity(
          opacity: AppSize.s_7,
          child: Text(
            bookEntity.authorName,
            style: Styles.textStyle20.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeightManager.medium,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s40),
        BooksAction(bookEntity: bookEntity),
      ],
    );
  }
}
