import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheater/bloc/weather_bloc.dart';
import 'package:wheater/responsive.dart';
import 'package:wheater/theme/app_colors.dart';
import 'package:wheater/widgets/container_blur_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        
        if (state is WeatherSucesse) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
              ),
            ),

            extendBodyBehindAppBar: true,
            backgroundColor: AppColors.bgColor,

            body: Padding(
              padding: const EdgeInsets.fromLTRB(40, kToolbarHeight, 40, 20),

              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

                child: Stack(
                  children: [
                    ...ContainerBlurWidget.defaultBlurBlocks(),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(color: Colors.transparent),
                    ),

                    //! The Stack widget DOESN'T have the Expadend widget functionality
                    //! because the Expanded doesn't know how to `expand`
                    // Use Positioned.fill or SizedBox.expand instead of Expanded
                    Positioned.fill(child: ResponsiveLayout(state: state)),
                  ],
                ),
              ),
            ),
          );

        } else {
          return Scaffold(body: Container());
        }
      },
    );
  }
}
