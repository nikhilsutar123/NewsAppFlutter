import 'package:hive/hive.dart';

import '../res/constant.dart';

class HiveService {
  final String _boxName = Constant.newsDatabase;

  Future<Box> get _box async => await Hive.openBox(_boxName);

  Future<void> insert(String value) async {
    var box = await _box;
    await box.add(value);
  }

  Future<List> read() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> update(int index, String value) async {
    var box = await _box;
    await box.putAt(index, value);
  }

  Future<void> delete(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}
