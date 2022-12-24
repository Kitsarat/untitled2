import 'dart:math';

class Game {
  int answer = 0;
  //count private
  int count = 0;

  Game(int maxRandom) {
    var r = Random();
    answer = r.nextInt(maxRandom) + 1;
  }
  int doGuess(int guess) {
    count++;
    if (guess == answer) {
      print(' ➜ $guess CORRECT 👌 Total : $total');
      return 1; //correct
    }
    else if (guess > answer) {
      print(' ➜ $guess is TOO HIGH 👆');
      return 0;
    }
    else {
      print(' ➜ $guess is TOO LOW 👇');
      return 0;
    }
  }
  //get count to use
  int get total {
    return count;
  }
}