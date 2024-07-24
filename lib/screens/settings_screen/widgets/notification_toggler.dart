
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationToggler extends StatefulWidget {
  NotificationToggler({Key? key ,required this.width, required this.iconPath, required this.hint}) : super(key: key);

  double width;
  String iconPath;
  String hint;

  @override
  State<NotificationToggler> createState() => _NotificationTogglerState();
}

class _NotificationTogglerState extends State<NotificationToggler> {
  bool value=false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: widget.width*0.14,right: widget.width*0.04 , bottom: 5,top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(widget.iconPath, height: 30, width: 30,),
                  SizedBox(width: 8,),
                  Text(widget.hint,style: TextStyle(color: Colors.black, fontSize: 20 ,fontWeight: FontWeight.w500, fontFamily: "Poppins"),)
                ],
              ),
            ),
            Switch(value: value,
                activeColor: Colors.lightGreenAccent,
                onChanged: (value){
              setState(
                  (){
                    this.value=value;
                  }
              );
            })

          ],
        ),
      ),
    );;
  }
}
