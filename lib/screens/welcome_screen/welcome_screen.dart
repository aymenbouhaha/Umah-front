import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/button_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 82;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.UMAH_VIOLET.withOpacity(.8)
        ),
        toolbarHeight: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
              height: double.infinity,
              child: SvgPicture.asset(
        "assets/images/background/svg/welcome_after_back.svg",
                fit: BoxFit.cover,
      )),
          Container(
            margin: EdgeInsets.only(bottom: height10*14),
            width: double.infinity,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(

                children: [
                  TextSpan(text: "Bienvenue \n",style: TextStyle(fontSize: 32,decorationThickness: 2,color: Colors.white,fontWeight: FontWeight.w600)),
                  TextSpan(text:"Foulen Ben Foulen",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600,color:AppColors.UMAH_YELLOW)),
                ]
            ),),
          ),
          Container(
            margin: EdgeInsets.only(bottom: height10*11),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child:Text("Vous êtes prêt pour utiliser l’application.",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.TEXT_BOX_CONTENT_COLOUR,fontWeight: FontWeight.w600),),

          ),
          Container(
            margin: EdgeInsets.only(bottom: height10*4),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child:ButtonWidget(width: width10*13.8,height: height10*4.4,filled: false,color:AppColors.UMAH_YELLOW,onTap: (){},textContent: "Continuer",fontColor: AppColors.UMAH_YELLOW,)
          ),
        ],
      ),
    );
  }
}
