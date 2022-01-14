import 'package:flutter/material.dart';

import 'game.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  var game = Game();
  var answer = '';

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*Row(
                  children: [
                    Container(width: 50.0, height: 50.0, color: Colors.blue),
                    Expanded(
                      child: Container(
                        width: 30.0,
                        height: 50.0,
                        color: Colors.pink,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('FLUTTER', textAlign: TextAlign.end,),
                        ),
                        alignment: Alignment.centerRight,
                        ),
                      ),
                  ],
                ),*/
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('lib/assets/images/guess_logo.png',
                          width: 100.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'GUESS',
                              style: TextStyle(
                                  fontSize: 50.0,
                                  color: Colors.purple.shade200),
                            ),
                            Text(
                              'THE NUMBER',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.purple.shade500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: const OutlineInputBorder(),
                      hintText: 'ทายเลขตั้งแต่ 1 ถึง ${game.max}',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ElevatedButton(
                    child: const Text('GUESS'),
                    onPressed: () {
                      var input = _controller.text;
                      var guess = int.tryParse(input);

                      if (guess == null) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('ERROR'),
                              content: const Text('กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น'),
                              actions: [
                                ElevatedButton(onPressed: () {
                                  Navigator.of(context).pop();
                                }, child: const Text('OK'))
                              ],
                            );
                          });
                      }

                      var num = game.doGuess(guess!);
                      if (num == 1) {
                        answer = '$input มากเกินไป กรุณาลองใหม่';
                      } else if (num == -1) {
                        answer = '$input น้อยเกินไป กรุณาลองใหม่';
                      } else {
                        answer = '$input ถูกต้องครับ \nคุณทายทั้งหมด ${game
                            .guessCount} ครั้ง';
                      }

                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('RESULT'),
                              content: Text(answer),
                              actions: [
                                ElevatedButton(onPressed: () {
                                  Navigator.of(context).pop();
                                }, child: const Text('OK'))
                              ],
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple.shade500,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                    ),
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
