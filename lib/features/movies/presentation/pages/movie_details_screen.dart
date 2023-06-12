import 'package:flutter/material.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/utlis/colors.dart';
import 'package:widget_mask/widget_mask.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Color(0xFF19191B)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            Container(
              height: screenHeight * .4,
              width: screenWidth,
              decoration:  BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black12,Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                       ApiConstance.imageUrl('/hiHGRbyTcbZoLsYYkO4QiCLYe34.jpg'),
                      ))),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          const Spacer(),
                          Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    const Spacer(),

                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

          ],
        ),
      ),
    );
  }
}
