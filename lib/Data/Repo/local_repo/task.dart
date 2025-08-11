import 'package:hive/hive.dart';

class Task {
  static final Box box = Hive.box('tasks');
}
