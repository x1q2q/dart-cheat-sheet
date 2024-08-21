// programmer zaman now dart async `pdf`
// program run in a process, & process will have an independen resource with other process
// nowadays, operating system not only run multiple-proces, but in a process we can running
// a bunch of task at once, or can be called lightweight process/`Thread`
// `Thread` make application process can be run not always must be sequential, but we can
// create process application run in asynchronous or parallel

// concurrency mean run a bunch of task one by one at the time.
// parallel mean run a bunc of task at once in one time.

// Concurrency and Parallelism -> Way tasks are executed.
// Synchronous and Asynchronous -> Programming model.
// Single Threaded and Multi-Threaded -> The environment of task execution.

// synchronous vs asynchronous
// `synchronous` is code program that run in sequential, and waiting unting the process is done.
// `asynchronous` mean code programm means when our program code runs and we don't need
// to wait for the code execution to finish, we can continue to the next stage of the program code.
class CheatSheet8 {
  CheatSheet8.init() {
    // `dart async` is to support concurrency & asnc features
    // `dart event loop` is similar to NodeJS, containing one Thread that would always
    // running & all jobs would send to Queue that executing one by one by ThreadEventLoop

    // `dart isolates` is places where all Dart code running
    // in dart code running in isolates, which is isolates have a queue memory,
    // thread&event loop is that separeted.
    // every isolates would be separated in memory queue, thread & event loop even in the same Dart apps
    // even though in each isolates can communicate with each others.

    // `future`
    // type data future in dart similar in other language programming (java: future, javascript: promise)
    // future is result from asynchronous computation
    // a return value, that would exist when async computation is done
    // `Futur State` (a future in dart has 2 states).
    // - uncompleted (which is doesnt have value yet). either computation process not done yet
    // - completed (whic is have value from computation result) the value would be succes/failed (error).
    // `Future Value`
    // future is Generic type data, when save data itself
    // for example if save string data, it means Future<String>
    // if the future doesn return any value, we can use Future<void>

    // `Future Consutrctor
    // there is much way to make future
    // Future(computation) => create Future with computation function.
    // Future.delayed(duration, computation) => create Future with doind certain duration delay
    // Future.error(error) => create a Future that contain error data
    // Future.value(value) => create a Future that contain data success

    // use Future
    futureHello();
    // `Future Method`
    // Future has many method, that we can use for register callback/function
    //  that would we call when occur the mutation state
    // `whenComplete(): is called when future is done, either succes/failed
    // `then(): ` is called when future succes, & transofrm it into another value
    // `onError():` is called when future error or to change become another value
    // `catchError():` is called when future error
    greeting(' captain, its wednesday!').then((val) => print(val));
    // Future on error method: code
    greeting(' its warning message')
        .onError((error, stackTrace) => "Fallback")
        .then((val) => print(val));

    // Future Catch Error method: code
    greeting(' its information')
        .then((val) => print(val))
        .catchError((error) => print("error message: ${error.message}"));

    // Future When Complete: code
    greeting(' its information')
        .whenComplete(() => print("---done future"))
        .then((val) => print(val))
        .catchError((error) => print("Error message in: ${error.message}"));

    // Transform Future: code
    getName("Arafik Bojes")
        .then((val) => val.split(" "))
        .then((val) => val.reversed)
        .then((val) => val.map((e) => e.toUpperCase()))
        .then((val) => print(val));

    // Future Try Catch Finally: code
    getName("Arafik Bojes")
        .then((val) => print(val))
        .catchError((error) => print("error wiht message ${error.message}"))
        .whenComplete(() => print("all is done"));
  }
}

// create Future
Future<void> futureHello() {
  return Future.delayed(Duration(seconds: 2), () {
    print('programmer bojes studio');
  });
}

Future<String> greeting(String message) {
  return Future.delayed(Duration(seconds: 2), () {
    return "Good morning $message";
  });
}

// `Transform Future`
// then() method can be used to change future shape content became another
// we just need to return the value that comes from callback then()

Future<String> getName(String name) {
  return Future.delayed(Duration(seconds: 2), () {
    return "The name is: $name";
  });
}


// `Try Catch Finally`
// use Future, we can use try-catch-finally command
// but instead, we can combine a few methods in future to achieve 
// something like try-catch-finally use then(), catchError(), & whenComplete() method 