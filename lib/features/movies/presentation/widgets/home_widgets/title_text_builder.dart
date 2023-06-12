import 'package:flutter/material.dart';

import '../../../../../core/utlis/text_styles.dart';

class TitleTextBuilder extends StatelessWidget {
  const TitleTextBuilder(this.text,{Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(text,
          textAlign: TextAlign.center,
          style: AppStyles.title),
    );
  }
}
