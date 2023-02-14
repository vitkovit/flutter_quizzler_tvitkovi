import 'question.dart';
import 'package:flutter/material.dart';

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
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called "Backrub".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

//solving issue with not serving error after last question
  void nextQuestion() {
    if (_questionNumber < _questionBank.length -
        1) { //simple -1 will not go over number of questions
      _questionNumber++; //increase the number
      print('q# = $_questionNumber');
      // print(_questionBank.length);
    }
  }

  void isFinished(context) {
    if (_questionNumber < _questionBank.length) {

      print('executing is finished $_questionNumber.');
      print('q length');
      print(_questionBank.length);

    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              content: Text("hi"),
            ));
  }}

  int finalScore(List<Icon> iconList, String element) {
    // print('next print is length of a list');
    // print(list.length);
    if (iconList.isEmpty) {
      return 0;
    }
    int count = 0;

    for (int i = 0; i < iconList.length; i++) {
      if (iconList[i].semanticLabel == element) {
        count++;
      }
    }
    // if (count == _questionBank.length - 1) {
    // if (count <= _questionBank.length - 1) {
    //   // print('count is : $count');
    //   // print('length is');
    //   // print(_questionBank.length);
    // }
    return count;
  }

//     int countIconOccurrencesUsingLoop(List<Icon> icon_list, String element) {
//       print(icon_list[0].semanticLabel);
// // [Icon(IconData(U+0E156), color: MaterialColor(primary value: Color(0xff4caf50))), Icon(IconData(U+0E16A), color: MaterialColor(primary value: Color(0xfff44336))), Icon(IconData(U+0E156), color: MaterialColor(primary value: Color(0xff4caf50))), Icon(IconData(U+0E16A), color: MaterialColor(primary value: Color(0xfff44336))), Icon(IconData(U+0E156), color: MaterialColor(primary value: Color(0xff4caf50))), Icon(IconData(U+0E16A), color: MaterialColor(primary value: Color(0xfff44336)))]
//       if (icon_list == null || icon_list.isEmpty) {
//         return 0;
//       }
//
//       int count = 0;
//       for (int i = 0; i < icon_list.length; i++) {
//         if (icon_list[i].semanticLabel == element) {
//           count++;
//         }
//       }
//
//       return count;
//     }

  // now we need to delegate task of serving the questions to quiz_brain
  String getQuestionText() {
//    String getQuestionText(int questionText){ //no need for input
//    return _questionBank[questionNumber].questionText; //swap for private
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
//   void _showDialog() {
//     Alert(
//         context: context,
//         title: "FilledStacks",
//         desc: "My tutorials show realworld structures.",
//         closeFunction: () => _dialogService.dialogComplete(),
//         buttons: [
//           DialogButton(
//             child: Text('Ok'),
//             onPressed: () {
//               _dialogService.dialogComplete();
//               Navigator.of(context).pop();
//             },
//           )
//         ]).show();
//   }
// }
}
