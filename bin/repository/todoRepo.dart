import '../classes/Task.dart';
import '../classes/TaskUrgent.dart';
import '../handle_exception/PageException.dart';

class TodoRepo {
  List<Task> taskList = [
    Task('Description 1', 'Title 1', DateTime(2023, 12, 24),
        DateTime(2023, 12, 25)),
    Task('Description 2', 'Title 2', DateTime(2023, 12, 24),
        DateTime(2023, 12, 25)),
    Task('Description 3', 'Title 3', DateTime(2023, 12, 24),
        DateTime(2023, 12, 25)),
    Task('Description 4', 'Title 4', DateTime(2023, 12, 24),
        DateTime(2023, 12, 25)),
    Task('Description 5', 'Title 5', DateTime(2023, 12, 24),
        DateTime(2023, 12, 25)),
    TaskUrgent('Urgent Description 6', 'Urgent Title 6', DateTime(2023, 12, 24),
        DateTime(2023, 12, 25), DateTime(2023, 12, 30)),
    TaskUrgent('Urgent Description 7', 'Urgent Title 7', DateTime(2023, 12, 24),
        DateTime(2023, 12, 25), DateTime(2023, 12, 30)),
    TaskUrgent('Urgent Description 8', 'Urgent Title 8', DateTime(2023, 12, 24),
        DateTime(2023, 12, 25), DateTime(2023, 12, 30)),
  ];

  // Private constructor
  TodoRepo._privateConstructor();

  // Singleton instance
  static final TodoRepo _instance = TodoRepo._privateConstructor();

  factory TodoRepo() {
    return _instance;
  }

  void addItem(Task item) {
    taskList.add(item);
  }

  void removeItemById(int id) {
    taskList.removeWhere((task) => task.id == id);
  }

  void updateItem(Task updatedTask) {
    final index = taskList.indexWhere((task) => task.id == updatedTask.id);
    taskList[index] = updatedTask;
  }

  List<Task> paginate({int pageNumber = 1, int pageSize = 5}) {
    int totalPages = getTotalPages();
    //handle case the items % 5 == 0, can reach one more page and show empty. Behavior should be error because current page is larger than total page
    if (totalPages < pageNumber) throw PageException('Current page exceeds total pages');
    final startIndex = (pageNumber - 1) * pageSize;
    final endIndex = startIndex + pageSize;
    return taskList.sublist(
        startIndex, endIndex < taskList.length ? endIndex : taskList.length);
  }

  int getTotalPages({int pageSize = 5}) {
    return (taskList.length / pageSize).ceil();
  }
}
