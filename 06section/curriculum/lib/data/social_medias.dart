import 'dart:convert';
import 'package:curriculum/models/social_media.dart';
import 'package:flutter/services.dart';

class SocialMediaRepository {
  Future<List<SocialMedia>> loadSocialMedias() async {
    try {
      final String jsonString = 
          await rootBundle.loadString('assets/data.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      
      final List<dynamic> socialMediasJson = jsonData['social_media'];
      return socialMediasJson
          .map((json) => SocialMedia.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load social medias: $e');
    }
  }
}