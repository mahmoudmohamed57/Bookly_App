import 'package:bookly/features/home/domain/use_case/fetch_similar_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;
  SimilarBooksCubit(
    this.fetchSimilarBooksUseCase,
  ) : super(SimilarBooksInitialState());

  static SimilarBooksCubit get(context) => BlocProvider.of(context);

  Future<void> fetchSimilarBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoadingState());
    } else {
      emit(SimilarBooksPaginationLoadingState());
    }
    var result = await fetchSimilarBooksUseCase.execute(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SimilarBooksFailureState(failure.message));
      } else {
        emit(SimilarBooksPaginationFailureState(failure.message));
      }
    }, (books) {
      emit(SimilarBooksSuccessState(books));
    });
  }
}
