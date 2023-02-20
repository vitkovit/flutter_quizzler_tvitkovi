import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'quiz_brain.dart';

//create new quizBrain object and it should be equal to QuizBrain();
QuizBrain quizBrain =
    QuizBrain(); //that construct new object which we can refer to
//import 'question.dart';
void main() => runApp(Phoenix(child: const Quizzler()));

class Quizzler extends StatelessWidget {
  // you can save type to project dictionary
  const Quizzler({super.key});

  @override //its polymorphism in action, inheriting from parent and changing
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
  List<Icon> scoreKeeper = [];
  //empty the list from previous lesson
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

//  int questionNumber = 0; remove it and put in to brain
  int scorePoint = 0;
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(
      () {
        if (quizBrain.isFinished(context) == true) {
          //calling buttons from brain class
          quizBrain.alertButtons(context, scorePoint);
          //replacing scorePoint whit quizBrain.finalScore(scoreKeeper, 'correct'),
          //will iterate through icon dictionary and check correct answers
          //no need to use because we can make scorePoint counter
        } else {
          if (userPickedAnswer == correctAnswer) {
            //when answer is correct increase counter
            scorePoint++;
            //add tick if selected answer is correct and x if it is not
            scoreKeeper.add(
              const Icon(
                Icons.check,
                color: Colors.green,
                //semanticLabel can be used if we use quizBrain.finalScore
                //semanticLabel: 'correct',
              ),
            );
          } else {
            scoreKeeper.add(
              const Icon(
                Icons.close,
                color: Colors.red,
                //semanticLabel: 'wrong',
              ),
            );
          }
          // call function that will increment question number
          quizBrain.nextQuestion();
        }
      },
    );
  }

  //void alertButtons is created in brain
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
                quizBrain.getQuestionText(),
                //questionBank is now a property of a quizBrain object
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
                checkAnswer(true);
                //this can mess up the code if we change it before checking
//             quizBrain.questionBank[questionNumber].questionAnswer = true;
//                 bool correctAnswer =
//                     //quizBrain.questionBank[questionNumber].questionAnswer; // check logic in 2 lists
//                     //quizBrain.questionBank[questionNumber].questionAnswer;
//                     //quizBrain.getCorrectAnswer(questionNumber); //no longer need questionNumber
//                     quizBrain.getCorrectAnswer();
//
//                 if (correctAnswer == true) {
//                   print('right');
//                 } else {
//                   print('wrong');
//                 }
//                 // print(q1.questionText);
//                 // print(q1.questionAnswer);
//
//                 setState(() {
//                   // set state needs to be set to iterate through list
//                   //questionNumber++; //not needed after NextQuestion constructor
//                   quizBrain.nextQuestion();
//                 });
                //The user picked true.
              }, // onPressed
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
                checkAnswer(false);
                // bool correctAnswer =
                //     quizBrain.getCorrectAnswer(); // check logic in 2 lists
                // // if (correctAnswer == false) {
                // // logic go before next question
                // // print('right');
                // // } else {
                // //   print('wrong');
                // // }
                // setState(
                //   () {
                //     quizBrain.nextQuestion();
              },
            ),
          ),
        ),
        //Use Wrap instead of row, if you have more questions they can all fit
        Wrap(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
//String success_error = 'error';
// Alert with multiple and custom buttons

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

//DONE: Step 1 - Add the Flutter Alert package as a dependency here and use *Packages get".
//DONE: Step 2 - Import the Flutter_ Alert package.
//DONE: Step 3 - Create a method called isFinished() that checks to see if we are at the end of the quiz.
//DONE: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,  show an alert using Flutter_ alert, reset the questionNumber, empty out the scoreKeeper.
//DONE: Step 5 - Create a reset () method here that sets the questionNumber back to 0.
//DONE: Step 6 - If we've not reached the end, ELSE do the answer checking steps below
//DONE: addition 01 - Insert Score and number of questions in popup
//DONE: addition 02 - Solve problem with Icons getting out of window width
