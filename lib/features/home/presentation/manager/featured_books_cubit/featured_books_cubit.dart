import 'package:bookly/features/home/domain/use_case/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  FeaturedBooksCubit(
    this.featuredBooksUseCase,
  ) : super(FeaturedBooksInitialState());

  static FeaturedBooksCubit get(context) => BlocProvider.of(context);

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoadingState());
    } else {
      emit(FeaturedBooksPaginationLoadingState());
    }
    var result = await featuredBooksUseCase.execute(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailureState(failure.message));
      } else {
        emit(FeaturedBooksPaginationFailureState(failure.message));
      }
    }, (books) {
      emit(FeaturedBooksSuccessState(books));
    });
  }
}
