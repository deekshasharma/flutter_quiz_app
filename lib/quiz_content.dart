import 'package:flutter_quiz/question.dart';

class QuizContent {
  final List<Question> _questions = [
    Question(question: 'Canada Day is celebrated on July 1', answer: true),
    Question(question: 'Queen Elizabeth I is the Royal Queen', answer: false),
    Question(
        question: 'Aboriginals were the founding people of Canada',
        answer: true),
  ];

  String getQuestion(int questionNumber) {
    return _questions[questionNumber].question;
  }

  bool getAnswer(int questionNumber) {
    return _questions[questionNumber].answer;
  }

  int getTotalQuestions() {
    return _questions.length;
  }
}
