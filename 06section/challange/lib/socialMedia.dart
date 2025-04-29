import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  final String cardText;
  final String link;
  final Icon cardIcon;
  final Color backgroundColor;

  const SocialMedia({
    super.key,
    required this.cardText,
    required this.link,
    required this.cardIcon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: cardIcon,
        iconColor: const Color.fromARGB(255, 17, 94, 37),
        title: Text(
          cardText,
          style: const TextStyle(
            fontFamily: 'Nunito',
            color: Colors.black,
            fontWeight: FontWeight.w100,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
