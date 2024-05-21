import 'package:bookly/core/functions/build_error_snack_bar.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:bookly/features/home/presentation/views/home/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListview extends StatefulWidget {
  const SimilarBooksListview({super.key});

  @override
  State<SimilarBooksListview> createState() => _SimilarBooksListviewState();
}

class _SimilarBooksListviewState extends State<SimilarBooksListview> {
  late final ScrollController scrollController;
  List<BookEntity> books = [];
  var nextPage = 1;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= AppSize.s_7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SimilarBooksCubit>(context)
            .fetchSimilarBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccessState) {
          books.addAll(state.books);
        }
        if (state is SimilarBooksPaginationFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccessState ||
            state is SimilarBooksPaginationLoadingState ||
            state is SimilarBooksPaginationFailureState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * AppSize.s_15,
            child: ListView.builder(
                controller: scrollController,
                itemCount: books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s5),
                    child: CustomBookImage(imageUrl: books[index].image),
                  );
                }),
          );
        } else if (state is SimilarBooksFailureState) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
