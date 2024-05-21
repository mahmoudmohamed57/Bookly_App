import 'package:bookly/core/functions/build_error_snack_bar.dart';
import 'package:bookly/core/utils/routes_manager.dart';
import 'package:bookly/core/utils/values_manager.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:bookly/features/home/presentation/views/home/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListView extends StatefulWidget {
  const FeaturedListView({super.key});

  @override
  State<FeaturedListView> createState() => _FeaturedListViewState();
}

class _FeaturedListViewState extends State<FeaturedListView> {
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
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
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
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState ||
            state is FeaturedBooksPaginationLoadingState ||
            state is FeaturedBooksPaginationFailureState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * AppSize.s_3,
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.homeDetailsView,
                        extra: books[index],
                      );
                    },
                    child: CustomBookImage(imageUrl: books[index].image),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailureState) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
