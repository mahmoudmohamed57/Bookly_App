import 'package:bookly/core/utils/font_manager.dart';
import 'package:bookly/core/utils/routes_manager.dart';
import 'package:bookly/core/utils/styles_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/presentation/views/home/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  final BookEntity bookEntity;

  const BookListViewItem({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.homeDetailsView,
          extra: bookEntity,
        );
      },
      child: SizedBox(
        height: AppSize.s125,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: bookEntity.image,
            ),
            const SizedBox(width: AppSize.s30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.s10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * AppSize.s_5,
                    child: Text(
                      bookEntity.title,
                      maxLines: AppSize.s2.toInt(),
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: FontFamilyManager.gtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s10),
                  Text(
                    bookEntity.authorName,
                    style: Styles.textStyle16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
