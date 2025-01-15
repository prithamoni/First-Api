import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var url='https://jsonplaceholder.typicode.com/posts';

  var data = "No data";

  var statusCode;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(onPressed: ()async{
                print('Button pressed');
                http.Response response = await http.get(
                Uri.parse(url));
            
                setState(() {
            
                  data = response.body;
                });
            
                  var statusCode =response.statusCode;
                  print(data);
                  print(statusCode);
            
                },
                  child: const Text('Load data'),
                ),
                Text(data),
            
              ]
            ),
          ),
        ),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold();
  }
}