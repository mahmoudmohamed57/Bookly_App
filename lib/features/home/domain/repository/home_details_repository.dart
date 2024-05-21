import 'package:bookly/core/network/failure.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeDetailsRepository {
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    int pageNumber = 0,
  });
}
