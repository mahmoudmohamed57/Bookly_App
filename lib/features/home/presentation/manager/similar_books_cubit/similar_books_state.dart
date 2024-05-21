import 'package:bookly/features/home/domain/entity/book_entity.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitialState extends SimilarBooksState {}

class SimilarBooksLoadingState extends SimilarBooksState {}

class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccessState(this.books);
}

class SimilarBooksFailureState extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksFailureState(this.errorMessage);
}

class SimilarBooksPaginationLoadingState extends SimilarBooksState {}

class SimilarBooksPaginationFailureState extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksPaginationFailureState(this.errorMessage);
}
