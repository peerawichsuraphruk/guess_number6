import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GUESS THE NUMBER'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          // เทียบได้กับแท็ก <div> ของ HTML
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.purple.shade50,
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.30),
                  offset: const Offset(5.0, 5.0),
                  blurRadius: 6.0,
                  spreadRadius: 5.0,
                ),
              ]),
          //alignment: Alignment.center,
          child: Center(
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/assets/images/guess_logo.png', width: 100.0),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'GUESS',
                            style: TextStyle(
                              fontSize: 50.0,
                              color: Colors.purple.shade200,
                            ),
                          ),
                          Text(
                            'THE NUMBER',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.purple.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 25.0,
                  ),
                  child: TextField(),
                ),
                ElevatedButton(
                  child: const Text('GUESS'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple.shade500,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
