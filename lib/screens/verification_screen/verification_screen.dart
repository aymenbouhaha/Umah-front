import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../shared/styles/colors.dart';
import '../../shared/widgets/button_widget.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 82;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          borderRadius: BorderRadius.circular(50),
            onTap: (){
            },
            child: Icon(Icons.arrow_back_ios_new_outlined,)),
        backgroundColor: Colors.transparent,
        systemOverlayStyle:SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        )
      ),
      extendBodyBehindAppBar: true,
      body:Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              child: SvgPicture.asset(
                "assets/images/background/svg/code_verif_back.svg",
                fit: BoxFit.cover,
              )),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: height10*12,width: double.infinity,),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(

                      children: [
                        TextSpan(text: "Code ",style: TextStyle(fontSize: 32,decorationThickness: 2,color: AppColors.UMAH_YELLOW,fontWeight: FontWeight.w600)),
                        TextSpan(text:"De Vérification",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600,color:AppColors.UMAH_VIOLET)),
                      ]
                  ),),
                SizedBox(height: height10*2.5),
                Container(
                    width: width10*30.6,
                    child: Text("Un SMS a été envoyé a +216 12 345 678 Veuillez retaper le code!",textAlign: TextAlign.center,style: TextStyle(fontSize: 14),)),
                SizedBox(height: height10*6),
                Container(
                   padding: EdgeInsets.symmetric(horizontal:width10*4),
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    hintCharacter: "-",
                    textStyle: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    onChanged: (value){},
                    appContext: context,
                    length: 4,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        selectedFillColor: AppColors.UMAH_YELLOW,
                        inactiveFillColor: AppColors.UMAH_LIGHT_GREY,
                        inactiveColor: AppColors.UMAH_LIGHT_GREY,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: height10*5.5,
                        fieldWidth:  width10*6.5,
                        activeFillColor: AppColors.UMAH_YELLOW,
                        activeColor: AppColors.UMAH_YELLOW,
                        selectedColor: AppColors.UMAH_YELLOW
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                  ),
                ),
                SizedBox(height: height10*4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Vous n’avez pas reçu le code ?",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.TEXT_BOX_CONTENT_COLOUR,fontWeight: FontWeight.w600),),
                    SizedBox(width: width10*1.5,),
                    InkWell(child: Text("Cliquez ici!",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.UMAH_VIOLET,fontWeight: FontWeight.w600),)),

                  ],),
                SizedBox(height: height10*3,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width10*3),
                  child: ButtonWidget(
                    fontColor: Colors.white,
                    height: height10*5.5,
                    width: double.infinity,
                    color:  AppColors.UMAH_VIOLET,
                    textContent: "Confirmer",
                    onTap: () {
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}
