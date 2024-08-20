import 'package:dart_cheat_sheet/index.dart';

void main(List<String> arguments) {
  // basic1
  CheatSheet basic1 = CheatSheet();
  switch (arguments[0]) {
    case 'basic1':
      basic1.init();
      break;
    case 'basic2':
      CheatSheet2.init();
      break;
    case 'intermediate1':
      CheatSheet3.init();
      break;
    case 'intermediate2':
      CheatSheet4.init();
      break;
    case 'intermediate3':
      // dart-generic
      CheatSheet5.init();
      break;
    case 'intermediate4':
      // dart-collection
      CheatSheet6.init();
      break;
    case 'advance1':
      CheatSheet7.init();
      break;
    case 'advance2':
      CheatSheet8.init();
      break;
    default:
      basic1.init();
  }
}
