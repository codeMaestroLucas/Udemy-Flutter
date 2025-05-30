import 'package:curriculum_vitae/models/socials_model.dart';
import 'package:curriculum_vitae/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialsWidget extends StatelessWidget {
  final SocialsModel item;
  const SocialsWidget({super.key, required this.item});

  Future<void> _launchLink(String? link) async {
    if (link == null || link.isEmpty) return;

    final Uri url = Uri.parse(link);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchLink(item.link);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                item.imagePath,
                height: 50,
                width: 50,
                color: Colors.red,
              ),
              const SizedBox(height: 4),
              Text(
                item.name,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
