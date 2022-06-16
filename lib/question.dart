class Question {
  String question = '';
  bool answer = true;

  Question({required String question, required bool answer}) {
    // ignore: prefer_initializing_formals
    this.question = question;
    // ignore: prefer_initializing_formals
    this.answer = answer;
  }

  @override
  toString() {
    return "question: $question, answer: $answer";
  }
}
