import 'package:dart_cheat_sheet/index.dart';
import 'package:dart_cheat_sheet/intermediate/unit_test.dart';
import 'package:test/test.dart';

// future test
Future<String> getName() async {
  return 'Arafik Nurf';
}

// future-matcher
Future<String> getCallName() async {
  return Future.delayed(Duration(seconds: 2), () => 'Rafik Bojes');
}

void main() {
  String appName = "";
  // setup data
  setUp(() {
    appName = "dart-cheat-sheet";
  });
  setUpAll(() {
    print('all is ready set up');
  });

  // expect function
  test('1st test', () {
    expect(appName, "dart-cheat-sheet");
  }, retry: 3);
  // group function
  group("group: first", () {
    test("1st test", () {
      expect(UnitTest.calcSum(2, 4), equals(6));
    }, tags: ["first"]);
    test("2nd test", () {
      expect(UnitTest.calcSum(6, 4), equals(10));
    }, tags: ["second"]);
    test("3rd testing", () {
      expect(CheatSheet2.factorialRecursive(4), equals(24));
    }, skip: "still developing the feature");
  });
  // future-test
  test("Future Test", () async {
    final name = await getName();
    expect(name, 'Arafik Nurf');
  });
  // future-matcher
  test("Future Matcher", () {
    final name = getCallName();
    expect(name, completion(equals('Rafik Bojes')));
  });
  // stream-matcher
  test("Stream Test", () {
    final stream = Stream.periodic(Duration(seconds: 1), (i) => i).take(5);
    expect(
        stream,
        emitsInOrder(
            [emits(0), emits(1), emits(2), emits(3), emits(4), emitsDone]));
  });

  tearDown(() {
    print('app name is: $appName');
  });
  tearDownAll(() {
    print('ended all of unit testing');
  });
}
