// programmer zaman now dart generic `pdf`
// generic is an ability adding parameter type when created class or method
// different from type data we used in class/function, generic adding possibility
// to us to changes the type-data that we wanted
// help the dev for making program code that generic so can be used in any type of data
class CheatSheet5 {
  CheatSheet5.init() {
    // to use generic data type
    final message = Data<String>();
    final age = Data<num>();
    final isAlive = Data<bool>();
    message.data = "My String data";
    age.data = 24;
    isAlive.data = true;
    print('Message: ${message.data}, Age: ${age.data}, Alive:${isAlive.data}');
    // use multiple parameter
    final pair1 = Pair("Judul1", 10);
    final pair2 = Pair("Judul1", 10);
    print(pair1.primary);
    print(pair2.secondary);

    // use generic function
    final listNumber = [19, 2, 5, 7, 9];
    final countNumber = ArrayHelper.countLength(listNumber);
    final stringNnum = [10, "fasfdsa", 10, "dfsf", true, false, 19];
    print(countNumber);
    print(ArrayHelper.filterNum(stringNnum)); // only contain num
    print(ArrayHelper.totalNum(stringNnum));

    // use bounded type parameter
    // final dataString = NumberData("eko"); // compile-error
    final dataNum = NumberData(9);
    print(dataNum);

    // use dynamic data
    final data = DynamicData("just string");
    print(data.data);
    checkParameterType(message); // is string
    checkParameterType(age); // is number
  }
}

// generic class is class that have a parameter type
// to create generic parameter type, need 1 character as generic parameter type
// character/generic parameter type that usually used:
// - E (element in collection / data structure)
// - K(key), - N (number), - T (type), - V (value), -S,u,v etc

class Data<T> {
  T? data;
}

// multiple parameter type
// parameter type in generic class allowed to be more than one
// but must used in different type of name

class Pair<K, V> {
  K primary;
  V secondary;
  Pair(this.primary, this.secondary);
}

// generic function
// generic parameter type is not for class only but can be used in function.
// generic in function only can be access inside in function not in outside

class ArrayHelper {
  static int countLength<T>(List<T> list) {
    return list.length;
  }

  static filterNum<T>(List<T> list) {
    final filterNum = list.where((t) => t is num);
    return filterNum;
  }

  static num totalNum<T>(List<T> list) {
    final filtered = filterNum(list);
    return filtered.fold(0, (prev, el) {
      final element = el as num;
      return prev + element;
    });
  }
}

// bounded type parameter
// to set boundaries for generic parameter type
// can add constraint generic parameter type with allowable type
// by default contraint type for generic parameter is an object

class NumberData<T extends num> {
  T data;
  NumberData(this.data);
}

// dynamic
// dynamic created with deleting the type data of generic

class DynamicData {
  dynamic data;
  DynamicData(this.data);
}

// type checking
void checkParameterType(dynamic data) {
  if (data is Data<String>) {
    print('is string');
  } else if (data is Data<num>) {
    print('is number');
  }
}
