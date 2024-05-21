import 'package:bookly/core/functions/get_books_list.dart';
import 'package:bookly/core/functions/save_data_in_hive.dart';
import 'package:bookly/core/network/api_service.dart';
import 'package:bookly/core/presentation/constant.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endpoint:
          'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, Constant.featuredBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, Constant.newestBox);
    return books;
  }
}
