import 'package:bookly/core/functions/build_error_snack_bar.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_book_cubit.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_book_state.dart';
import 'package:bookly/features/home/presentation/views/home/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key});

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
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
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
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
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccessState) {
          books.addAll(state.books);
        }
        if (state is NewestBooksPaginationFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccessState ||
            state is NewestBooksPaginationLoadingState ||
            state is NewestBooksPaginationFailureState) {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookEntity: books[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksFailureState) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
