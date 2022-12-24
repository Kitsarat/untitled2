import 'dart:io';
import 'Game.dart';
import 'random.dart';

void main() {
  var maxNumber;
  int check = 0;
  int count = 0;
  List<int> myList = [];
  while (check == 0) {
    int result = 0;
    stdout.write('The largest number to guess 💻 :');
    var max = stdin.readLineSync();
    maxNumber = int.tryParse(max!);
    maxNumber ??= 100;
    var game = Game(maxNumber);
    print('꧁START GUESSING NUMBERS꧂');
    do {
      stdout.write('Guess the between 1 and ✎ $maxNumber:');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);
      if (guess == null) {
        continue;
      }
      if (guess > maxNumber) {
        continue;
      }
      if (guess < 1) {
        continue;
      }
      result = game.doGuess(guess);
      if (result == 1) {
        check = 1;
      }
    }
    while (result!= 1);
    myList.add(game.total);
    count = myList.length;
    stdout.write(" 💫 Want to play again (y/n) ➜ ");
    for (;;) {
      var playagin = stdin.readLineSync();
      if (playagin == "Y" || playagin == "y") {
        check = 0;
        break;
      }
      else if (playagin == "N" || playagin == "n") {
        print(" ✨ Play all $count games");
        for (int i = 0; i < myList.length; i++) {
          int n = myList[i];
          int j = i + 1;
          print(" ⌨ Game $j: $n random");
        }
        break;
      }
      else {
        stdout.write(" 💫 Want play again (y/n) ➜ ");
        continue;
      }
    }
  }
}