import 'package:flutter/material.dart';
import 'package:umah_front/screens/prof%20student%20screen/prof_student_screen.dart';
import 'package:umah_front/screens/sign_in_screen/sign_in_screen.dart';
import '../shared/styles/colors.dart';
import '../shared/widgets/button_widget.dart';

class WelcomeBeforeScreen extends StatefulWidget {
  const WelcomeBeforeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeBeforeScreen> createState() => _WelcomeBeforeScreenState();
}

class _WelcomeBeforeScreenState extends State<WelcomeBeforeScreen> {
  String bgPath = "assets/images/background/png/welcome_before_back.png";
  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width/41;
    double height10 = MediaQuery.of(context).size.height/86;
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgPath), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(left: width10*3),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.17,
                      ),
                      Text(
                        "Nouveau?",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: AppColors.UMAH_YELLOW),
                      ),
                      Text(
                        "Commencer Par Vous inscrire",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF727070)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.43,
                      ),
                    ]),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonWidget(
                height: 44,
                width: MediaQuery.of(context).size.width * 0.5,
                color: AppColors.UMAH_YELLOW,
                fontColor: Colors.black,
                textContent: "S'inscrire",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>ProfStudentScreen())
                  );
                },
              ),
              SizedBox(
                height: 16,
              ),
              ButtonWidget(
                height: 44,
                width: MediaQuery.of(context).size.width * 0.5,
                color: AppColors.UMAH_VIOLET,
                fontColor: Colors.white,
                textContent: "Se Connecter",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>SignInScreen())
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
