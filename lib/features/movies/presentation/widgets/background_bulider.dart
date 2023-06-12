import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/core/utlis/colors.dart';

class BackGroundBuilder extends StatelessWidget {
  const BackGroundBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          top: -100,
          left: -100,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greenColor.withOpacity(0.5),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 200,
                sigmaY: 200,
              ),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Positioned(
          top:400,
          right: -88,
          child: Container(
            height: 166,
            width: 166,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.pinkColor.withOpacity(0.5),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 200,
                sigmaY: 200,
              ),
              child: Container(
                height: 166,
                width: 166,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -100,
          left: -100,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cyanColor.withOpacity(0.5),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 200,
                sigmaY: 200,
              ),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
