import 'package:hive/hive.dart';

part 'taskmodel.g.dart';

@HiveType(typeId: 0)
class Taskmodel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final bool isCompleted;

  @HiveField(4)
  final String? date;

  @HiveField(5)
  final int? taskcolor;
  Taskmodel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    this.date,
    this.taskcolor,
  });

  Taskmodel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    String? date,
    int? taskcolor,
  }) {
    return Taskmodel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
      taskcolor: taskcolor ?? this.taskcolor,
    );
  }
}
