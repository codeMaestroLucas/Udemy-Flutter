// To lock the screen in portrait mode

// ignore_for_file: unused_import

import 'package:challange/challenge_one.dart';
import 'package:challange/challenge_two.dart';
import 'package:challange/data/social_media_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SocialMediaData socialMediaData = SocialMediaData();
  await socialMediaData.getSocialMedias();

  // Lock the screen in portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => socialMediaData,
        child: const MyApp(),
      )
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenge App',
      // home: ChallengeOne(),
      home: ChallengeTwo(),
    );
  }
}
