class Quiz {
  final List<Map<String, bool>> _questions = [
    {"The Earth is flat.": false},
    {"Flutter is a UI toolkit.": true},
    {"Dart is a programming language.": true},
    {"The sun rises in the west.": false},
    {"The sky is blue.": true},
    {"Cats are reptiles.": false},
    {"Water freezes at 0 degrees Celsius.": true},
    {"The capital of France is Paris.": true},
    {"The Great Wall of China is visible from space.": false},
    {"Humans have four lungs.": false},
  ];

  int _currentIndex = 0;
  int _score = 0;

  Quiz() {
    _questions.shuffle();
  }

  String getCurrentQuestion() {
    if (_currentIndex >= _questions.length) {
      return "Quiz Completed!";
    }
    return _questions[_currentIndex].keys.first;
  }

  bool getCurrentAnswer() {
    return _questions.isEmpty ? false : _questions[_currentIndex].values.first;
  }

  void checkAnswer(bool userAnswer) {
    if (userAnswer == getCurrentAnswer()) {
      _score++;
    }
  }

  void nextQuestion() {
    if (!isFinished()) {
      _currentIndex++;
    }
  }

  bool isFinished() {
    return _currentIndex >= _questions.length;
  }

  int getTotalScore() {
    return _score;
  }

  int getTotalQuestions() {
    return _questions.length;
  }

  int getCurrentIndex() {
    return _currentIndex;
  }

  void reset() {
    _questions.shuffle();
    _currentIndex = 0;
    _score = 0;
  }
}
