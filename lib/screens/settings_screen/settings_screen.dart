import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umah_front/screens/settings_screen/widgets/divider.dart';
import 'package:umah_front/screens/settings_screen/widgets/notification_toggler.dart';
import 'package:umah_front/screens/settings_screen/widgets/settings_item.dart';
import 'package:umah_front/shared/widgets/button_widget.dart';

import '../../shared/styles/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.UMAH_VIOLET,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: (){
              },
              child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,)
          ),
          title: Container(
            alignment: Alignment.center,
            width: width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Paramètres", style: TextStyle(color: Colors.white, fontFamily: "Poppins" ,fontWeight: FontWeight.w900, fontSize: 25),),
                SvgPicture.asset("assets/images/icons/settings.svg")
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height*0.85,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // height: height*0.83,
                      width: width,
                      decoration: BoxDecoration(
                        color: AppColors.UMAH_LIGHT_GREY,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50))
                      ),
                      child: Container(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              SizedBox(
                                height: height*0.1,
                              ),
                            CustomDivider(width: width, text: "Général"),
                            SizedBox(
                              height: width*0.04 ,
                            ),
                            SettingsItem(hint: "Editer Profile",width: width,iconPath: "assets/images/icons/user.svg",),
                            SettingsItem(hint: "Changer le mot de passe",width: width,iconPath: "assets/images/icons/lock.svg",),
                            NotificationToggler(hint: "Acitver les notifications",width: width,iconPath: "assets/images/icons/notif.svg",),
                            CustomDivider(width: width, text: "Contact"),
                            SizedBox(
                              height: width*0.04 ,
                            ),
                            SettingsItem(width: width, iconPath: "assets/images/icons/facebook.svg", hint: "Facebook"),
                            SettingsItem(width: width, iconPath: "assets/images/icons/alert.svg", hint: "Reporter un bug"),
                            SettingsItem(width: width, iconPath: "assets/images/icons/contact.svg", hint: "Nos contacts"),
                            SettingsItem(width: width, iconPath: "assets/images/icons/info.svg", hint: "À propos"),
                            SizedBox(
                              height: 20,
                            ),
                            ButtonWidget(onTap: (){}, width: width*0.5, height: 40, textContent: "Déconnexion", color: AppColors.UMAH_YELLOW)

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 45,
                    child: SvgPicture.asset("assets/images/illustrations/profile_placeholder_illustration.svg"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
