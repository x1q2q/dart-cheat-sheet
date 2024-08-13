class CheatSheet2 {
  void init() {
    Basic2 basicCS = Basic2();
    basicCS.typeData();
    basicCS.operator();
    basicCS.manageList();
    basicCS.manageSet();
    basicCS.manageMap();
    basicCS.forInNullable();
    basicCS.highOrderFunc();
  }
}

class Basic2 {
  void typeData() {
    // use `num` type can contains int or double
    num tinggi = 10.4;
    tinggi = 10;
    num alas = 5;
    // function short expression
    int luasSegitiga(int tinggi, int alas) => tinggi * alas ~/ 2;

    // string interpolation, string multiline, convert toInt()
    String output = '''Luas segitiga dari tinggi:$tinggi & alas: $alas, 
adalah ${luasSegitiga(tinggi.toInt(), alas.toInt())}''';
    print(output);
  }

  void operator() {
    // operator Type Test (as, is, is!)
    // as => TypeCast, melakukan conversi tipe data secara paksa
    // is => check if object (benar) sesuai tipe data
    // !is => check if objecet (tidak) sesuai tipe data
    String convertedUserId = '120.2';
    //convert from string to num
    dynamic userId = num.parse(convertedUserId);
    if (userId is int) {
      print('Yeah, the userId ($userId) is integer');
    } else if (userId is! int) {
      print('Nope, the userId ($userId) isnt integer ');
    }
    // typeCast from dynamic to double.
    dynamic UID = 12.0;
    print('The variable UID: ${UID as double}');
  }

  void manageList() {
    List<String> tools = ['book', 'pc', 'pen'];
    print('showing: $tools \n then adding the `bottle water`');
    // adding value by method built-in `add` to the last index
    tools.add('bottle water');
    print('result: $tools \n then delete the last index');
    // to remove value in list, use `remove(value)`, `removeAt(index)`, `removeLast`
    tools.removeLast;
    print('showing: $tools, \n the current length is: ${tools.length}');
  }

  void manageSet() {
    Set<String> tools = {'pen', 'book', 'pc'};
    print('showing: $tools \n then adding the `bottle water`');
    // adding value by method built-in `add` to the last index
    tools.add('bottle water');
    print('result: $tools \n then delete the element start with `p`');
    // to remove value in list, use `remove(value)`, `removeAt(index)`, `removeLast`
    tools.removeWhere((el) => el.startsWith('p'));
    print('showing: $tools, \n the current length is: ${tools.length}');
  }

  void manageMap() {
    // map is type of key-value
    Map<String, dynamic> group = {
      "name": "Grup pandawa",
      "total": 12,
      "created_at": "2019"
    };
    print('Show the group name: ${group['name']}');
    print('Show the group total: ${group['total']}');
    print('Show the group created: ${group['created_at']}');
    print('length: ${group.length}');
    group['code_name'] = 'GP';
    final isActive = <String, dynamic>{'is_active': true};
    group.addEntries(isActive.entries);
    print(
        'adding the code_name & is_active \n result: code_name (${group['code_name']}), is_active(${group['is_active']})');
    print('updated length: ${group.length}');
  }

  void forInNullable() {
    // using for-in instead looping traditional
    var peoples = <String>['Bang dani', 'Gus zlatan', 'Nenek sigma'];
    for (var value in peoples) {
      print(value);
    }
    // NullPointerException is very common mistakes in some of programming language. e.g: java
    // its because the data that should be not-null but its returning null.
    // to avoid this, in dart also known to null-safety (in dart > v2.12)

    // null checking
    int? age = null;
    // print(age.toDouble()); => thrown warning
    if (age != null) {
      print(age.toDouble());
    }
    // to convert nullable data to non-nullable must be null checking
    // there is a way to make a default value
    String? admin;
    final adminName = admin ?? 'default admin';
    print(adminName);
    // or we can convert by sign (secara paksa): `!` <must notnull>
    int? nullableAge = 12;
    final ageNumber = nullableAge!;
    print(ageNumber); //print null
    // to check nullable member use `?` <can be null>
    num? intNumber; // => can be null
  }

  void highOrderFunc() {
    // required named-parameter function
    // the z arg is optional
    int sum({required int x, required int y, int? z}) {
      return (z.runtimeType == int) ? x + y + z! : x + y;
    }

    print(sum(x: 10, y: 10));
    print(sum(x: 4, y: 2, z: 12));
    // default-parameter value
    int luasPersegi({int sisi = 12}) {
      return sisi * sisi;
    }

    print('luas persegi sisi 12 adalah: ${luasPersegi()}');
    print('luas perseig sisi 15 adalah: ${luasPersegi(sisi: 15)}');

    // optional parameter with []
    int luasSegitiga(int alas, int tinggi, [int? multipleBy]) {
      return (multipleBy.runtimeType == int)
          ? ((alas * tinggi) ~/ 2) * multipleBy!
          : ((alas * tinggi) ~/ 2);
    }

    print('Luas segitiga: ${luasSegitiga(4, 5)}');
    print('Luas segitiga (dikalikan 2): ${luasSegitiga(4, 5, 2)}');

    // high-order function (function as variable,param, or return value)
    // function as parameter
    void printHello(String name, String Function(String) filter) {
      var filteredName = filter(name);
      print('Hallo bos, $filteredName');
    }

    // higher-order function
    String filterBadWord(String text) {
      if (text == 'anjing') {
        return '******';
      }
      return text;
    }

    // call the function
    print('call the high-order-function');
    printHello('HandaiTaulan', filterBadWord);
    printHello('anjing', filterBadWord);

    // annonymous func as variable
    var lowerFunc = (String text) => text.toLowerCase();
    print(lowerFunc('INI BUKAN KAPITAL'));

    // annonymous func as parameter
    void callName(String name, String Function(String) filter) {
      var filteredName = filter(name);
      print('Hi, $filteredName');
    }

    callName('Rafik Bojes', (String name) => name.toUpperCase());

    int factorialLoop(int val) {
      // menghasilkan factorial dari loop ke-n
      var result = 1;
      for (var j = val; j > 0; j--) {
        result *= j;
      }
      return result;
    }

    print(factorialLoop(3));
    // return 3*2*1

    // with recursive function
    int factorialRecursive(int val) {
      if (val <= 1) {
        return val;
      }
      return val * factorialRecursive(val - 1);
    }

    print(factorialRecursive(4));
    // return 4*3*2*1
  }
}
