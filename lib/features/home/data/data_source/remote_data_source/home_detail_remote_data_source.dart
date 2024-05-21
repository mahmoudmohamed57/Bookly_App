import 'package:bookly/core/functions/get_books_list.dart';
import 'package:bookly/core/functions/save_data_in_hive.dart';
import 'package:bookly/core/network/api_service.dart';
import 'package:bookly/core/presentation/constant.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';

abstract class HomeDetailRemoteDataSource {
  Future<List<BookEntity>> fetchSimilarBooks({int pageNumber = 0});
}

class HomeDetailRemoteDataSourceImplementation
    extends HomeDetailRemoteDataSource {
  final ApiService apiService;

  HomeDetailRemoteDataSourceImplementation(this.apiService);
  @override
  Future<List<BookEntity>> fetchSimilarBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endpoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, Constant.similarBox);
    return books;
  }
}
