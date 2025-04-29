// import 'package:challange/social_media.dart';
import 'package:challange/data/social_media_data.dart';
import 'package:flutter/material.dart';

class ChallengeTwo extends StatelessWidget {
  const ChallengeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final socialMediaData = Provider.of<SocialMediaData>(context);
    final socialMedias = socialMediaData.listSocialMedias;
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 6, 108, 56),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundColor: const Color.fromARGB(218, 255, 255, 255),
              backgroundImage: Image.asset('assets/images/lucas.jpg').image,
            ),
            const SizedBox(height: 16),
            // The `const` value increases the performance of the app
            // by allowing the compiler to optimize the widget tree
            // and avoid unnecessary rebuilds.
            Column(
              children: [
                Text(
                  "Lucas Samuel",
                  style: TextStyle(
                    letterSpacing: -1,
                    fontFamily: 'Karla',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    letterSpacing: 3,
                    color: const Color.fromARGB(255, 229, 229, 229),
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                  ),
                ),
              ],
            ),


          //   //TODO: Add an embed link to this cards to the email and phone number.
          //   SocialMedia(
          //     cardText: '+55 123456789',
          //     cardImagePath: const Icon(Icons.phone),
          //   ),
          //   const SizedBox(height: 16),
          //   SocialMedia(
          //     cardText: 'lucas@email.com',
          //     cardImagePath: const Icon(Icons.mail),
          //   ),
          //   // const SizedBox(height: 16),
          //   // MyCard(
          //   //   cardText: 'github.com/lucassamuel',
          //   //   // cardIcon: const Icon(Icons.github),
          //   //   //todo: how to add an svg icon to the card?
          //   // ),
          //   const SizedBox(height: 16),
          //   SocialMedia(
          //     cardText: 'Brasília/DF',
          //     cardImagePath: Icon(Icons.location_on),
          //   ),
          ],
        ),
      ),
    );
  }
}
