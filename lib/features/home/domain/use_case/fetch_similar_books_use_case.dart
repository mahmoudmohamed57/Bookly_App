import 'package:bookly/core/network/failure.dart';
import 'package:bookly/core/use_case/base_use_case.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/domain/repository/home_details_repository.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends BaseUseCase<int, List<BookEntity>> {
  final HomeDetailsRepository homeDetailsRepository;

  FetchSimilarBooksUseCase(this.homeDetailsRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> execute([int input = 0]) {
    return homeDetailsRepository.fetchSimilarBooks(pageNumber: input);
  }
}
