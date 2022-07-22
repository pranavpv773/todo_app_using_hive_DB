import 'package:hive_flutter/hive_flutter.dart';
part 'data_modal.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String type;

  Task({this.id, required this.name, required this.type});
}
