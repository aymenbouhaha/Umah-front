import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';


class TextPanel extends StatefulWidget {
  TextPanel({
    Key? key,
    required this.text,
    required this.widthPercentage,
  }) : super(key: key);

  String text;
  double widthPercentage;

  @override
  State<TextPanel> createState() => _TextPanelState();
}

class _TextPanelState extends State<TextPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * this.widget.widthPercentage,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width *
                  0.5 // use 4% of screen width as radius
              ),
          color: AppColors.TEXT_BOX_COLOUR,
        ),
        child:
            // Center(child: Padding(
            //   padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * this.widget.widthPercentage*0.07),
            Row(children: <Widget>[
          SizedBox(
              width: MediaQuery.of(context).size.width *
                  this.widget.widthPercentage *
                  0.07), // Add any horizontal padding you need
          Expanded(
            child: Text(
              this.widget.text,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.TEXT_BOX_CONTENT_COLOUR,
              ),
            ),
          )
        ]));
  }
}
