// ignore_for_file: avoid_print

import 'dart:math';

class Game {
  var max = 100;
  int? _answer;
  int _guessCount = 0;
  static var playList = <int>[];
  var sum = 0;

  //Random
  Game() {
    var r = Random();
    _answer = r.nextInt(max) + 1;
  }

  //GuessCount
  int doGuess(int num) {
    _guessCount++;
    if (num > _answer!) {
      return 1;
    } else if (num < _answer!) {
      return -1;
    } else {
      return 0;
    }
  }

  int get guessCount {
    return _guessCount;
  }

  //List playGame
  void add (int num) {
    playList.add(num);
  }

  void summary () {
    print("\n\nYou've played ${playList.length} games");
    for (var i=0; i < playList.length; i++) {
      print("🚀 Game #${i+1}: ${playList[i]} guesses");
      sum += playList[i];
    }
  }

}



