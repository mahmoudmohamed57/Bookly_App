import 'package:bookly/core/network/failure.dart';
import 'package:bookly/core/network/failure_handler.dart';
import 'package:bookly/features/home/data/data_source/local_data_source/home_detail_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/remote_data_source/home_detail_remote_data_source.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/domain/repository/home_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeDetailRepositoryImplementation extends HomeDetailsRepository {
  final HomeDetailRemoteDataSource homeDetailRemoteDataSource;
  final HomeDetailLocalDataSource homeDetailLocalDataSource;

  HomeDetailRepositoryImplementation({
    required this.homeDetailRemoteDataSource,
    required this.homeDetailLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books = homeDetailLocalDataSource.fetchSimilarBooks();
      if (books.isEmpty) {
        books = await homeDetailRemoteDataSource.fetchSimilarBooks(
          pageNumber: pageNumber,
        );
      }
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioException(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
