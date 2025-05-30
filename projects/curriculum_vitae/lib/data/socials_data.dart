import 'package:curriculum_vitae/models/socials_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SocialsData {
  final List<SocialsModel> data = [
    SocialsModel(
      imagePath: 'assets/images/logos/gitHub.png',
      name: 'GitHub',
      link: 'https://github.com/codeMaestroLucas',
    ),
    SocialsModel(
      imagePath: 'assets/images/logos/linkedIn.png',
      name: 'LinkedIn',
      link: 'https://www.linkedin.com/in/lucas-samuel-64846a253/',
    ),
    SocialsModel(
      imagePath: 'assets/images/logos/whatsApp.png',
      name: 'WhatsApp',
      link:  'https://wa.me/${dotenv.env['PHONE']}',
    ),
  ];
}
