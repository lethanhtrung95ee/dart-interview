import 'TaskAbstract.dart';

class Task implements Comparable<Task>, TaskAbstract {
  static int _idCounter = 0; // Counter for generating unique IDs
  int id;
  String? description;
  String? title;
  DateTime? createdDate;
  DateTime? updatedDate;

  Task(this.description, this.title, this.createdDate, this.updatedDate)
      : id = ++_idCounter;

  //example to use Comparable class - disadvantage: compare the specific field.
  @override
  int compareTo(Task other) {
    return title!.compareTo(other.title!);
  }

  @override
  String taskToString() {
    return 'Task: { Title: $title, Description: $description, Created: $createdDate, Updated: $updatedDate }';
  }

  @override
  void taskDefaultMethod() {
    print("This is the default task method");
  }
}
