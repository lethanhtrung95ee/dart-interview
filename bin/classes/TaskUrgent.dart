import 'Task.dart';

class TaskUrgent extends Task {
  DateTime deadline;

  TaskUrgent(
    String? description,
    String? title,
    DateTime? createdDate,
    DateTime? updatedDate,
    this.deadline,
  ) : super(description, title, createdDate, updatedDate);
}
