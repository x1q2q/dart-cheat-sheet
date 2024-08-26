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
import 'dart:io';
import 'dart:isolate';

class CheatSheet8 {
  CheatSheet8.init() {
    // `dart async` is to support concurrency & async features
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

    // Stream Subscription Method: code
    // this method would replace code above
    listen.onData((data) => print('Stream suscription $data'));
    listen.onDone(() => print('Stream subscription done'));

    // Stream Filter Method: code
    streamNumber()
        .where((number) => number % 2 == 0)
        .listen((event) => print('stream filter method: $event'));

    // Stream Transform Method: code
    streamNumber()
        .where((number) => number % 2 == 0)
        .map((event) => event * 10)
        .listen((event) => print('stream tf method: $event'));

    // Stream Fold Method: code
    Future<int> total = streamNumber().fold(0, (prev, el) => prev + el);
    total.then((val) => print("The total is $val"));

    // Broadcast Stream: code
    Stream<int> numberStream = streamNumber();
    Stream<int> broadcastStream = numberStream.asBroadcastStream();
    broadcastStream.listen((event) {
      print('on broadcast $event');
    });
    broadcastStream.listen((event) {
      print('on broadcast $event');
    });

    // Timer: code
    Timer(Duration(seconds: 2), () => print('hello from timer'));

    // Periodic Timer: code
    Timer.periodic(Duration(seconds: 1), (timer) {
      print('Timer ke ${timer.tick}');
      if (timer.tick >= 6) {
        timer.cancel(); //stop the timer
      }
    });

    // Async: code
    sayThankyou("satya").then((String msg) => print(msg));
    // Await: code
    printName();

    // Try-Catch Async-Await: code
    printProfession();

    // Async-Await Stream: code
    fName().then((val) => print(val));

    // Isolate: code
    Isolate.spawn(helloComrade, " Rafik");

    // Recieve Port: code
    final receivePort = ReceivePort();
    Isolate.spawn(numbers, receivePort.sendPort);
    receivePort.take(5).listen((event) {
      print('event isolate: $event');
    });

    // completer: code
    runLongRunningTask().then((val) => print('completer: $val'));

    // Stream Controller: code
    runLongRunningStream().listen((event) {
      print('stream controller: $event');
    });

    // generator sync: code
    syncNumber().forEach((elem) {
      print('gen sync: $elem');
    });

    // generator async: code
    asyncNumber().listen((event) {
      print('gen async: $event');
    });
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
Stream<int> streamNumber() {
  return Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
}

// `Transform Method`
// cast<R>: Stream<R> to convert a stream value
// map(R convert(T)): Stream<R> to convert Stream value with convert function
// expand(Iterable<R> Convert(T)): Stream<R> to convert stream Value to be Iterable<R>
// but iterable result expected to be the next Stream
// asyncMap<Future<R> convert(T)): Stream<R> same as map() but the convert result is Future<R>
// asyncExpand(Stream<R> convert(T)): Stream<R> same as expand(), but the convert result is Stream<R>

// `Fold and Reduce`
// sometimes we need to create data calculation in every Stream, an example we want to do amount of all
// the data in Stream<int>, we can use method `fold` and `reduce`
// `fold`(initial, combine): Future<R>, to do comvine data from every data in Stream
// with a given data initial.
// `reduce(combine): Future<R>, to do data combine every data in stream but withotu the data initial.

// `Broadcast Stream`
// there is some stream that can be subscribe more than once: Broadcast Stream
// to implement this, we can use method as BroadcastStream() in Stream we created before

// `Timer`
// is class in Dart that we can used to create a task that scheduled periodic
// `1.delayed-timer` => a first timer delayed task, where we request Timer to running a task
// after certain deadline (time). we can use constructor
// Timer(duration, callback) to created delayed job in callback
// that would be run after time duration achieve
// `2.periodic-timer` => to run a task with spesific periodic (ex: every
// keyword: `Timer.periodic(duration, callback)` to create periodic timer

// `Async`
// same as javascript, we can write Asynchronous code with keyword `async`
// in dart,we can create function Future<T> with async, so our code seems like Synchronous

Future<String> sayThankyou(String name) async {
  return "The $name would say thank you!";
}

// `Await`
// when we write function with `async` keyword inside, we can use key `await`
Future<String> firstName() async {
  return 'Adhitya';
}

Future<String> lastName() async {
  return 'Sofiyan';
}

Future<void> printName() async {
  // to use await
  String first = await firstName();
  String last = await lastName();
  print('Hello from: $first $last');
}

Future<void> printProfession() async {
  // use Try-Catch Async-Await
  try {
    String first = await firstName();
    String last = await lastName();
    String profession = "Singer";
    print('$first $last is a $profession');
  } catch (e) {
    print(e);
  }
}

// Async-Await Stream
Stream<String> names() {
  return Stream.fromIterable(["Raja", "Jaya", "Baya"]);
}

Future<String> fName() async {
  String name = "";
  await for (String n in names()) {
    name += "$n ";
  }
  return name.trim();
}

// `Isolate`
// with isolate, we can run block() function in different isolate, so doesnt interrupt
// the main Isolate that still used by the application
// to create Isolate we can use staticmethod: `Isolate.spawn(function(T),T)`

Future<void> helloComrade(String name) async {
  sleep(Duration(seconds: 1));
  print('Hello, comrade $name');
  Isolate.exit();
}

// `Receiver & Send Port`
// seems like channel in Golang, where we can send and receive data from other Isolate
// RecievePort seems like Stream, so we can listen data from ReceivePort

// Send Port: code
Future<void> numbers(SendPort sendPort) async {
  for (var i = 0; i < 10; i++) {
    sleep(Duration(seconds: 1));
    sendPort.send(i);
  }
  Isolate.exit();
}

// `Completer`
// dart has class named Completer, that we can use to easile create a Future
// when we integrate other library that use Callback, we want to wrapping to be Future,
// we can use Completer

// example callback function: code in future
void longRunningTask(
    void Function(String) onDone, void Function(Object?) onError) {
  Future.delayed(Duration(seconds: 5))
      .onError((error, stackTrace) => onError(error))
      .then((val) => onDone("task completed succesfully"));
}

// completer: code
Future<String> runLongRunningTask() {
  Completer<String> completer = Completer<String>();
  longRunningTask((data) {
    completer.complete(data);
  }, (err) {
    completer.completeError(err!);
  });
  return completer.future;
}

// `Stram-Controller`
// dart also serve a Stream-Controller class to create Stream

// example callback function in stream
void longRunningStream(void Function(String) onNext,
    void Function(Error?) onError, void Function() onDone) {
  var listen = Stream.periodic(Duration(seconds: 1)).take(10).listen((event) {
    onNext("Bojes");
  });
  listen.onError((error) => onError(error));
  listen.onDone(() => onDone);
}

// stream controller: code
Stream<String> runLongRunningStream() {
  StreamController<String> streamController = StreamController<String>();
  longRunningStream((event) {
    streamController.add(event);
  }, (error) {
    streamController.addError(error!);
  }, () {
    streamController.close();
  });
  return streamController.stream;
}

// `Generator`
// dart has feature called Generator,that can be user to create collection data or event Async
// data sync would be returned an Iterable<T> and data Async would be returned Stream<T>
// to create generator Sync, we should add sync* in function
// to create generator Async, we should add async* in function
// to return the value, we can use yield value

// Generator Sync: code
Iterable<int> syncNumber() sync* {
  for (int i = 0; i < 12; i++) {
    yield i;
  }
}

// Generator Async: code
Stream<int> asyncNumber() async* {
  for (int j = 0; j < 12; j++) {
    yield j;
  }
}

// `Yield*`
// also provided a `yield*` that can be used to send the entire data Iterable<T> / Stream<T>

// Generator yield: code
Stream<int> doubleNumber(int number) async* {
  yield number;
  yield number;
}

Stream<int> doubleAsyncNumber() async* {
  for (int x = 0; x < 10; x++) {
    yield* doubleNumber(x);
  }
}
