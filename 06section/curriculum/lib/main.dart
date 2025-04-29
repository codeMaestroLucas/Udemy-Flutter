import 'package:curriculum/data/social_medias.dart';
import 'package:curriculum/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final socialMediasData = SocialMediaRepository();
    await socialMediasData.loadSocialMedias();

    runApp(Provider.value(value: socialMediasData, child: const MyApp()));
  } catch (e) {
    runApp(const ErrorApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curriculum Vitae',
      home: Scaffold(body: SplashScreen(), backgroundColor: Colors.green[800]),
    );
  }
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text('Failed to load app data'))),
    );
  }
}
