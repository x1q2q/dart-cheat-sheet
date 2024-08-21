// programmer zaman now dart collection `pdf`
// list,set,map => types data collection
// Iterable => parent class from collection class in dart. bunch of data that can be access sequential or 1 by 1
// list, set => subclass/children from iterable

import 'dart:collection';

class CheatSheet6 {
  CheatSheet6.init() {
    // iterator
    // if typedata has property with the iterator name, & type interator, automatically we can use loop for-in
    // for example in iterable, has iterator property
    var names = ['bagas', 'naufal', 'ramadhan'];
    for (var val in names) {
      print('iterator: $val');
    }
    // manual iterator
    final iterator = names.iterator;
    while (iterator.moveNext()) {
      print('manual iterator: ${iterator.current}');
    }
    // List
    // data type that contain a bunch of data that have an indexing value
    // when creating list, we can created with a fix size,
    // or would be increments automatically as long adding data data to the list

    // growable list
    final growableList = <int>[];
    growableList.add(120);
    print(growableList);

    // fixed list
    final fixedList = List<int>.filled(10, 4); // [maxValue, theValueItSelf]
    print(fixedList);
    // list.add(120) => throw a warning

    // linked list
    // list in dart seems like array in another languages, to change & acces we use index
    // in dart also available collection named linked list,
    // is the implementation from double linked list data structur

    // linked list focus on adding data performance & fastest deleting data,
    // hence on linked list there is no changes data operation using index like `List` does.
    // linked list also children from Iterable class, not a List

    // node in linked list represeneted by class LinkedListEntry
    // so hence, if we want to create Node, we need create children class (LinkedListEntry)

    // Linked List
    var linkedList = LinkedList<StringEntry>();
    linkedList.addAll([
      StringEntry('le minerale'),
      StringEntry('aqua'),
      StringEntry('nestle')
    ]);
    for (var result in linkedList) {
      print('value from linked list: ${result.value}');
    }

    // Linked Hash Set
    // set is collection that contain a bunch of unique data that:
    // when we adding the data is exist (same) the automatically ignore (prevent from duplicate data)
    // when we create Set, default implementation from Set itself is LinkedHashSet classes
    // Linked Hash Set code
    final furnitureSet = <String>{}; // LinkedHashSet<String>();
    bool _isModern = true;
    furnitureSet..add("table");
    if (_isModern) {
      furnitureSet.add("modern");
    }
    furnitureSet
      ..add("chair")
      ..add("lamp");
    print('all of the furniture set: $furnitureSet');

    // Hash Set
    // Hash set is set implementation that not use double linked iist data structure
    // hash set make inserting data process fastest
    // because it doesnt need to to checking one by one in double list
    // Hash Set
    final nameHashSet = HashSet<String>();
    nameHashSet
      ..add('bojes')
      ..add('mahesa');
    print('The name hash set: $nameHashSet');

    // Splay Tree Set
    // is implementeation from set that use data Tree structure
    // this causes data in splay tree set would auomatically sort from the comparator

    // Splay Tree Set: code
    final exampleTreeSet = SplayTreeSet<int>();
    exampleTreeSet.addAll([1, 5, 76, 8, 2, 1]);
    print(exampleTreeSet);

    // Comparable
    // comparable ise contract used to created data type that can be sorting
    // by default almost type of data dart is implemented Comparable contract (string, num, bool)
    // so hence can sorting automatic is SplayTreeSet (for example)

    // splay tree set error
    // final treeSet = SplayTreeSet<AnotherCategory>();
    // treeSet.add(AnotherCategory("2", "Secondary category"));
    // treeSet.add(AnotherCategory("1", "First category"));
    // treeSet.add(AnotherCategory("3", "Third category"));
    // print(treeSet);  // would be throw error

    // splay tree set Object
    final treeSet = SplayTreeSet<ExampleCategory>();
    treeSet.add(ExampleCategory("2", "Secondary category"));
    treeSet.add(ExampleCategory("1", "First category"));
    treeSet.add(ExampleCategory("3", "Third category"));

    treeSet.forEach((val) {
      // because its splaytreeset so its automatic order (by Id)
      print('Value: ${val.name}');
      // Value: First category
      // Value: Secondary category
      // Value: Third category
    });

    // comparator
    // by default when we sorting data splaytreeset use comparable in our data
    final compareTreeSet =
        SplayTreeSet<int>((first, second) => second.compareTo(first));
    compareTreeSet.addAll([1, 7, 9, 0, 3, 44, 66, 3]);
    print('all compare treeset: $compareTreeSet');
    // all compare treeset: {66, 44, 9, 7, 3, 1, 0}

    // QUEUE
    // queue is collection implementation from structure data Stack (tumpukan) or Queue (antrian)
    // queue is seems like List, but for differences is on Queue,
    // modified data can be do in front (HEAD) or in back (TAIL)
    // list queue is default implementation from queue in dart
    // when we created queue object, actualy we created a Queue List
    // Queue: code
    //
    final queue = Queue<String>();
    queue.addLast("Arafik");
    queue.addLast("Nur");
    queue.addLast("Fadl");
    print('removing : ${queue.removeFirst()}');
    print(queue);

    // STACK
    // stack: code
    final stack = Queue<String>();
    stack.addLast("Aditya");
    stack.addLast("Nur");
    stack.addLast("Sodq");
    print('removing : ${stack.removeLast()}');
    print(stack);

    // Double Linked Queue
    // is implementation from Queue with Double Linked List structure data
    // using double linked queue very compatible for queue,
    // cause double linked list structure data very fast for data modification in first and last
    // so its compatible for `Queue` or `Stack`

    // Double Linked Queue: code
    final exampleStack = DoubleLinkedQueue<String>();
    exampleStack.addLast("Stack 1");
    exampleStack.addLast("Stack 2");
    exampleStack.addLast("Stack 3");
    print('removing : ${exampleStack.removeLast()}');
    print('example stack :$exampleStack');

    // Check Method: code
    final optionNumbers = [2, 4, 6, 8, 11];
    // any: is anything in that order  contain > 5 ? answer: yes
    // every: is everything in that order is > 5 ? answer: no
    print('---check method---');
    print(optionNumbers.any((el) => el > 5)); // output: true
    print(optionNumbers.every((el) => el > 5)); // output: false

    // Filter Method: code
    // iterable has many method to do filtering data that iterable
    // filter method1 ['firstWhere','lastWhere','singleWhere']
    // filter method2 ['skip','skipWHile','take','takeWhile','where']
    print('---filter method---');
    final filterNumbers = [1, 2, 3, 4, 6, 7, 8, 10, 14, 56];
    final evenNumbers = filterNumbers.where((number) => number % 2 == 0);
    final oddNumbers = filterNumbers.where((number) => number % 2 != 0);
    print('Angka genap: $evenNumbers - Angka ganjil: $oddNumbers');

    // Transform Method
    // transform method1 ['expand','map','join']
    // transform method2 ['fold','reduce']
    print('---transform method---');
    final transformNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    print(transformNumbers.map((e) => e * 2));
    print(transformNumbers.reduce((val, e) => val + e));
    print(transformNumbers.expand((e) => [e, e, e]));
    print(transformNumbers.join("-"));

    // Convert Method
    // convert method1 ['toSet()','toList()','toString()']
    print('---convert method---');
    final convertNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14];
    final numberSet = convertNumbers.toSet();
    final numberString = convertNumbers.toString();
    print(numberSet);
    print('$numberString-allstring');

    // iterable properties
    print('---iterable properties---');
    final exampleNames = ["bojes", "satya", "mahesa"];
    print(exampleNames.first);
    print(exampleNames.last);

    // List Method
    print('---list method---');
    final exactNames = ["Arafik"];
    exactNames.insert(1, "Bojes");
    print(exactNames);

    // List Operator
    print('---list operator---');
    final mamalia = ["dolphin", "capybara", "horses"];
    final reptilia = ["lizard", "snake"];
    final allAnimal = mamalia + reptilia;
    print(allAnimal);

    // Set Method
    print('---Set method---');
    final names1 = {"Rafik", "Nur", "Budi"};
    final names2 = {"Nur", "Eko", "Nugraha"};
    print(names1.union(names2));
    print(names1.intersection(names2));
    print(names1.difference(names2));
    print(names2.difference(names1));

    // Map
    // map similar to List data type that has index & value
    // in map use key
    print('---Map---');
    final Map<String, String> person = {
      'firstName': 'Muhammad',
      'lastName': 'Satya'
    };

    person['middleName'] = 'Jagad';
    print(person);

    // Map Entry
    for (var entry in person.entries) {
      print('${entry.key} is ${entry.value}');
    }

    // Hash Map
    // is implementation from Map that use Double Linked List structure data
    // same as Hash Set, sorting key at Hash Map cant be fixed sorting
    print('----- Hash Map ----');
    final scores = HashMap<String, int>();
    scores['satya'] = 100;
    scores['adit'] = 85;
    scores['rafik'] = 95;
    scores['mahesa'] = 90;
    print(scores);

    // Linked Hash Map
    // is implementation from Map that use Double Linked List structure data
    // is make LinkedHashMap data is sort as when we inserting data
    // linked hash map is default implementation for Map
    print('----- Linked Hash  Map ----');
    final exampleScores = LinkedHashMap<String, int>();
    exampleScores["indonesia"] = 90;
    exampleScores["malaysia"] = 86;
    exampleScores["singapore"] = 95;
    exampleScores["bangladesh"] = 70;
    print(exampleScores);

    // Splay Tree Map
    // is implementation from Map that use data Tree structure data
    // data in splay tree map automatically is sorted as the data (can use comparator)
    print('----- Splay Tree  Map ----');
    final otherScores = SplayTreeMap<String, int>();
    otherScores["math"] = 90;
    otherScores["biology"] = 40;
    otherScores["chemical"] = 66;
    print(otherScores);

    // use abstraction iterable
    print('---abstraction iterable---');
    List<FilterUser> users = [
      FilterUser('arafik', 23),
      FilterUser('satya', 2),
      FilterUser('mahesa', 7),
      FilterUser('aditya', 18)
    ];
    users.whereAdults().forEach((el) {
      print('user that have permission in age: ${el.name}');
    });
  }
}

// class string entry

base class StringEntry extends LinkedListEntry<StringEntry> {
  String value;
  StringEntry(this.value);
}

class AnotherCategory {
  // throw error
  String id;
  String name;
  AnotherCategory(this.id, this.name);
}

class ExampleCategory implements Comparable<ExampleCategory> {
  String id;
  String name;
  ExampleCategory(this.id, this.name);
  @override
  int compareTo(ExampleCategory other) {
    return id.compareTo(other.id);
  }
}

// abstraction Iterable based on: `https://x.com/luke_pighetti/status/1825691713077190993/photo/1`
class FilterUser {
  final String name;
  final int age;
  FilterUser(this.name, this.age);
  late final formattedName = name.toUpperCase();
  late final isAdult = age >= 18;
}

extension on Iterable<FilterUser> {
  Iterable<FilterUser> whereAdults() => where((e) => e.isAdult);
}
