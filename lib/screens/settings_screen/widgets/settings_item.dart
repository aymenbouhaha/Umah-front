import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsItem extends StatelessWidget {
  SettingsItem({Key? key, required this.width, required this.iconPath, required this.hint}) : super(key: key);

  double width;
  String iconPath;
  String hint;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: width*0.14,right: width*0.04 , bottom: 5,top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(iconPath, height: 30, width: 30,),
                    SizedBox(width: 8,),
                    Text(hint,style: TextStyle(color: Colors.black, fontSize: 20 ,fontWeight: FontWeight.w500, fontFamily: "Poppins"),)
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
