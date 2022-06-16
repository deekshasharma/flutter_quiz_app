import 'package:flutter/material.dart';
import 'package:flutter_quiz/question.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(
              title: 'Quizzy',
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<Question> questions = [
    Question(question: 'Canada Day is celebrated on July 1', answer: true),
    Question(question: 'Queen Elizabeth I is the Royal Queen', answer: false),
    Question(
        question: 'Aboriginals were the founding people of Canada',
        answer: true),
  ];

  int currentQuestionNumber = 0;

  isLastQuestion() {
    return currentQuestionNumber == questions.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    // print(questions[0].toString());
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
                questions[currentQuestionNumber].question,
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
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (questions[currentQuestionNumber].answer == true) {
                    scoreKeeper.add(const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    ));
                  }
                });
                if (isLastQuestion() == false) {
                  setState(() {
                    currentQuestionNumber += 1;
                  });
                } else {
                  print('Quiz finished');
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (questions[currentQuestionNumber].answer == false) {
                  scoreKeeper.add(const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ));
                } else {
                  scoreKeeper.add(const Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                  ));
                }
                if (isLastQuestion() == false) {
                  setState(() {
                    currentQuestionNumber += 1;
                  });
                } else {
                  print('Quiz finished');
                }
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
