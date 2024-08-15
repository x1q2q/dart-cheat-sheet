// references: https://github.com/IliaKhuzhakhmetov/DesignPatterns-Dart/blob/main/bin/creational/singleton/README.md
// 1. singleton pattern adalah design pattern yang memastikan bahwa class
// hanya memiliki 1 kali instance & menyediakan global point access ke instance tersebut
// biasa digunakan jika ingin single instance class yang dapat diakses dari bagian mana pun dalam aplikasi

/* key concepts
-singleton: class has only one instances & provide global access instance
-private constructor: private constructor is used to prevent creating new instance form outside class
-static instance: holds the uniques instances of the class
-static method: to access the singleton instance, create if it doesn exist
*/

class SingletonPattern {
  SingletonPattern.go() {
    // jadi meskipun di inisiasi class berkali-kali tetap hanya memanggil instance1 kali saja
    Singleton instance1 = Singleton.getInstance();
    instance1.doSomething();
    instance1.doSomething();
    Singleton instance2 = Singleton.getInstance();
    instance2.doSomething();
  }
}

class Singleton {
  // private static instance
  static Singleton? _instance;
  // private constructor
  Singleton._() {
    print('first init');
  }

  static Singleton getInstance() {
    _instance ??= Singleton._();
    return _instance!;
  }

  void doSomething() {
    print('singleton instance is doin somethin');
  }
}
