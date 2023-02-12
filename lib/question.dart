// all classes start with capital
class Question {
  String questionText;
  bool questionAnswer;

  //removing {} in constructor you can just enter 'text', bool in quiz_brain class
  Question(String q, bool a)
      : questionText = q,
        questionAnswer = a;
}
