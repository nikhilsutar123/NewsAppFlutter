import 'package:hive/hive.dart';
part 'saved_news_model.g.dart';

@HiveType(typeId: 1)
class SavedNewsModel extends HiveObject {
  @HiveField(0)
  String? url;
  @HiveField(1)
  String? imageUrl;
  @HiveField(2)
  String? publishedAt;
  @HiveField(3)
  String? title;
  @HiveField(4)
  String? author;

  SavedNewsModel(
      {this.title, this.url, this.imageUrl, this.author, this.publishedAt});
}
