import 'package:bookly/features/home/domain/entity/book_entity.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccessState(this.books);
}

class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailureState(this.errorMessage);
}

class FeaturedBooksPaginationLoadingState extends FeaturedBooksState {}

class FeaturedBooksPaginationFailureState extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksPaginationFailureState(this.errorMessage);
}