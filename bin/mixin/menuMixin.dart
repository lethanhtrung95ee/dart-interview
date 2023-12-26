import 'dart:io';

import '../enums/menu_enum.dart';

mixin MenuMixin {
  MenuEnum inputMenu() {
    final input = stdin.readLineSync()?.toLowerCase();
    if ((input?.length ?? 0) == 0 || input == null) {
      return MenuEnum.invalid;
    } else {
      //convert input to menu_enum
      return MenuEnum.values.firstWhere(
        (e) =>
            e.toString().split('.').last.toLowerCase() == input.toLowerCase(),
        orElse: () => MenuEnum.invalid,
      );
    }
  }
}
