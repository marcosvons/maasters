import 'package:hive_flutter/hive_flutter.dart';
import 'package:maasters/core/core.dart';

class HiveBoxes {
  HiveBoxes();

  late final Box<String> userBox;

  Future<void> initBoxes() async {
    userBox = await Hive.openBox<String>(userBoxKey);
  }

  Future<void> clearBoxes() async {
    await userBox.clear();
  }
}
