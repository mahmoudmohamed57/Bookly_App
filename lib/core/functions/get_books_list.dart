import 'package:bookly/features/home/data/mapper/book_mapper.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var bookModel in data['items']) {
    books.add(BookModel.fromJson(bookModel).toEntity());
  }
  return books;
}
