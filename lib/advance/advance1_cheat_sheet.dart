// references: https://thetechvate.com/dart-cheat-sheet-advanced/
import 'dart:isolate';
import 'dart:mirrors';

class CheatSheet7 {
  CheatSheet7.init() {
    // null safety
    int? nullableInt; // nullable type
    int nonNullableInt = 0;
    int? mayReturnNull() => null;
    int mustReturnNonNull() => 0;
    int value = nullableInt ?? 42; // null-aware operator
    nullableInt ??= 42; //assign if null
    print(nullableInt);
    print(nonNullableInt);
    print(mustReturnNonNull());
    print(value);
    // Collection if and For:
    var list = [
      'Alice',
      if (true) 'Bob',
      for (var i in [1, 2, 3, 4]) 'item $i'
    ];
    print(list);
    var map = {
      'key1': 'value1',
      if (true) 'key2': 'value2',
      for (var i = 1; i < 10; i++) 'key$i': 'value$i'
    };
    print(map); //  print without duplicate data
    // spread operator
    var list1 = [1, 2, 3];
    var list2 = [0, ...list1, 4, 5];
    var set1 = {'a', 'b'};
    var set2 = {'c', ...set1, 'd'};
    print(list2);
    print(set2);
    // extension methods:
    print('apakah benar'.reverse());

    // higher-order functions:
    execute(() => print('hello brody'));

    // abstract-classes & mixins:
    CrimsonEyes().createList();
    CrimsonEyes().historyInfo();

    // generics
    var idBox = Box<int>(123);
    var msgBox = Box<String>('Box Shipping');
    print('$msgBox with id $idBox');

    // covariance & contravariance:
    List<Burger> burgers = [];
    List<JunkFood> junkFoods = burgers; // covariant
    print(junkFoods);

    // type aliases:
    OddIntList myInts = [1, 3, 5, 7, 9];
    print(myInts);

    // streams:
    var listen = countStream.listen((count) => print(count));
    listen.onDone(() => // isolates:
        callIsolate());

    // custom exceptions:
    try {
      riskyOperation();
    } catch (e) {
      print('Caught: $e');
    }

    // stack traces:
    try {
      throw Exception('error');
    } catch (e, stackTrace) {
      print('##CUSTOM Caught $e');
      print('##STACK Stack traceL \n $stackTrace');
    }

    // meta proramming
    var mirror = reflectClass(CrimsonEyes);
    print(mirror.declarations.keys);

    // annotations
    var testMirror = reflectClass(TestClass);
    var metadata = testMirror.metadata;
    for (var meta in metadata) {
      if (meta.reflectee is MyAnnotation) {
        print(meta.reflectee.title);
      }
    }
  }
}

// extension methods:
extension StringExtension on String {
  String reverse() => split('').reversed.join('');
}

// higher-order functions:
void execute(Function fn) => fn();

// abstract-classes and mixins:
abstract class Album {
  void createList();
}

mixin TrackHistory {
  void historyInfo() => print('Gloom/doom quartet in bandung');
}

class CrimsonEyes extends Album with TrackHistory {
  @override
  void createList() => print([
        for (var i in [1, 2, 3]) 'track $i'
      ]);
}

// generics
class Box<T> {
  T content;
  Box(this.content);
}

// covariance & contravariance
class JunkFood {}

class Burger extends JunkFood {}

// type aliases:
typedef OddIntList = List<int>;

// factory constructors:
class Logger {
  static final Logger _singleton = Logger._internal();
  factory Logger() {
    return _singleton;
  }
  Logger._internal();
}

// concurrency and isolates
void entryPoint(SendPort sendPort) {
  sendPort.send('Hello from isolate');
}

Future<void> callIsolate() async {
  var receivePort = ReceivePort();
  await Isolate.spawn(entryPoint, receivePort.sendPort);
  receivePort.listen((message) {
    print('heyy $message');
    Isolate.exit();
  });
}

// streams:
Stream<int> countStream =
    Stream.periodic(Duration(seconds: 1), (count) => count).take(5);

// custom exceptions:
class CustomException implements Exception {
  final String message;
  CustomException(this.message);
}

void riskyOperation() {
  throw CustomException('Somethin went wrong...');
}

// annotations:
class MyAnnotation {
  final String title;
  const MyAnnotation(this.title);
}

@MyAnnotation('The title is Test Class')
class TestClass {}
