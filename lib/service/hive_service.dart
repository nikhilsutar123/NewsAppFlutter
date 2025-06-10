import 'package:hive/hive.dart';
import 'package:news_app/data/saved_news_model.dart';

import '../res/constant.dart';

class HiveService {
  final String _boxName = Constant.newsDatabase;

  Future<Box<SavedNewsModel>> get _box async => await Hive.openBox<SavedNewsModel>(_boxName);

  Future<void> insert(SavedNewsModel value) async {
    var box = await _box;
    await box.add(value);
  }

  Future<List<SavedNewsModel>> read() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> update(int index, SavedNewsModel value) async {
    var box = await _box;
    await box.putAt(index, value);
  }

  Future<void> delete(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}
