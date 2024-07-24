import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umah_front/screens/profileScreen/widgets/text_panel_widget.dart';

import '../../shared/styles/colors.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String bgPath = "assets/images/background/png/profile_back.png";

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 86;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
              size: 18,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/images/icons/edit_icon.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgPath), fit: BoxFit.fill),
      ),
      child: SafeArea(
          child: ListView(children: [
        Column(
          children: [
            // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //   Padding(
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
            //   Padding(
            //     padding: const EdgeInsets.only(right: 25),
            //     child: GestureDetector(
            //       onTap: () {},
            //       child: SvgPicture.asset(
            //         'assets/images/icons/edit_icon.svg',
            //         width: 24,
            //         height: 24,
            //       ),
            //     ),
            //   ),
            // ]),
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
                  "Etudiant",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.UMAH_YELLOW),
                ),
                SizedBox(height: height10 * 3),
                Container(
                  width: width10 * 20,
                  child: Text(
                    "Bio: ur adipiscing elit, sed do eiusmodtempor incididunt",
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
                  child:
                      TextPanel(text: "B.Foulen Foulen", widthPercentage: 0.83),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height10 * 1.5, bottom: height10 * 1.5),
                  child:
                      TextPanel(text: "B.Foulen Foulen", widthPercentage: 0.83),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height10 * 1.5, bottom: height10 * 1.5),
                  child:
                      TextPanel(text: "B.Foulen Foulen", widthPercentage: 0.83),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height10 * 1.5, bottom: height10 * 1.5),
                  child:
                      TextPanel(text: "B.Foulen Foulen", widthPercentage: 0.83),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height10 * 1.5, bottom: height10 * 1.5),
                  child:
                      TextPanel(text: "B.Foulen Foulen", widthPercentage: 0.83),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: height10 * 1.5,bottom: height10 * 1.5),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Besoin d'aide?",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: AppColors.UMAH_VIOLET,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Contactez-Nous!',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: AppColors.UMAH_YELLOW,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ])),
    ));
  }
}
