import 'dart:convert';

import 'package:challange/social_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SocialMediaData extends ChangeNotifier {
  List<SocialMedia> listSocialMedias = [];

  Future<void> getSocialMedias() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    listSocialMedias =
        (jsonData['social_media'] as List)
            .map(
              (item) => SocialMedia(
                cardText: item['cardText'] as String,
                link: item['link'] as String,
                cardImagePath: item['cardImagePath'] as String,
                backgroundColor: Color(item['backgroundColor'] as int),
              ),
            )
            .toList();

    notifyListeners();
  }
}
