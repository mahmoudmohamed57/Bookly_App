import 'package:bookly/core/network/failure.dart';
import 'package:bookly/core/network/failure_handler.dart';
import 'package:bookly/features/home/data/data_source/local_data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:bookly/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImplementation({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isEmpty) {
        books = await homeRemoteDataSource.fetchFeaturedBooks(
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

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books = homeLocalDataSource.fetchNewestBooks();
      if (books.isEmpty) {
        books = await homeRemoteDataSource.fetchNewestBooks(
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
