import 'package:flutter/material.dart';

class SocialMedia {
  final String name;
  final String link;
  final String iconPath;
  final Color backgroundColor;

  const SocialMedia({
    required this.name,
    required this.link,
    required this.iconPath,
    required this.backgroundColor,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) {
    return SocialMedia(
      name: json['name'] as String,
      link: json['link'] as String,
      iconPath: json['iconPath'] as String,
      backgroundColor: Color(json['backgroundColor'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'link': link,
      'iconPath': iconPath,
      'backgroundColor': backgroundColor.value,
    };
  }

  @override
  String toString() {
    return 'SocialMedia(name: $name, link: $link)';
  }
}