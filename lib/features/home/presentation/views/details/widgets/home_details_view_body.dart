import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/presentation/views/details/widgets/home_details_section.dart';
import 'package:bookly/features/home/presentation/views/details/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDetailsViewBody extends StatelessWidget {
  final BookEntity bookEntity;

  const HomeDetailsViewBody({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: AppSize.s40,
                  ),
                ),
                HomeDetailsSection(bookEntity: bookEntity),
                const Expanded(
                  child: SizedBox(height: AppSize.s50),
                ),
                const SimilarBooksSection(),
                const SizedBox(height: AppSize.s40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
