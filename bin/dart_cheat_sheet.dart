import 'package:dart_cheat_sheet/dart_cheat_sheet.dart';

void main(List<String> arguments) {
  if (arguments[0] == 'intermediate') {
    // basic1.init();
    print('intermediete');
  } else if (arguments[0] == 'advance') {
    // basic1.init();
    print('advance');
  } else {
    // basic1
    CheatSheet basic1 = CheatSheet();
    switch (arguments[1]) {
      case 'basic1':
        basic1.init();
        break;
      case 'basic2':
        CheatSheet2 basic2 = CheatSheet2();
        basic2.init();
        break;
      default:
        basic1.init();
    }
  }
}
