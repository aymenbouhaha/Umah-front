import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class StudentCardWidget extends StatefulWidget {
  StudentCardWidget(
      {Key? key,
      required this.widthPercentage,
      required this.heightPercentage,
      required this.isSelected})
      : super(key: key);

   double widthPercentage;
  double heightPercentage;
  bool isSelected;
  late Color color1;
  late Color color2;
  late Color color3;

  @override
  State<StudentCardWidget> createState() => _StudentCardWidgetState();
}

class _StudentCardWidgetState extends State<StudentCardWidget> {
  @override
  Widget build(BuildContext context) {
    if (this.widget.isSelected) {
      this.widget.color1 = Color(0xffEDEBF5);
      this.widget.color2 = Color(0xff5C50A2);
      this.widget.color3 = Color(0xffA39BCE);
    } else if (!this.widget.isSelected) {
      this.widget.color1 = Color(0xffE6E6E6);
      this.widget.color2 = Color(0xff6A6A6A);
      this.widget.color3 = Color(0xffa6a6a6);
    }
    return Container(
      width:
          MediaQuery.of(context).size.width * this.widget.widthPercentage + 20,
      height:
          MediaQuery.of(context).size.height * this.widget.heightPercentage +
              20,
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              width: MediaQuery.of(context).size.width *
                  this.widget.widthPercentage,
              height: MediaQuery.of(context).size.height *
                  this.widget.heightPercentage,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.05),
                gradient: RadialGradient(
                  center: Alignment(0.5567, 1.0),
                  radius: 0.765,
                  colors: [
                    this.widget.color1,
                    this.widget.color2,
                    this.widget.color3,
                  ],
                  stops: [0.0, 0.0001, 0.9792],
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width *
                this.widget.widthPercentage *
                0.025,
            top: MediaQuery.of(context).size.height *
                this.widget.heightPercentage *
                0.025,
            child: IconButton(
              icon: Icon(
                Icons.info,
                color: Color.fromARGB(255, 241, 241, 241),
                size: 20,
              ),
              onPressed: () => showPopup(context),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width *
                this.widget.widthPercentage *
                0.395,
            child: ColorFiltered(
              colorFilter: this.widget.isSelected
                  ? ColorFilter.matrix([
                      1,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                    ])
                  : ColorFilter.matrix(<double>[
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                    ]),
              child: SvgPicture.asset(
                'assets/images/illustrations/student_card_illustration.svg',
                height: MediaQuery.of(context).size.height *
                    this.widget.heightPercentage *
                    1.08,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width *
                this.widget.widthPercentage *
                0.06,
            top: MediaQuery.of(context).size.height *
                this.widget.heightPercentage *
                0.37,
            child: Text(
              "Etudiant",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 241, 241, 241),
                shadows: [
                  Shadow(
                    offset: Offset(-2, 5),
                    blurRadius: 0,
                    color: Color.fromARGB(255, 98, 98, 98).withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      debugPrint(MediaQuery.of(context).size.width.toString());
      return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Stack(
            children: <Widget>[
              // The blurred background
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
              ),
              // The popup content
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width* 0.83,
                  height:  MediaQuery.of(context).size.height* 0.45,
                  padding: EdgeInsets.only(top:18,left: 24,right: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // The popup title
                      Text(
                        'Etudiant',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 32.0,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 86 *2),
                      // The popup text
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          fontFamily: "Poppins",
                          color: Color(0xFF5F5F5F)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
    },
  );
}
