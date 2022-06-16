import 'package:flutter_quiz/question.dart';

class QuizContent {
  int _currentQuestionNumber = 0;
  final List<Question> _questions = [
    Question(question: 'Canada Day is celebrated on July 1', answer: true),
    Question(question: 'Queen Elizabeth I is the Royal Queen', answer: false),
    Question(
        question: 'Aboriginals were the founding people of Canada',
        answer: true),
  ];

  void nextQuestion(){
    if(_currentQuestionNumber < _questions.length - 1){
      _currentQuestionNumber++;
    }
  }

  String getQuestion() {
    return _questions[_currentQuestionNumber].question;
  }

  bool getAnswer() {
    return _questions[_currentQuestionNumber].answer;
  }

}
