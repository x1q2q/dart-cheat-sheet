// references https://thetechvate.com/dart-oop-cheat-sheet/
import 'package:dart_cheat_sheet/intermediate/design%20pattern/abstract_factory_pattern.dart';

import 'static_method.dart';
import 'design pattern/composite_pattern.dart';
import 'design pattern/singleton_pattern.dart';
import 'design pattern/factory_method_pattern.dart';

class CheatSheet3 {
  CheatSheet3.init() {
    // abstract-classes
    Shape circle = Circle();
    Shape triangle = Triangle();
    circle.draw();
    triangle.draw();
    // interface-classes
    Bird bird = Bird();
    bird.fly();

    // use mixins
    Fish fish = Fish();
    fish.swim();

    // encapsulation private members
    User user1 = User();
    user1.setUsername = 'user1 aja';
    print(user1.username);
    user1._username = 'new user2 ';
    print(user1.username);

    // static members => accessing method/properties without create instance
    print(StaticCounter.counter); // output: 0
    StaticCounter.incrementCounter();
    print(StaticCounter.counter); // output: 1

    // [static_method.dart] static method
    StaticMethod.go();

    // default & named constructor
    CoffeeShop obj1 = CoffeeShop();
    CoffeShopNamed obj2 = CoffeShopNamed.name();
    print(obj1);
    print(obj2);
    // redirecting constructor
    RedirectingConstructor obj = RedirectingConstructor();
    print(obj);
    // setter & getter
    FruitShop fShop = FruitShop();
    fShop.setName = 'Wohtify';
    print(fShop.name);
    // using vector
    Vector v1 = Vector(2, 2);
    Vector v2 = Vector(4, 5);
    Vector v3 = v1 * v2;
    print('v3: (${v3.x}, ${v3.y})');

    // pollymorphism
    City myCity = City(120);
    myCity.countPopulation();
    // accessing the subclasses
    Purbalingga pbgCity = Purbalingga(250);
    pbgCity.countPopulation();

    // callable class
    var add = Adder();
    print(add(12, 10));

    // mixins comparable class
    final personA = Person('rafik', 23);
    final personB = Person('adit', 16);
    print(personA.compareTo(personB));
    final newPerson = personA.copy();
    print(newPerson.name);

    // method cascades
    final builder = Builder()
      ..add('Its sample content teks')
      ..add(' with another part of content');
    print(builder.message);

    // fluent interfaces (method chaining)
    final queryBuilder = QueryBuilder();
    queryBuilder.select('name, password').from('users');
    print(queryBuilder.query);
    // immutable var
    final immutable = ImmutablePoint(10, 2);
    print(immutable.a);
    // proxy pattern
    Proxy proxy = Proxy();
    proxy.request();
    // [compoiste_pattern.dart] composite pattern
    CompositePattern.go();

    // [singleton_pattern.dart] singleton pattern
    SingletonPattern.go();

    // [abstract_factory_pattern.dart] abstract factory pattern
    AbstractFactoryPattern.go();

    // [factory_method_pattern.dart] factory method pattern
    FactoryMethodPattern.go();
  }
}

// abstract classes
abstract class Shape {
  void draw();
}

// if we use abstrac class, the children class thrown warning when method in abstract clas doesn exist
// simplify => to make contract
class Circle extends Shape {
  @override
  void draw() {
    print('drawing a circle...');
  }
}

class Triangle extends Shape {
  @override
  void draw() {
    print('drawing a triangle...');
  }
}

// interface classes, => key `implements`
//

class FlyAble {
  void fly() {
    print('.. its flying');
  }
}

class Bird implements FlyAble {
  @override
  void fly() {
    print('the bird is flying...');
  }
}

// mixins, => key `with`
mixin Swimmable {
  void swim() {
    print('its swimming ...');
  }
}

class Fish with Swimmable {}

// encapsulation -- private members
class User {
  String _username = 'username1';
  String get username => _username;
  set setUsername(String val) => _username = val;
}

// static members
// The static variable retains its value across multiple instances.
class StaticCounter {
  static int counter = 0;
  static void incrementCounter() {
    counter++;
  }
}

// default constructor
/* default constructor initialized object when its created. can be defined explicity. */
class CoffeeShop {
  CoffeeShop() {
    print('its default a coffee shop...');
  }
}

// named constructor
/* named constructor provides a multiple-way to initialize objects. useful for creating different
types of constructors within the same class. */
class CoffeShopNamed {
  CoffeShopNamed.name() {
    print('its a piknik coffee...');
  }
}

// redirecting constructor
class RedirectingConstructor {
  RedirectingConstructor() : this.named();
  RedirectingConstructor.named() {
    print('its a redirecting to a named constructor');
  }
}

// setter & getter class
class FruitShop {
  String? _name;
  String get name => _name!;
  set setName(String val) => _name = val;
}

// overriding operators
// provide to perform custom operations with class object.
// allow instnace the class to use operations like (*)

class Vector {
  int x, y;
  Vector(this.x, this.y);
  Vector operator *(Vector other) {
    return Vector(x * other.x, y * other.y);
  }
}

// polymorphism
// allowsyo use a subclass object where a subclass object is expected
// to enable flexible & reusable code.
class City {
  final int population;
  City(this.population);
  void countPopulation() {
    print('the total population is: $population');
  }
}

class Purbalingga extends City {
  final int population;
  Purbalingga(this.population) : super(population);
  @override
  void countPopulation() {
    print('the population at purbalingga is: $population');
  }
}

// covariant parameters
// allowing parameters allow overriding (redefine) methods to accept
// more specific types than the original method.

abstract class Tree {
  void watering(Tree tree);
}

// class PalmTree extends Tree{
// throwing an error cause class cant override the watering method
// void watering(PalmTree palmtree){
// watering
// }
// }
class PineTree extends Tree {
  void watering(covariant PineTree pinetree) {
    // not throwing an error. cause have covariant keyword
    print('its watering a pine tree');
  }
}

// late initialization
// late keyword allow to initialize variable at a later point, its ensuring the key are non-null when accessed.
class LazyInit {
  late String description;
  void initialize() {
    description = 'Initialized';
  }
}

// type aliases
// type aliases allow you to a create a new name of an existing type
// make a code to readable.

typedef IntList = List<int>;
IntList primeNumbers = [3, 5, 7, 9, 11];

// callable class
// class with a call method that can be used like a function, enable a more functional programming style.

class Adder {
  // to make this callable use keyword `call`
  int call(int x, int y) => x + y;
}

// built-in mixins
// provide built-in mixins like comparable & iterable

class Person implements Comparable<Person> {
  String name;
  int age;
  Person(this.name, this.age);
  @override
  int compareTo(Person other) => age - other.age;
  Person copy() => Person(name, age);
}

// invocation method
class DynamicClass {
  @override
  dynamic noSuchMethod(Invocation ivocation) => 'Method tidak diketemukan';
}

// static initialization
// use a static initialization blocck to execute code when class first loaded

class Configuration {
  static final Configuration instance = Configuration._privateConstructor();
  Configuration._privateConstructor();
  static void initialize() {
    print('class loaded first');
  }
}

// custom exceptions
class InvalidInputException implements Exception {
  final String msg;
  InvalidInputException(this.msg);

  @override
  String toString() => 'InvalidInputException: $msg';
}

// interfaces and abstract classes
abstract class Drawable {
  void drawing();
}

class Square implements Drawable {
  @override
  void drawing() {
    print('its drawing a square');
  }
}

// method cascades
class Builder {
  String message = '';
  Builder add(String part) {
    message += part;
    return this;
  }
}

// using generics with constraints
class Repository<T extends Tree> {
  void save(T entity) {
    print('Saving $entity');
  }
}

// fluent interfaces
//  to method chaining

class QueryBuilder {
  String query = '';
  QueryBuilder select(String field) {
    query += 'SELECT $field ';
    return this;
  }

  QueryBuilder from(String table) {
    query += 'FROM $table';
    return this;
  }
}

// immutable classes
// prevent modification after creation
class ImmutablePoint {
  final int a, b;
  const ImmutablePoint(this.a, this.b);
}

// proxy pattern
// provides a surrogate(pengganti) atau placeholder for another object

class RealSubject {
  void request() {
    print('Real request');
  }
}

class Proxy {
  final RealSubject _realSubject = RealSubject();
  void request() {
    // filtering
    print('Proxy requrest');
    _realSubject.request();
  }
}

// composite pattern
abstract class Component {
  void operation();
}

class Leaf extends Component {
  @override
  void operation() {
    print('its leaf operation');
  }
}

class Composite extends Component {
  List<Component> children = [];
  @override
  void operation() {
    for (var child in children) {
      child.operation();
    }
  }
}
