import 'dart:io';

import '../extensions/DateParsing.dart';
import '../handle_exception/PageException.dart';
import '../handle_exception/ParseDateException.dart';
import '../implement/todoImpl.dart';
import '../mixin/menuMixin.dart';
import '../screen/menu.dart';

class HandleInput with MenuMixin{
  Todo todo = Todo();

  void add(Menu menu) {
    bool running = true;
    while (running) {
      menu.printBoxedInstructions(
          ['Adding feature', 'Please fill up the following field']);

      // Get description from user input
      String description = '';
      while (description.isEmpty) {
        print('Enter description:');
        description = stdin.readLineSync() ?? '';
        if (description.isEmpty) {
          print('Description cannot be empty. Please provide a description.');
        }
      }

      // Get title from user input
      String title = '';
      while (title.isEmpty) {
        print('Enter title:');
        title = stdin.readLineSync() ?? '';
        if (title.isEmpty) {
          print('Title cannot be empty. Please provide a title.');
        }
      }

      // Get deadline from user input
      DateTime? deadline;
      bool isUrgentTask = true;
      String userInput = '';
      while (userInput.toLowerCase() != 'y' && userInput.toLowerCase() != 'n') {
        print('Do you have a deadline for this task? (Y/N)');
        userInput = stdin.readLineSync()?.trim() ?? '';
        if (userInput.toLowerCase() != 'y' && userInput.toLowerCase() != 'n') {
          print('Invalid input. Please enter Y for Yes or N for No.');
        } else if (userInput.toLowerCase() == 'n') {
          isUrgentTask = false;
        } else if (userInput.toLowerCase() == 'y') {
          while (deadline == null) {
            print('Enter updated date (yyyy-MM-dd):');
            String? input = stdin.readLineSync();
            if (input != null && input.isNotEmpty) {
              try {
                input.isValidDateFormat();
                deadline = input.parseToDate();
              } on ParseDateException catch (e) {
                e.toString();
              } catch (e) {
                print(e.toString());
              }
            } else {
              print('Updated date cannot be empty. Please provide a date.');
            }
          }
        }
      }

      // send info to impl layer
      try {
        todo.add(title, description, deadline, isUrgentTask);
      } catch (e) {
        print(e.toString());
      }
      print('Create successful. Do you want to create a new task?');
      String createTask = '';
      while (
          createTask.toLowerCase() != 'y' && createTask.toLowerCase() != 'n') {
        createTask = stdin.readLineSync()?.trim() ?? '';
        if (createTask.toLowerCase() != 'y' &&
            createTask.toLowerCase() != 'n') {
          print('Invalid input. Please enter Y for Yes or N for No.');
        } else if (createTask.toLowerCase() == 'n') {
          running = false;
          print('Go back to Main menu');
        }
      }
    }
    menu.printBoxedInstructions(Menu.instructions);
  }

  void show(Menu menu) {
    todo.show();
    bool isValidInput = false;
    while (!isValidInput) {
      print(
          'Choosing the next page by type the number OR you can go back menu by typing \`N\`');
      String userInput = stdin.readLineSync()?.trim().toLowerCase() ?? '';
      if (userInput == 'n') {
        print('Back to main menu');
        isValidInput = true;
      } else {
        try {
          int pageNumber = int.parse(userInput);
          todo.show(pageNumber);
        } on PageException catch (e) {
          print(e.toString());
        } catch (e) {
          // Handle invalid input that is neither 'N' nor a number
          print(
              'Invalid input. Please enter a valid number or `N` to go back to the menu.');
        }
      }
    }
    menu.printBoxedInstructions(Menu.instructions);
  }

  void delete(Menu menu) {
    todo.show();
    bool isValidInput = false;
    while (!isValidInput) {
      print(
          'Choosing the next page by type the number OR you can go back menu by typing \`N\`');
      print(
          'If you want to delete the task. Please provide the task Id as: TaskId:[Number]. Ex: TaskId:1');
      String userInput = stdin.readLineSync()?.trim().toLowerCase() ?? '';
      RegExp taskIdRegex = RegExp(
          r'^TaskId:\d+$'); // Regex pattern to match TaskId:number format
      try {
        if (taskIdRegex.hasMatch(userInput)) {
          int taskId = int.parse(userInput.split(':')[1]);
          todo.delete(taskId);
        } else if (userInput == 'n') {
          print('Back to main menu');
          isValidInput = true;
        } else {
          int pageNumber = int.parse(userInput);
          todo.show(pageNumber);
        }
      } catch (e) {
        // Handle invalid input that is neither 'N' nor a number
        print(
            'Invalid input. Please enter a valid number or `N` to go back to the menu.');
      }
    }
    menu.printBoxedInstructions(Menu.instructions);
  }
}
