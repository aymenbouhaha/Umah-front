

import 'package:flutter/material.dart';
import 'package:umah_front/shared/widgets/button_widget.dart';

import '../../shared/styles/colors.dart';

class ReportBugScreen extends StatelessWidget {
  ReportBugScreen({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.UMAH_LIGHT_GREY,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20,left: 35,right: 35),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quel est le problème ?",
                        style: TextStyle(
                          fontSize: 17 , fontFamily: "Poppins" , fontWeight: FontWeight.w500
                        )
                        ),
                      Padding(
                        padding:  EdgeInsets.only(top: 10),
                        child: TextField(
                          style: TextStyle(fontSize: 20 , fontFamily: "Poppins"),
                          maxLines: 14,
                          minLines: 8,
                          controller: controller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.1,
                                    color: Colors.white10
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.1,
                                color: Colors.white10
                              )
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ButtonWidget(onTap: (){}, width: width*0.5, height: 40 , textContent: "Envoyer", color: AppColors.UMAH_YELLOW)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
