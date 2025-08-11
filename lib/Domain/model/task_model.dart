import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String description;
  @HiveField(1)
  final DateTime date;

  Task({required this.description, required this.date});
}
