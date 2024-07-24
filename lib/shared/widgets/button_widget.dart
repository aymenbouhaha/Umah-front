import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {Key? key,
        this.filled=true,
      this.fontColor = Colors.black,
      required this.onTap,
      required this.width,
      required this.height,
      required this.textContent,

      required this.color})
      : super(key: key);

  double width;
  double height;
  String textContent;
  Function() onTap;
  BoxBorder? boxBorder;
  Color? textColor;
  Color color;
  Color fontColor;
  bool filled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border:filled?null: Border.all(width: 1,color: color) ,
          borderRadius: BorderRadius.circular(50),
          color:filled? color:Colors.transparent,
        ),
        child: Text(
          textContent,
          style: TextStyle(
              color: fontColor,
              fontWeight: FontWeight.w900,
              fontFamily: "Poppins",
              fontSize: 14),
        ),
      ),
    );
  }
}
