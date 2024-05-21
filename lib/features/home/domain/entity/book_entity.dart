import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String authorName;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final String previewLink;

  BookEntity(this.id, this.title, this.authorName, this.image, this.previewLink);
}
