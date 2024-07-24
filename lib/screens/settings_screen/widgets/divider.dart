

import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({Key? key, required this.width, required this.text}) : super(key: key);
  double width;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width*0.8,
          child: Row(
            children: [
              Text(text, style: TextStyle(color: AppColors.TEXT_GREY, fontSize: 20 ,fontWeight: FontWeight.w900, fontFamily: "Poppins"),),
            ],
          ),
        ),
        Container(
          color: AppColors.TEXT_GREY,
          width: width,
          height: 2,
        ),
      ],
    );
  }
}
