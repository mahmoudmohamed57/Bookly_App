import 'package:bookly/core/presentation/constant.dart';
import 'package:bookly/core/presentation/extensions.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entity/book_entity.dart';

extension BookModelMapper on BookModel? {
  BookEntity toEntity() {
    return BookEntity(
      this?.id.orEmpty() ?? Constant.empty,
      this?.volumeInfo?.title.orEmpty() ?? Constant.empty,
      this?.volumeInfo?.authors?.first.orEmpty() ?? Constant.empty,
      this?.volumeInfo?.imageLinks?.thumbnail.orEmpty() ?? Constant.empty,
      this?.volumeInfo?.previewLink.orEmpty() ?? Constant.empty,
    );
  }
}
