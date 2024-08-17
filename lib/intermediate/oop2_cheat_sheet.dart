// programmer zaman now dart oop `pdf`
import 'dart:mirrors';

class CheatSheet4 {
  CheatSheet4.init() {
    // extension method
    MusicPlayer mPlayer = MusicPlayer('Spotify', 2000);
    mPlayer.getDescription();
    mPlayer.playAudio();
    // redirected constructor to named method
    final company = Company.fromJakarta();
    final companyB = Company("name1", "Jakarta");
    print(
        'CompanyA: ${company.name}, ${company.address}| CompanyB: ${companyB.name}, ${companyB.address}');

    // initalizer list
    Customer bagas = Customer('Bagas adhibagaskara');
    print('firstname: ${bagas.firstName} ; lastname: ${bagas.lastName}');

    // constant constructor
    final triangle1 = const ImmutableTriangle(3, 3);
    final triangle2 = const ImmutableTriangle(3, 3);
    print(triangle1 == triangle2);

    // factory constructor
    final db1 = Database.get();
    final db2 = Database.get();
    print(db1 == db2);

    // cascade notation
    final student = Student()
      ..uname = "rafi"
      ..grade = '12a'
      ..isActive = true;
    student.getDescription();
    // inheritance
    CountryA id = CountryA('indonesia');
    id.greetins();
    // method overriding
    id.getFlag();
    // super keyword
    id.allPopulation();

    // use mixin
    Audio audio = Audio();
    audio.name = 'lagu_kebangsaan.mp3';
    audio.play();
    audio.stop();

    // equals object operator
    final category1 = Category("1", "football");
    final category2 = Category("1", "football");
    print(category1 == category2);
    // no such method
    dynamic methodRepo = MethodRepository('product');
    methodRepo.id("12345");
    // typedef
    var jumlah = jmlSum(10, 5);
    print(jumlah());
    // typedef function
    sayGoodBye('Rahman', (name) => name.toUpperCase());

    // try catch
    // when using method that will be throw exception, then the program will stop
    // if we dont want to program crash/stopped we ened to catch the exception
    // use try catc to catch the exception
    try {
      Validation.validate("", "");
    } catch (e) {
      print(e.toString());
    }
    // metadata
    // standard annotation
    // @Deprecated => to inform that is deprecated/broken
    // @override => to inform that the method is overriding from the parents
  }
}

class MusicPlayer {
  String name;
  int totalDownloads;
  MusicPlayer(this.name, this.totalDownloads);
  void getDescription() {
    print(
        'This ($name music player) has been download with $totalDownloads total');
  }
}

// extensions method
extension PlayAudio on MusicPlayer {
  void playAudio() {
    print('this is will play the audio');
  }
}

// redirected constructor
class Company {
  String name;
  String address;
  Company(this.name, this.address);
  Company.withAddress(String address) : this("name1", address);
  // redirect to named constructor
  Company.fromJakarta() : this.withAddress('Jakarta');
}

// initializer list
class Customer {
  String? firstName;
  String? lastName;
  String fullname;
  Customer(this.fullname)
      : firstName = fullname.split(" ")[0],
        lastName = fullname.split(" ")[1] {
    print('Create a new customers');
  }
}

// const constructor
class ImmutableTriangle {
  final int base;
  final int height;
  const ImmutableTriangle(this.base, this.height);
}

// factory constructor
class Database {
  Database() {
    print('Created a new database');
  }
  static Database db = Database();
  factory Database.get() {
    return db;
  }
}

// cascade notation
class Student {
  String? uname;
  String? grade;
  bool? isActive;
  void getDescription() {
    print('Its $uname, grade: $grade, & active status: $isActive');
  }
}

// inheritance
class Country {
  String? name;
  Country(this.name);
  void greetins() {
    print('this $name country greetings to you');
  }

  void getFlag() {
    print('default flag is blank');
  }

  int getPopulation() {
    return 1200;
  }
}

class CountryA extends Country {
  String? name;
  // super contructor
  CountryA(this.name) : super(name);
  // method overriding
  void getFlag() {
    print('the flag is refer to countryA');
  }

  void allPopulation() {
    // super keyword
    print('the total of puplation the country is: ${super.getPopulation()}');
  }
}

// access modifier => private field (using underscore `_`)
// using getter & setter for encapsulation. to ensure the sensitive data hidden from outer side
// to keep the object data still valid

// interface = kontrak dari pembuatanclass, mirip seperti abstract class. yang membedakan:
// di interface, semua method otomatis abstract
// untuk mewariskan interface tidak menggunakan keyword extends,
// melainkan implements
//

// mixin
// reusable code yang dapat digunakan dikelas lain   tanpa depends dg pewarisan
// mixin mirip seperti copy-paste di beberap tempat namun dg cara yang lebih baik
// satu class bisa menambah lebih dari satu mixin, sama seperti interface
abstract class Multimedia {}

// use `on ClasssesName` to boundaries only for the class
mixin Playable on Multimedia {
  String? name;
  void play() {
    print('Play: $name');
  }
}
mixin Stoppable on Multimedia {
  String? name;
  void stop() {
    print('Stop: $name');
  }
}

class Audio extends Multimedia with Playable, Stoppable {}

class Video extends Multimedia with Playable, Stoppable {}

// equals operator
// to compare the two objects is the same or not

// wrong equals
// final category1 = Category("1", "laptpo");
// final category2 = Category("1", "laptpo");
// print(category1 == category2);

// override equals method
// using operator ==
class Category {
  String id;
  String name;
  Category(this.id, this.name);

  @override
  bool operator ==(Object other) {
    if (other is Category) {
      if (id != other.id) return false;
      if (name != other.name) return false;
      return true;
    }
    return false;
  }
}

// no such method
// method in the class that we can override to detect if method is called but doesnt exist
// no such method only when object is dynamic or class

class MethodRepository {
  final String _name;
  MethodRepository(this._name);

  @override
  noSuchMethod(Invocation invocation) {
    var column = MirrorSystem.getName(invocation.memberName);
    var value = invocation.positionalArguments.first;
    var text = "error: There is no method for $column($value)";
    print(text);
  }
}

// typedef
// dapat membaut alias untuk tipe data lain
// mempersingkat nama class panjang dengan alias
class SumOverXandY {
  int x, y;
  SumOverXandY(this.x, this.y);
  int call() => x + y;
}

typedef jmlSum = SumOverXandY;
// typedef function
typedef Filter = String Function(String);
void sayGoodBye(String name, Filter filter) {
  print('Goodby, kamerad! ${filter(name)}');
}

// exception
class Validation {
  static void validate(String username, String password) {
    if (username.isEmpty)
      throw Exception("Username field is empty");
    else if (password.isEmpty) throw Exception("Password field is empty");
  }
}

// class exception
class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
  @override
  String toString() => 'Invalid validation exception: $message';
}

// deprecated
@Deprecated('this class is deprecatedBy')
class DeprecatedBy {}
// when we cal the DeprecatedBy will be stikethrough (tercoret)

// another annotation
class Todo {
  final String todo;
  const Todo(this.todo);
}

class ApplicationLogic {
  @Todo('Implement as soon as possible!')
  void run() {}
}
