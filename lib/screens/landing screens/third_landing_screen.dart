import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/styles/colors.dart';

class ThirdLandingScreen extends StatelessWidget {
  const ThirdLandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 68;
    return Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: height10*60,
                child: SvgPicture.asset(
                  "assets/images/background/svg/landing3_back.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
                top: height10*8,
                child:Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Column(
                      children: [
                        Text("Gagnez du",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.UMAH_VIOLET,
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins',
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("temps",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 0.95,
                                    color: AppColors.UMAH_YELLOW,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Poppins',
                                  )),
                              Text(" avec nos",
                                  style: TextStyle(
                                    height: 0.95,
                                    color: AppColors.UMAH_VIOLET,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Poppins',
                                  ))
                            ]),
                        Text("services !",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 0.95,
                              color: AppColors.UMAH_VIOLET,
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins',
                            )),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectet ur adipiscing elit, sed do eiusmod tempor incididunt",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ]),
                )
            )
          ],
          
        )
    );
  }
}

