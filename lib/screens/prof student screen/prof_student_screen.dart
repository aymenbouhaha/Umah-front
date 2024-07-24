import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umah_front/screens/prof%20student%20screen/widgets/prof_card.dart';
import 'package:umah_front/screens/prof%20student%20screen/widgets/student_card.dart';
import 'package:umah_front/screens/sign_up_screen/sign_up_screen.dart';

import '../../shared/styles/colors.dart';
import '../../shared/widgets/button_widget.dart';

class ProfStudentScreen extends StatefulWidget {
  const ProfStudentScreen({Key? key}) : super(key: key);

  @override
  State<ProfStudentScreen> createState() => _ProfStudentScreenState();
}

class _ProfStudentScreenState extends State<ProfStudentScreen> {
  String bgPath = "assets/images/background/png/prof_student_back.png";
  bool? studentSelected;
  bool? teacherSelected;
  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 68;
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF858585),
                size: 24,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(bgPath), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(children: [
                Container(
                    child: SvgPicture.asset(
                  'assets/images/illustrations/sol_key_illustration_bordered.svg',
                  width: width10 * 5,
                )),
                SizedBox(height: height10 ),
                Container(
                  width: width10*33,
                  child: Text(
                    "Inscrivez-vous !",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        color: AppColors.UMAH_YELLOW),
                  ),
                ),
                Container(
                  width: width10 * 36,
                  child: Text(
                    "Vous pouvez nous rejoindre en tant qu’un Etudiant ou un Professeur de musique.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF727070)),
                  ),
                ),
                SizedBox(height: height10 * 0.2),
                InkWell(
                  onTap: (){
                    studentSelected=true;
                    teacherSelected=false;
                    setState(() {

                    });
                  },
                  child: StudentCardWidget(
                      widthPercentage: 0.836,
                      heightPercentage: 0.23,
                      isSelected: studentSelected ?? false),
                ),
                SizedBox(height: height10 ),
                InkWell(
                  onTap: (){
                    studentSelected=false;
                    teacherSelected=true;
                    setState(() {

                    });
                  },
                  child: ProfCardWidget(
                      widthPercentage: 0.836,
                      heightPercentage: 0.23,
                      isSelected: teacherSelected ?? false),
                ),
                SizedBox(height: height10 * 1.5),
                ButtonWidget(
                  height: 40,
                  width: width10*20,
                  color: AppColors.UMAH_YELLOW,
                  fontColor: Colors.black,
                  textContent: "Continuer",
                  onTap: () {
                    if (studentSelected==null && teacherSelected==null){

                    }
                    else {
                      print(studentSelected);
                      Navigator.of(context).push(MaterialPageRoute(builder: (c)=> SignUpScreen(isStudent: studentSelected!)));
                    }
                  },
                ),
                Padding(
                  padding:  EdgeInsets.only(top: height10 ,bottom: height10 * 1.5),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Vous avez déjà un compte?",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Color.fromARGB(255, 150, 150, 150),
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Connectez-vous!',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: AppColors.UMAH_VIOLET,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )
        )
    );
  }
}
