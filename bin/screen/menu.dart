class Menu {
  static const Set<String> instructions = {
    'Add: add new Task to todo list',
    'Show: show all Task to todo list',
    'Delete: delete a Task to todo list',
    'Exit: Exit the CLI',
  };

  //generic for string and iterable<string>
  void printBoxedInstructions(dynamic instructions, [bool isIterable = true]) {
    //generic for iterable<String> - `is` using for checking matching the type of object - is! is reverse of is
    if (isIterable && instructions is Iterable<String>) {
      final int maxLength =
          instructions.map((e) => e.length).reduce((a, b) => a > b ? a : b);
      final horizontalLine = '+${'-'.padRight(maxLength + 2, '-')}+';

      print(horizontalLine);
      for (var instruction in instructions) {
        final paddedInstruction = '| ${instruction.padRight(maxLength)} |';
        print(paddedInstruction);
      }
      print(horizontalLine);
    }
    //generic for String
    else if (!isIterable && instructions is String) {
      final int maxLength = instructions.length;
      final horizontalLine = '+${'-'.padRight(maxLength + 2, '-')}+';

      print(horizontalLine);
      final paddedInstruction = '| ${instructions.padRight(maxLength)} |';
      print(paddedInstruction);
      print(horizontalLine);
    }
  }
}
