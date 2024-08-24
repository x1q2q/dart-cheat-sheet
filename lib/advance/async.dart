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
import 'dart:async';

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

    // Sream Subscription: code
    Stream<String> flow = stream();
    StreamSubscription<String> listen = flow.listen((data) => print(data));
    // Double Stream Subscription
    // would be throw an error
    // StreamSubscription<String> listen2 = flow.listen((data) => print(data));

    // Stram Subscription Method: code
    // this method would replace code above
    listen.onData((data) => print('Stram suscription $data'));
    listen.onDone(() => print('Stream subscription done'));
    // Stream Filter Method: code
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

// `Stream`
// Future is object asyn that used for create an object
// dart serve a stream type data: Future that can be more than one value.
// `Stream Constructor`
// there is a bunch of constructor for stream such as:
// empty() => create empty Stream
// value(T) => create Stram<T> with one value
// fromFuture(Future<T>) for create Stream<T> with one value from Future<T>
// fromFutures(Iterable<Future<T>>) for create Stream<T> with few value from IterableFuture<T>
// fromIterable(Iterable<T>) for create Stream<T> with a few value from Iterable<T>
// periodic(duration, computation) for create Stream<T> by periodic

// Stream: code
Stream<String> stream() {
  return Stream.periodic(Duration(seconds: 2), (i) {
    if (i % 2 == 0) {
      return "$i : Genap";
    } else {
      return "$i: Ganjil";
    }
  }).take(4);
}

// `Stream Subscription`
// unlike Future, in Stream, cause shape of data like data flow, we need to subscribe
// if we want to know data that exist in stream.
// Stream only can be subscribe once. if we want to more subscribe, to do the same stream,
// automatically would be error
// to subscribe a Stream, we need a listen(callback) method, 
// automatically return StreamSubscription<T> object

// `Stream subscription Method`
// Stram subscription has a bunch of method, like Future
// onData(callback) when stream receive the data
// onError(callback) when stream error
// onDone(callback) when stream done
// cancel() cancell a subscription
// pause() to temporary stop the subscription
// resume() continue subscription

// `Stream Listen`
// when we create Strem Subscription use Stream.listen(callback) method, 
// that callback paramater automatically be onData callback in Subscription Stream
// if we want to onData(callback) again, so automatically listen() callback will be replaced 

// `Transform Stream`
// stream has a bunch method that we can use to manipulate data Stream 
// before sending to Stream Subscription. such as: filtering, transformation, etc.
// `Filter Method`
// take(int): Stream<T> to take a Stream data in certain value 
// takeWhile(test): Stream<T> to take Stream data while test condition still ok
// where(test): Stream<T> to just take Stream data if matched test condition
// lastWhere(test): Future<T> to take last one Stream data with the matched test condition
// firstWhere(test): Future<T> to take first one Stream data with the matched test condition 
// drain(): Future<T> to ignore all the Stream data, but send signal when its done
// distinct(): Stream<T> to ignore all the same data with previous data
// skip(int): Stream<T> to ignore the initial amount of data
// skipeWhile(test): Stream<T> to ignore the initial amount when the condition test still ok

