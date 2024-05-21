import 'package:bookly/features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  NewestBooksCubit(
    this.fetchNewestBooksUseCase,
  ) : super(NewestBooksInitialState());

  static NewestBooksCubit get(context) => BlocProvider.of(context);

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoadingState());
    } else {
      emit(NewestBooksPaginationLoadingState());
    }
    var result = await fetchNewestBooksUseCase.execute(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewestBooksFailureState(failure.message));
      } else {
        emit(NewestBooksPaginationFailureState(failure.message));
      }
    }, (books) {
      emit(NewestBooksSuccessState(books));
    });
  }
}
