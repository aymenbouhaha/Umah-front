import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umah_front/shared/styles/colors.dart';

import '../../shared/widgets/button_widget.dart';
import '../../shared/widgets/professor_profile_card.widget.dart';

class SeeOthersProfessor extends StatefulWidget {
  const SeeOthersProfessor({Key? key}) : super(key: key);

  @override
  State<SeeOthersProfessor> createState() => _SeeOthersProfessorState();
}

class _SeeOthersProfessorState extends State<SeeOthersProfessor> {

  final charged=false;
  int items=4;


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(15),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios , color: Colors.white ,size: 20,),
            onPressed: (){},
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.UMAH_VIOLET,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Stack(
                children: [
                  Align(
                    child: SvgPicture.asset("assets/images/other/see_others_page_illustration.svg", width: width*0.8,),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ButtonWidget(
                      onTap: () {},
                      width: width * 0.5,
                      height: 50,
                      fontColor: AppColors.UMAH_YELLOW,
                      filled: false,
                      color: AppColors.UMAH_YELLOW,
                      textContent: "Nos Professeurs",
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40),
              itemBuilder: (context, index) {
                return ProfessorProfileCard(
                    name: "Foulen Ben Foulen",
                    studentsNumber: "200 eleves enseignés",
                    profileImagePath: "assets/images/illustrations/profile_placeholder_illustration.svg",
                    address: "Adresse de foulen ben foulen",
                    instrument: "Instrument"
                );
              },
              itemCount: items,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: (){
                  setState(() {
                      items=8;
                  });
                },
                child: Text(
                  "Chargez plus",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.UMAH_YELLOW,fontWeight: FontWeight.w800),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

