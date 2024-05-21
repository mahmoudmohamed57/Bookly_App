import 'package:bookly/features/home/domain/entity/book_entity.dart';

abstract class NewestBooksState {}

class NewestBooksInitialState extends NewestBooksState {}

class NewestBooksLoadingState extends NewestBooksState {}

class NewestBooksSuccessState extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccessState(this.books);
}

class NewestBooksFailureState extends NewestBooksState {
  final String errorMessage;

  NewestBooksFailureState(this.errorMessage);
}

class NewestBooksPaginationLoadingState extends NewestBooksState {}

class NewestBooksPaginationFailureState extends NewestBooksState {
  final String errorMessage;

  NewestBooksPaginationFailureState(this.errorMessage);
}
