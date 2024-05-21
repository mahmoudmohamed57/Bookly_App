import 'package:bookly/core/presentation/constant.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeDetailLocalDataSource {
  List<BookEntity> fetchSimilarBooks({int pageNumber = 0});
}

class HomeDetailLocalDataSourceImplementation
    extends HomeDetailLocalDataSource {
  @override
  List<BookEntity> fetchSimilarBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(Constant.similarBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
