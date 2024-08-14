// references: https://medium.com/@yetesfadev/mastering-static-in-flutter-and-dart-3bd21a60fa48

/* static adalah keyword atau kata kunci untuk mendefinisikan member/anggota dari sebuah class
termasuk variable atau methods yang termasuk dalam class tersebut dan bukan instansiasi dari class */

/* [1]. static variables
dengan static variable, dapat dibagikan di antara semua instance class. static variable di-instansiasi
hanya sekali & dapat mempertahankan nilai dari variable tersebut. dapat mengakses variable tersebut
tanpa memanggil kelas terlebih dahulu (tanpa instance class)*/

class StaticCircle {
  static double pi = 3.14;
  static int maxRadius = 10;
  double radius;
  StaticCircle(this.radius);
  double calculateArea() => pi * (radius * radius);
  /* These variables are shared among all instances of the class. 
  The static variables can be  accessed using the class name. */
}

/* [2]. static methods
static methods adalah milik kelas itu sendiri (bukan milik instance class), dapat dipanggil tanpa instance classes
berguna untuk melakukan operasi yang tidak spesifik pada suatu keadaan tertentu */

class MathUtils {
  static int multiply(int x, int y) => x * y;
  static int addAll(List<int> numbers) {
    int sum = 0;
    for (int number in numbers) {
      sum += number;
    }
    return sum;
  }
  // or we can do the same with =>
  // static int addAll(List<int> numbers) => numbers.reduce((v, el) => v + el);
}

/* [3]. utility classes.
classes that provide helper functions or constants that can be accessed globally without need for creating instances.
often to have private consstructors to prevent instantiation */

class StringUtils {
  StringUtils._(); // private constructors `_()` ensures that the class cannot be instantiated.
  static isEmpty(String? txt) {
    return txt == null || txt.isEmpty;
  }
}

/* [4]. share data
static variable dapat digunakan untuk berbagi antar bagian aplikasi (screen /widget) yang berbeda.
dengan penyimpanan dan akses yang mudah. tanpa melalui constructors/passing arguments (di beberapa kondisi) 
*/
/* [5]. initialization order 
vairable statis diinisialisasi sebelum instance class dibuat. ini dapat memudahkan akses dan 
menggunakan variabel statis tanpa create instance class */

class InitClass {
  static int x = 10;
  InitClass() {
    print(x);
  }
}
