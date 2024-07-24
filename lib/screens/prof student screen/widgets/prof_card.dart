import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProfCardWidget extends StatefulWidget {
  ProfCardWidget(
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

  @override
  State<ProfCardWidget> createState() => _ProfCardWidgetState();
}

class _ProfCardWidgetState extends State<ProfCardWidget> {
  @override
  Widget build(BuildContext context) {
    if (!this.widget.isSelected) {
      this.widget.color1 = Color(0xFF4B4B4B);
      this.widget.color2 = Color(0xFF3B3B3B);
    } else {
      this.widget.color1 = Color(0xFF622E4F);
      this.widget.color2 = Color(0xFF401F40);
    }
    return Container(
        width: MediaQuery.of(context).size.width * this.widget.widthPercentage +
            20,
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
                  borderRadius: BorderRadius.circular(20),
                  gradient: RadialGradient(
                    center: Alignment(-0.18, -0.36),
                    radius: 1.41,
                    colors: [
                      this.widget.color1,
                      this.widget.color2,
                    ],
                    stops: [0.4228, 1],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: MediaQuery.of(context).size.width *
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
                  0.05,
              top: MediaQuery.of(context).size.height *
                  this.widget.heightPercentage *
                  0.025,
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
                  'assets/images/illustrations/prof_card_illusration.svg',
                  height: MediaQuery.of(context).size.height *
                      this.widget.heightPercentage *
                      1.08,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width *
                  this.widget.widthPercentage *
                  0.62,
              top: MediaQuery.of(context).size.height *
                  this.widget.heightPercentage *
                  0.28,
              child: Text(
                "Professeur \nde\n musique",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 225, 225, 225),
                  shadows: [
                    Shadow(
                      offset: Offset(-1, 3),
                      blurRadius: 0,
                      color:
                          Color.fromARGB(255, 172, 172, 172).withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
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
                  height:  MediaQuery.of(context).size.height* 0.5,
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
                        'Professeur\nde musique',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 32.0,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(height:  MediaQuery.of(context).size.height / 86 * 1.8),
                      // The popup text
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
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