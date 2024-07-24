import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/styles/colors.dart';
import '../welcome_before_screen.dart';


class SecondLandingScreen extends StatelessWidget {
  const SecondLandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 68;

    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            child: SvgPicture.asset(
              "assets/images/background/svg/landing2_back.svg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: height10 * 5, right: width10 * 3),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=>WelcomeBeforeScreen())
                );
              },
              child: Text("Skip",
                  style: TextStyle(
                    color: AppColors.UMAH_GREY,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  )),
            ),
          ),
        ),
        Positioned(
          top: height10 * 40,
          left: width10*2,
          child: Container(
              width: width10*34,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Votre",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.UMAH_VIOLET,
                          height: 0.95,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                        )),
                    Text("conservatoire",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 0.95,
                          color: AppColors.UMAH_YELLOW,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                        )),
                    Text("à domicile !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 0.95,
                          color: AppColors.UMAH_VIOLET,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectet ur adipiscing elit, sed do eiusmod tempor incididunt ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    )
                  ]
              )
          ),
        )
      ],
    ));
  }
}

// RichText(
// text: TextSpan(
// text: "Votre\n",
// style: TextStyle(
// color: AppColors.UMAH_VIOLET,
// fontSize: 32,
// fontWeight: FontWeight.w800,
// fontFamily: 'Poppins',
// ),
// children: [
// TextSpan(
// text: "conservatoire\n",
// style: TextStyle(
// color: AppColors.UMAH_YELLOW,
// fontSize: 32,
// fontWeight: FontWeight.w800,
// fontFamily: 'Poppins',
// ),
// ),
// TextSpan(
// text: "à domicile !\n",
// style: TextStyle(
// color: AppColors.UMAH_VIOLET,
// fontSize: 32,
// fontWeight: FontWeight.w800,
// fontFamily: 'Poppins',
// ),
// )
// ]
// ),
// )



