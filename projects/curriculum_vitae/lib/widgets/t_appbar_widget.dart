import 'package:curriculum_vitae/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TAppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: _titleAppBar(),
    );
  }

  Widget _titleAppBar() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'My',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontFamily: 'Nunito',
          ),
          ),
          TextSpan(
            text: 'CV',
            style: TextStyle(
              color: const Color.fromRGBO(209, 45, 45, 1),
              fontSize: 28,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
