

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/colors.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({Key? key, required this.textContent, required this.onTap}) : super(key: key);

  String textContent;
  void Function() onTap;


  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.24,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.TEXT_BOX_COLOUR,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              "assets/images/icons/calendar_icon.svg",
              height: 18,
              width: 18,
            ),
            Text(widget.textContent,
                style: TextStyle(
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.bold
                )
            ),
            SvgPicture.asset(
                "assets/images/icons/arrow_down_icon.svg"),
          ],
        ),
      ),
      onTap: widget.onTap,
    );
  }
}
