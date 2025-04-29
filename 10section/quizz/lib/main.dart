import 'package:flutter/material.dart';

import 'quiz.dart';
import 'quiz_btn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Quiz quiz;
  int _score = 0;
  bool _showFeedback = false;
  bool? _lastAnswerWasCorrect;

  @override
  void initState() {
    super.initState();
    quiz = Quiz();
  }

  void _checkAnswer(bool userAnswer) {
    setState(() {
      _lastAnswerWasCorrect = (userAnswer == quiz.getCurrentAnswer());
      _showFeedback = true;
      quiz.checkAnswer(userAnswer);
      _score = quiz.getTotalScore();

      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          _showFeedback = false;
          if (!quiz.isFinished()) {
            quiz.nextQuestion();
          }
        });
      });
    });
  }

  void _resetQuiz() {
    setState(() {
      quiz.reset();
      _score = 0;
      _showFeedback = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              quiz.isFinished()
                  ? Text("")
                  : Text(
                    'Question ${quiz.getCurrentIndex() + 1}/${quiz.getTotalQuestions()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(98, 255, 255, 255),
                      fontSize: 16,
                    ),
                  ),
              
              Expanded(
                flex: 5,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 100),
                      child:
                          _showFeedback
                              ? Icon(
                                _lastAnswerWasCorrect!
                                    ? Icons.check
                                    : Icons.close,
                                color:
                                    _lastAnswerWasCorrect!
                                        ? Colors.green
                                        : Colors.red,
                                size: 100,
                              )
                              : Text(
                                quiz.isFinished()
                                    ? "Quiz Completed!\nScore: $_score/${quiz.getTotalQuestions()}"
                                    : quiz.getCurrentQuestion(),
                                key: ValueKey<String>(
                                  quiz.getCurrentQuestion(),
                                ),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                    ),
                  ),
                ),
              ),
              if (!quiz.isFinished()) ...[
                QuizButton(
                  color: Colors.green,
                  text: "True",
                  onPressed: () => _checkAnswer(true),
                ),
                const SizedBox(height: 16),
                QuizButton(
                  color: Colors.red,
                  text: "False",
                  onPressed: () => _checkAnswer(false),
                ),
              ] else ...[
                QuizButton(
                  color: Colors.blue,
                  text: "Restart Quiz",
                  onPressed: _resetQuiz,
                ),
              ],
              
              Text(
                'Score: $_score/${quiz.getTotalQuestions()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
