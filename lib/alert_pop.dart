import 'package:rflutter_alert/rflutter_alert.dart';

class AlertPop {



  void alertButtons(context, int score) {
    // print('alert score: $score');
    // if (score > 3) {
    //   showDialog(
    //       context: context,
    //       builder: (context) =>
    //           AlertDialog(
    //             content: Text("hi"),
    //           ));
    // } else {
    Alert(
      //if (score <13) {};
      context: context,
      type: AlertType.none,

      title: "QUIZZLER",
      desc: "Quiz finished score $score",
      buttons: [
        DialogButton(
          onPressed: () {
            //Navigator.pop(context);
            Phoenix.rebirth(context);
            _questionNumber = 0;
          },
          color: Colors.green,
          child: const Text(
            "Start Over",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        DialogButton(
          onPressed: () => exit(0), //Navigator.pop(context),
          color: Colors.red,
          child: const Text(
            "Exit app",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    ).show();
  }

  class Question {
  String questionText;
  bool questionAnswer;

  //removing {} in constructor you can just enter 'text', bool in quiz_brain class
  Question(String q, bool a)
      : questionText = q,
  questionAnswer = a;
  }
}