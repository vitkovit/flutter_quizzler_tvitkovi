import 'package:flutter/material.dart';
//import 'package:quizzler/question.dart'; can be deleted if not used
import 'quiz_brain.dart';

//create new quizBrain object and it should be equal to QuizBrain();
QuizBrain quizBrain = QuizBrain(); //that construct new object which we can refer to
//import 'question.dart';
void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  // you can save type to project dictionary
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<Icon> scoreKeeper = [
  //   Icon(
  //     Icons.check,
  //     color: Colors.green,
  //   ),
  //   Icon(
  //     Icons.close,
  //     color: Colors.red,
  //   ),
  //   Icon(
  //     Icons.check,
  //     color: Colors.green,
  //   ),
  //   Icon(
  //     Icons.close,
  //     color: Colors.red,
  //   ),
  //   Icon(
  //     Icons.check,
  //     color: Colors.green,
  //   ),
  //   Icon(
  //     Icons.close,
  //     color: Colors.red,
  //   ),
  // ];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answer = [
  //   false,
  //   true,
  //   true,
  // ];
  //
  // Question q1 = Question(
  //   q: 'You can lead a cow down stairs but not up stairs.',
  //   a: false,
  // );

  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(questionNumber), //questionBank is now a property of a quizBrain object
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              onPressed: () {
    //            quizBrain.questionBank[questionNumber].questionAnswer = true; //this can mess up the code if we change it before checking
                bool correctAnswer =
    //                quizBrain.questionBank[questionNumber].questionAnswer; // check logic in 2 lists
                //quizBrain.questionBank[questionNumber].questionAnswer;
                  quizBrain.getCorrectAnswer(questionNumber);
                if (correctAnswer == true) {
                  print('right');
                } else {
                  print('wrong');
                }
                // print(q1.questionText);
                // print(q1.questionAnswer);

                setState(() {
                  // set state needs to be set to iterate through list
                  questionNumber++;
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer =
                    quizBrain.getCorrectAnswer(questionNumber); // check logic in 2 lists
                if (correctAnswer == false) {
                  // logic go before next question
                  print('right');
                } else {
                  print('wrong');
                }
                setState(() {
                  questionNumber++;
                });
              },
            ),
          ),
        ),
        // Row(
        //   children: scoreKeeper,
        // )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
