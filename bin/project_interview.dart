import 'dart:io';

import './screen/menu.dart';
import 'enums/menu_enum.dart';
import 'implement/todoImpl.dart';
import 'input/handleInput.dart';

void main(List<String> arguments) {
  stdout.write('Welcome to Todo list application\n');

  var menu = Menu();
  menu.printBoxedInstructions(Menu.instructions);

  bool exit = true;
  HandleInput handleInput = HandleInput();

  while (exit) {
    MenuEnum userAction = handleInput.inputMenu();
    switch (userAction) {
      case MenuEnum.add:
        handleInput.add(menu);
      case MenuEnum.show:
        handleInput.show(menu);
      case MenuEnum.delete:
        handleInput.delete(menu);
      case MenuEnum.exit:
        menu.printBoxedInstructions(
            'Thank you for using my CLI application', false);
        exit = false;
        break;
      case MenuEnum.invalid:
        menu.printBoxedInstructions(
            'Please input the correct syntax of options!', false);
    }
  }
}
