import 'package:e_commerce/constraints.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double value = 3.5;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/user_prof_pic.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),

          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorContent,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'Jane Doe',
                            style: txtHeading2.copyWith(color: colorBlack),
                          ),
                          Row(
                            children: [
                              Text(
                                value.toString(),
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 12),
                              ..._generateStarRow(value),
                            ],
                          ),
                        ],
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          color: colorBg,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: sizeElementsSeparator),

                  Center(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 32,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      child: Text(
                        'LogOut',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _generateStarRow(double value) {
    int fullStars = value.floor();
    bool hasHalfStar = (value - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    List<Widget> stars = [];

    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star_rounded, color: Colors.red, size: 20));
    }

    if (hasHalfStar) {
      stars.add(Icon(Icons.star_half_rounded, color: Colors.red, size: 20));
    }

    for (int i = 0; i < emptyStars; i++) {
      stars.add(Icon(Icons.star_border_rounded, color: Colors.red, size: 20));
    }

    return stars;
  }
}
