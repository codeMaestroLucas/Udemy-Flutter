import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice App',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: FlexRow()),
    );
  }
}

class FlexRow extends StatefulWidget {
  const FlexRow({super.key});

  @override
  State<FlexRow> createState() => _FlexRowState();
}

class _FlexRowState extends State<FlexRow> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeBothDicesValue() {
    // leftDiceNumber = (leftDiceNumber % 6) + 1; -> Just add 1 to
    // the current number showned in the dice

    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      // Generate a random number between 1 and 6
      // Random().nextInt(6) generates a number between 0 and 5, so
      // we add 1 to get a number between 1 and 6

      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            flex: 1, // Std value for flex
            // flex: 2, // 2 times the size of the other two
            /**
             * If the other widget was an Column, the flex value would work
             * based in the height
             */
            child: TextButton(
              onPressed: () {
                changeBothDicesValue();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeBothDicesValue();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
