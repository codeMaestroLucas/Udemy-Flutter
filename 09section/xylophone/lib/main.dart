import 'package:audioplayers/audioplayers.dart';
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
      title: 'Xylophone',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 1; i <= 7; i++)
            Expanded(
              child: XylophoneWidget(
                noteNumber: i,
                color: Colors.primaries[i % Colors.primaries.length],
              ),
            ),
        ],
      ),
    );
  }
}

class XylophoneWidget extends StatelessWidget {
  final int noteNumber;
  final Color color;

  const XylophoneWidget({
    super.key,
    required this.noteNumber,
    required this.color,
  });

  String _defineNoteName(int noteNumber) {
    switch (noteNumber) {
      case 1:
        return "C";
      case 2:
        return "D";
      case 3:
        return "E";
      case 4:
        return "F";
      case 5:
        return "G";
      case 6:
        return "A";
      case 7:
        return "B";
      default:
        return "C";
    }
  }

  @override
  Widget build(BuildContext context) {
    final AudioPlayer audioPlayer = AudioPlayer();
    // The AudioPlayer class already has the constructor to the `assets` folder.

    return TextButton(
      onPressed: () {
        audioPlayer.play(AssetSource('note$noteNumber.wav'));
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            _defineNoteName(noteNumber),
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
