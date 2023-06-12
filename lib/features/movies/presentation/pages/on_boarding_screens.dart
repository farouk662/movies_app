import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/core/utlis/colors.dart';

import '../../../../core/components/custom_outline.dart';
import 'home_bage.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Positioned(
                left: -80,
                height: screenHeight * .2,
                child: Container(
                  height: 186,
                  width: 186,
                  decoration: const BoxDecoration(
                      color: AppColors.pinkColor, shape: BoxShape.circle),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: const SizedBox(
                      height: 186,
                      width: 186,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -110,
                height: screenHeight * .7,
                child: Container(
                  height: 220,
                  width: 220,
                  decoration: const BoxDecoration(
                      color: AppColors.cyanColor, shape: BoxShape.circle),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: const SizedBox(
                      height: 220,
                      width: 220,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * .07,
                    ),
                    CustomOutline(
                      strokeWidth: 4,
                      radius: screenWidth * .8,
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [AppColors.pinkColor, AppColors.cyanColor]),
                      width: screenWidth * .76,
                      height: screenHeight * .34,
                      padding: const EdgeInsets.all(4),
                      child: Container(
                          decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/img-onboarding.png',
                            ),
                            fit: BoxFit.cover),
                      )),
                    ),
                    SizedBox(height: screenHeight*.08,),
                     Text('Watch movies in \n Virtual Reality',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 34,
                      color: AppColors.whiteColor.withOpacity(.9),
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: screenHeight*.03,),
                    Text('Download and watch offline \n when ever you are',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          color: AppColors.whiteColor.withOpacity(.7),
                          fontWeight: FontWeight.w500
                      ),),
                    SizedBox(height: screenHeight*.08,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                      },
                      child: CustomOutline(
                        strokeWidth: 2,
                        radius: screenWidth * .8,
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [AppColors.pinkColor, AppColors.cyanColor]),
                        width: 160,
                        height: 38,
                        padding: const EdgeInsets.all(2),
                        child: Container(
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [AppColors.pinkColor.withOpacity(.3), AppColors.cyanColor.withOpacity(.3)])
                            ),
                        child: const Center(
                          child: Text('Sign up',style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),),
                        ),),
                      ),
                    ),
                    const Spacer(),
                   Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                     children: List.generate(3, (index) {
                     return Container(
                       height: 7,
                       width: 7,
                       decoration: BoxDecoration(shape: BoxShape.circle,
                           color: index==0?AppColors.whiteColor.withOpacity(.9):AppColors.whiteColor.withOpacity(.3)),
                       margin: const EdgeInsets.symmetric(horizontal: 4),

                     );
                   }),),
                    SizedBox(height: screenHeight*.03,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
