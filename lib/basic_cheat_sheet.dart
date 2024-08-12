import 'dart:developer' as developer;
import 'dart:io';
// variable
// to write variable in dart usually use camelCase.

String person = 'person1'; // Explicit type [string]
var city = 'jakarta'; // Inferred type
final name =
    'Mikael'; // Immutable variable. [there is immutable or mutable variable]
const AGE = 21; // Compile-time constant
/* immutable berarti data tidak bisa di-assign value lagi, sedang mutable variable bisa.
  immutable variable diawali dengan key `final`. hanya dapat diinisalisasi 1 kali, 
  namun jika objek berisi mutable(list/map), isi dari objek tersebut dapat diubah. 
  cth: add,remove item index. */

/* `const` mirip dengan `final` yang bersifat immutable, perbedaannya terletak pada compile-time nya. 
  - `const` digunakan untuk type data yang  sudah dideclare sejak awal (benar-benar konstan) 
  angka/string literal & tidak akan berubah.
  - `final` biasanya untuk value yang ditentukan saat runtime, tetapi tidak dapat diubah setelah inisiasi.class
  contohnya seperti value dari services: 'db','network', 'native api',dll. */

// data types. (karena dart static-type, maka sebisa mungkin hindari type dynamic)
int height = 160;
double weight = 63.5;
bool isFather = true;
String fullName = 'Mikael Bramasto';
List<String> childrens = ['jaewangi', 'kayumanis'];
Map<String, int> childrenAge = {'jaewangi': 12, 'kayumanis': 16};

// to write comment use /__your_comments/ or /* __your_comment  */ [the last part can multilines]

class Basic {
  // basic functions with `void`
  void useDebug() {
    // to debug use print or debugPrint or log (use built-in package by dart)
    print('print a $fullName');
    stderr.writeln('print height: $height by stderr'); // berwarna merah
    // tidak terlihat karena biasanya digunakan saat debugging berjalan:
    developer.log('example log1', name: 'basic.useDebug.print');
  }

  // function with `parameters`
  void controlFlow(String typeControlFlow, {int age = 40}) {
    // use-if
    if (typeControlFlow == 'use-if') {
      if (age < 30) {
        print('you are still young');
      } else {
        print('you are old');
      }
    }
    // use-switch-case
    if (typeControlFlow == 'use-switch-case') {
      switch (age) {
        case < 30:
          print('you are still young');
        default:
          print('you are old');
      }
    }
    // use-loops
    if (typeControlFlow == 'use-loops') {
      for (int j = 0; j < age; j++) {
        // function with return-type && ternary condition
        String typeOld = (j < 30) ? 'its still young' : 'its old!';
        print('The age ($j) $typeOld');
      }
    }
  }

  void annonymousFunc() {
    // Annonymous clousure
    List<int> childrenAges = [12, 16];
    childrenAges.forEach((item) {
      print('Your age children is $item');
    });
  }

  void errorHandling(dynamic division) {
    // use dynamic to make sure program could catch error
    int? result;
    try {
      result = 200 ~/ division;
    } catch (e) {
      print('Error: ${e.toString()}');
    } finally {
      print('Result: result is $result');
    }
  }

  // use-future
  Future<String> catchFruit() {
    return Future.delayed(Duration(seconds: 3), () => 'Oh its Grape!');
  }

  // use-async-await
  Future<void> fetchOrder() async {
    print('loading to fetch the order menu...');
    final fruitOrder = await catchFruit();
    print('Order: $fruitOrder');
  }

  // use-stream
  Stream<int> timer =
      Stream.periodic(Duration(seconds: 1), (count) => count).take(10);
}

// class
class Animal {
  final String name;
  final String? sounds;
  Animal({required this.name, this.sounds});
  void makeSounds() {
    print('Name: ($name) try to make a sounds... ${sounds ?? ''}');
  }
}

// inheritance class
class Mammal extends Animal {
  final String name;
  final double weight;
  final String? sounds;
  Mammal({required this.name, required this.weight, this.sounds})
      : super(name: name, sounds: sounds);
  void speak() {
    print('The animal type of mammal: ($weight) weight');
    super.makeSounds();
  }
}

// inheritance class
class Reptil extends Animal {
  final String name;
  final double weight;
  final String? sounds;
  Reptil({required this.name, required this.weight, this.sounds})
      : super(name: name, sounds: sounds);
  void speak() {
    print('The animal type of reptil: ($weight) weight');
    super.makeSounds();
  }
}
