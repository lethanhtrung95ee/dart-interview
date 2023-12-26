import '../classes/Task.dart';
import '../classes/TaskUrgent.dart';
import '../repository/todoRepo.dart';

class Todo {
  TodoRepo todoRepo = TodoRepo();

  void add(
      String title, String description, DateTime? deadline, bool isUrgentTask) {
    if (isUrgentTask) {
      todoRepo.addItem(TaskUrgent(
          description, title, DateTime.now(), DateTime.now(), deadline!));
    } else {
      todoRepo
          .addItem(Task(description, title, DateTime.now(), DateTime.now()));
    }
  }

  //remember to handle the page number inside of page. what happen if user send minus number or exceed number
  void show([int? pageNumber]) {
    int currentPage = pageNumber ?? 1;
    List<Task> currentPageTasks = todoRepo.paginate(pageNumber: currentPage);

    print(
        '+------------------------------------------------------------------------------------+');
    print(
        '|                                   Tasks Table                                      |');
    print(
        '+------------------------------------------------------------------------------------+');
    print(
        '| ID   | Title         | Description           | Created           | Updated           | Deadline           |');
    print(
        '+------------------------------------------------------------------------------------+');

    for (var task in currentPageTasks) {
      String id = task.id
          .toString()
          .padRight(5); // Adjust padding based on your ID lengths
      String title = task.title!
          .padRight(14); // Adjust padding based on your longest title
      String description = (task.description ?? 'N/A')
          .padRight(23); // Adjust padding based on your longest description
      String created = task.createdDate
          .toString()
          .padRight(19); // Adjust padding based on your formatting
      String updated = task.updatedDate
          .toString()
          .padRight(19); // Adjust padding based on your formatting

      String deadline = task is TaskUrgent
          ? (task as TaskUrgent).deadline.toString().padRight(19)
          : ' '.padRight(19);

      print(
          '| $id | $title | $description | $created | $updated | $deadline |');
    }
    print(
        '+------------------------------------------------------------------------------------+');
    print(
        'Current Page: $currentPage | Total Pages: ${todoRepo.getTotalPages()}');
  }

  void delete(int taskId) {
    todoRepo.removeItemById(taskId);
  }
}
