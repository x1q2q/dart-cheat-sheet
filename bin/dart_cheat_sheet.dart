import 'package:dart_cheat_sheet/dart_cheat_sheet.dart';

void main(List<String> arguments) {
  // basic
  Basic basicCS = Basic();
  basicCS.useDebug();
  // args ['use-if','use-switch-case','use-loops']
  basicCS.controlFlow('use-if');
  basicCS.annonymousFunc();
  // basic-create-object-class
  Mammal goat = Mammal(name: 'wedus', weight: 500.5, sounds: 'mbek-mbek-mbek');
  goat.speak();
  Reptil snake =
      Reptil(name: 'sanca', weight: 15.3, sounds: 'pspsps-psssp-sstst');
  snake.speak();
  // basics-error-handling-&-async
  basicCS.errorHandling(10);
  basicCS.catchFruit().then((fruit) {
    print('Your Order is: $fruit');
  });
  basicCS.fetchOrder().then((_) {
    basicCS.timer.listen((time) {
      print('now time is $time');
    });
  });
}
