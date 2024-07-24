import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umah_front/core/providers/teachers_provider.dart';
import '../shared/styles/colors.dart';

class WaitingProfesssor extends StatefulWidget {
  const WaitingProfesssor({Key? key}) : super(key: key);

  @override
  State<WaitingProfesssor> createState() => _WaitingProfesssorState();
}

class _WaitingProfesssorState extends State<WaitingProfesssor> {

  // @override
  // void didChangeDependencies() {
  //   Provider.of<TeacherProvider>(context).fetchTeacherAndSet();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 68;
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/background/png/prof_waiting_prog.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 30),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SecondLanding()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height10 * 2),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Votre demande pour rejoindre",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.8,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("notre platforme ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.8,
                                    )),
                                Text("Umah ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.UMAH_YELLOW,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 1,
                                    )),
                                Text("en tant que",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.8,
                                    )),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Professeur ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.UMAH_YELLOW,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                        letterSpacing: 1,
                                      )),
                                  Text("a été envoyé ,",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.8,
                                      )),
                                ]),
                            Image.asset(
                                "assets/images/illustrations/png/prof_waiting.png"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    "assets/images/illustrations/png/prof_waiting_elipse.png"),
                                Text("Vous serez contacter",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.8,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ultérieurement pour un ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.8,
                                    )),
                                Text("entretien .",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.UMAH_YELLOW,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 1.1,
                                    )),
                              ],
                            )
                          ]),
                    ),
                    SizedBox(
                     height: height10*8,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Besoin d’aide ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.UMAH_VIOLET,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Urbanist',
                                letterSpacing: 1,
                              )),
                          GestureDetector(
                            onTap: () {
                              // print('Text clicked!');
                            },
                            child: Text(" Contactez-Nous!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 1,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
