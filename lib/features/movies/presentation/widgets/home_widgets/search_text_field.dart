import 'package:flutter/material.dart';

import '../../../../../core/utlis/colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(.12),
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: AppColors.whiteColor.withOpacity(.3)),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.greyColor,
            )),
      ),
    );
  }
}
