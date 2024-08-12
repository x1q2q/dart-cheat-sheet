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
    print('print a hello world');
    stderr.writeln('print by stderr'); // berwarna merah
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
}
