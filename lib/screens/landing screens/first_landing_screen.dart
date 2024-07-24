import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/styles/colors.dart';
import '../welcome_before_screen.dart';


class FirstLandingScreen extends StatelessWidget {
  const FirstLandingScreen({Key? key}) : super(key: key);

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
              "assets/images/background/svg/landing1_back.svg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: height10*5,right: width10*3),
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
          top: height10*10,
            left: width10,
            child:Container(
                width: 320,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Bienvenue à",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.UMAH_VIOLET,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins',
                          )),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text("umah ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 0.8,
                              color: AppColors.UMAH_YELLOW,
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins',
                            )),
                        Text("! ",
                            style: TextStyle(
                              height: 0.8,
                              color: AppColors.UMAH_VIOLET,
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins',
                            ))
                      ]),
                      Text(
                        "Lorem ipsum dolor sit amet, consectet ur adipiscing elit, sed do eiusmod tempor incididunt ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ])),

        )


      ],
    ));
  }
}
