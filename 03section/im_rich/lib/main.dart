import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I\'m rich APP',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'I\'m Rich',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(236, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          /**
           * * Image widget can be used to display images from different sources:
           * 1. Network: Image.network('url') -> From the internet
           *     - Make sure to add internet permission in AndroidManifest.xml for Android
           *     - The image will be loaded from the URL provided, so it's take time to load.
           *
           * 2. Asset: Image.asset('assets/image.png') -> From the assets folder
           *     - Make sure to add the image in pubspec.yaml file under assets section
           *
           * 3. File: Image.file(File('path/to/file')) -> From the local file system
           *
           * 4. Memory: Image.memory(Uint8List) -> From memory (e.g., image data)
           */
          // child: Image.asset('assets/diamond.png', width: 300, height: 300), -> From assets folder
          child: Image.network(
            'https://purepng.com/public/uploads/large/purepng.com-brilliant-diamondbrilliantdiamondgemstonecutcrystalbrilliant-cutgemsjewelryshaped-1701528779386zlnyg.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
