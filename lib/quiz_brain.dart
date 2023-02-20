import 'dart:io';
import 'question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNumber = 0; //make it private

  final List<Question> _questionBank = [
    //we can make this property private with _ so main function// can't change it
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Question('The total surface area of two human lungs is approximately 70 square metres.', true),
    Question('Google was originally called "Backrub".', true),
    Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    Question('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
    Question('Is this the last question?', false),
    Question('haha, this is the last question', false),
    Question('xD you did it again fool, over and out', true),
  ];

//solving issue with not serving error after last question
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1)
    //simple -1 will not go over number of questions
    {
      //increase the number
      _questionNumber++;
    }
  }

  String getQuestionText() {
//    String getQuestionText(int questionText){ //no need for input
//    return _questionBank[questionNumber].questionText; //swap for private
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished(context) {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  // // Instead of counting correct answers we can count icon list
  // int finalScore(List<Icon> iconList, String correctCount) {
  //   if (iconList.isEmpty) {
  //     return 0;
  //   }
  //   int count = 0;
  //
  //   for (int i = 0; i < iconList.length; i++) {
  //     if (iconList[i].semanticLabel == correctCount) {
  //       count++;
  //     }
  //   }
  //   return count;
  // }

  // int scoreCount() {
  //   int score=0;
  //
  //   return null;
  // }
  // building popup alert buttons
  void alertButtons(context, int correctAnswers) {
    //define total number of questions
    int totalQuestions = _questionBank.length;
    //build popup alerts
    Alert(
      context: context,
      type: AlertType.none,
      title: "QUIZZLER",
      //display results
      desc: "Quiz finished score $correctAnswers out of $totalQuestions",
      buttons: [
        DialogButton(
          onPressed: () {
            // call reset of main function, it is wrapped in Phoenix
            Phoenix.rebirth(context);
            //start from first question
            _questionNumber = 0;
          },
          color: Colors.green,
          child: const Text(
            "Start Over",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        DialogButton(
          //total exit of app
          onPressed: () => exit(0),
          color: Colors.red,
          child: const Text(
            "Exit app",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    ).show();
  }
}
