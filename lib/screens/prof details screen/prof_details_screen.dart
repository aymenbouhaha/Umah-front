import 'dart:ui';

import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../shared/widgets/button_widget.dart';
import '../profileScreen/widgets/text_panel_widget.dart';

class ProfDetails extends StatefulWidget {
  const ProfDetails({Key? key}) : super(key: key);

  @override
  State<ProfDetails> createState() => _ProfDetailsState();
}

class _ProfDetailsState extends State<ProfDetails> {
  String bgPath = "assets/images/background/png/profile_back.png";
  double value = 4.5;
  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 86;
    return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   leading: Padding(
        //     padding: const EdgeInsets.only(left: 15),
        //     child: IconButton(
        //       icon: Icon(
        //         Icons.arrow_back_ios_sharp,
        //         color: Colors.white,
        //         size: 18,
        //       ),
        //       onPressed: () => Navigator.pop(context),
        //     ),
        //   ),
        // ),
        body:
         Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(bgPath), fit: BoxFit.fill),
          ),
          child: SafeArea(
              child: 
              Stack(children: [
                Positioned(
                  top:height10*3,
                  left:width10*1.5,
                  child:
                IconButton(
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
                size: 18,
              ), 
              onPressed: () => Navigator.pop(context),
          
                 ),),
              ListView(children: [
                Container(height: height10*3),
            Column(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                          "assets/images/illustrations/default_profile_pic.png"),
                    ),
                    Text(
                      "Foulen Foulen",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.UMAH_VIOLET),
                    ),
                    Text(
                      "Professeur de musique",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.UMAH_YELLOW),
                    ),
                    RatingBar.builder(
                      initialRating: value,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15.0,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AppColors.UMAH_VIOLET,
                      ),
                      onRatingUpdate: (rating) {},
                      ignoreGestures: true,
                    ),
                    SizedBox(height: height10 * 2.37),
                    Container(
                      width: width10 * 20,
                      child: Text(
                        "Bio: ur adipiscing elit.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height10 * 1.5, bottom: height10 * 1.5),
                      child: TextPanel(
                          text: "Foulen B.Foulen@gmail.com",
                          widthPercentage: 0.83),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height10 * 1.5, bottom: height10 * 1.5),
                      child: TextPanel(
                          text: "+216 99 999 999", widthPercentage: 0.83),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height10 * 1.5, bottom: height10 * 1.5),
                      child: TextPanel(text: "Adresse", widthPercentage: 0.83),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height10 * 1.5, bottom: height10 * 1.5),
                      child: TextPanel(
                          text: "Guitare/Violon", widthPercentage: 0.83),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height10 * 1.5, bottom: height10 * 1.5),
                      child: TextPanel(
                          text: "55 Elèves enseignés", widthPercentage: 0.83),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height10 * 1.5, bottom: height10 * 1.5),
                      child:
                          TextPanel(text: "40Dt/séance", widthPercentage: 0.83),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height10 * 3, bottom: height10 * 3),
                      child: ButtonWidget(
                        width: width10 * 20.4,
                        height: height10 * 4.4,
                        filled: false,
                        color: AppColors.UMAH_YELLOW,
                        onTap: () => showPopup(context),
                        textContent: "Commandez un cours",
                        fontColor: AppColors.UMAH_YELLOW,
                      ),
                    )
                  ],
                )
              ],
            )
          ]),
        ],))));
  }
}


showPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Stack(
            children: <Widget>[
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
              ),
              Material(color: Colors.transparent,
                child:
              Center(
                child: IntrinsicHeight(
                  child: Container(
                    width: MediaQuery.of(context).size.width* 0.83,
                    // height:  MediaQuery.of(context).size.height* 0.4,
                    padding: EdgeInsets.only(top:18,left: 24,right: 24, bottom: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         SizedBox(height: MediaQuery.of(context).size.height / 86 *2),
                        // The popup title
                        Text(
                          'Confirmez la\nCommande',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22.0,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 86 *2),
                        // The popup text
                        Text(
                          "Professeur : Foulen Fouleni\nInstrument : Guitare\nDurée : 2 Heures\nPrix : 40dt.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            fontFamily: "Poppins",
                            color: Color(0xFF5F5F5F)
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 86 *2),
                        ButtonWidget(width:MediaQuery.of(context).size.width / 41 *15.3,height:MediaQuery.of(context).size.height / 86 *4.1,filled: false,color: AppColors.UMAH_PURPLE,onTap: (){},textContent: "Confirmer",fontColor: AppColors.UMAH_PURPLE,)
                        ],
                    ),
                  ),
                ),
              ),
          )],
          ));
    },
  );
}
