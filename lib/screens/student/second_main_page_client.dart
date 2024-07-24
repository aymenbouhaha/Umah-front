import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umah_front/shared/styles/colors.dart';
import 'package:umah_front/shared/widgets/course_card.dart';
import 'package:umah_front/shared/widgets/instrument_card.widget.dart';

class SecondMainPageClient extends StatefulWidget {
  const SecondMainPageClient({Key? key}) : super(key: key);

  @override
  State<SecondMainPageClient> createState() => _SecondMainPageClientState();
}

class _SecondMainPageClientState extends State<SecondMainPageClient> {
  List<Map<String, dynamic>> list = [
    {"assets": "assets/images/other/batterie.png", "name": "Batterie"},
    {"assets": "assets/images/other/guitarre.png", "name": "Guitare"},
    // {"assets": "assets/images/other/piano.png", "name": "Piano"},
    // {"assets": "assets/images/other/violon.png", "name": "Violon"},
  ];
  List<Map<String, dynamic>> list2 = [
    {
      "assets": "assets/images/illustrations/default_profile_pic.svg",
      "professor": "Foulen ben Foulen",
      "instrument": "Piano",
      "duration": "3h",
      "price": "120 dt",
      "number": "+21655468895",
      "date": "le 20/5/2023 a 14:30",
      "done": "false",
      "rating": "0",
      "adresse":"Cité olymique, Tunis"
    },
    {
      "assets": "assets/images/illustrations/default_profile_pic.svg",
      "professor": "Foulen ben Foulen",
      "instrument": "Piano",
      "duration": "3h",
      "price": "120 dt",
      "number": "+21655468895",
      "date": "le 25/4/2023 a 14:30",
      "done": "false",
      "rating": "0",
      "adresse":"Cité olymique, Tunis"
    },
  ];
  List<Map<String, dynamic>> listDone = [
    {
      "assets": "assets/images/illustrations/default_profile_pic.svg",
      "professor": "Foulen ben Foulen",
      "instrument": "Guitare",
      "duration": "2h",
      "price": "80 dt",
      "number": "+21655468895",
      "date": "le 15/4/2023 a 14:30",
      "done": "true",
      "rating": "4",
      "adresse":"Cité olymique, Tunis"
    },
    {
      "assets": "assets/images/illustrations/default_profile_pic.svg",
      "professor": "Foulen ben Foulen",
      "instrument": "Guitare",
      "duration": "2h",
      "price": "80 dt",
      "number": "+21655468895",
      "date": "le 10/4/2023 a 14:30",
      "done": "true",
      "rating": "4",
      "adresse":"Cité olymique, Tunis"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Container(
              alignment: Alignment.center,
              height: height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          "assets/images/illustrations/main_page_user_illustration.svg",
                          height: 80,
                          width: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Salut,",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.TEXT_BOX_CONTENT_COLOUR),
                            ),
                            Text(
                              "Foulen Foulen",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset("assets/images/icons/notif_icon.svg"),
                  SvgPicture.asset("assets/images/icons/Vector.svg")
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.8,
              minChildSize: 0.8,
              maxChildSize: 1,
              snap: true,
              snapSizes: [0.8, 1],
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                    width: width,
                    decoration: BoxDecoration(
                        color: AppColors.UMAH_VIOLET,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: SingleChildScrollView(
                        controller: scrollController,
                        physics: ScrollPhysics(),
                        child: Container(
                            width: width,
                            decoration: BoxDecoration(
                                color: AppColors.UMAH_VIOLET,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, bottom: 30),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      width: width * 0.8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Commander un ",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Cours",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.UMAH_YELLOW),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      width: width * 0.8,
                                      child: Text(
                                        "Vos Instruments",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 25),
                                    child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: 40,
                                                mainAxisSpacing: 40),
                                        itemCount: list.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return InstrumentCard(
                                              name: "${list[index]["name"]}",
                                              imagePath:
                                                  "${list[index]["assets"]}");
                                        }),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.add_circle_rounded,
                                          color: AppColors.UMAH_YELLOW,
                                          size: 30,
                                        ),
                                        onPressed: () {},
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      width: width * 0.8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Vos Prochains ",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Cours",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                                color: AppColors.UMAH_YELLOW),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: width * 0.1),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return CourseCard(
                                              isDone: "${list2[index]["done"]}"
                                                      .toLowerCase() ==
                                                  'true',
                                              adresse:
                                                  "${list2[index]["adresse"]}",
                                              date: "${list2[index]["date"]}",
                                              duration:
                                                  "${list2[index]["duration"]}",
                                              instrument:
                                                  "${list2[index]["instrument"]}",
                                              number:
                                                  "${list2[index]["number"]}",
                                              price: "${list2[index]["price"]}",
                                              professor:
                                                  "${list2[index]["professor"]}",
                                              rating:
                                                  "${list2[index]["rating"]}",
                                              imagePath:
                                                  "${list2[index]["assets"]}");
                                        },
                                        itemCount: 2,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      width: width * 0.8,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Votre ",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Historique",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                                color: AppColors.UMAH_YELLOW),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: width * 0.1),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return  CourseCard(
                                              isDone: "${listDone[index]["done"]}"
                                                      .toLowerCase() ==
                                                  'true',
                                              adresse:
                                                  "${listDone[index]["adresse"]}",
                                              date: "${list2[index]["date"]}",
                                              duration:
                                                  "${listDone[index]["duration"]}",
                                              instrument:
                                                  "${listDone[index]["instrument"]}",
                                              number:
                                                  "${listDone[index]["number"]}",
                                              price: "${listDone[index]["price"]}",
                                              professor:
                                                  "${listDone[index]["professor"]}",
                                              rating:
                                                  "${listDone[index]["rating"]}",
                                              imagePath:
                                                  "${listDone[index]["assets"]}");
                                        },
                                        itemCount: 2,
                                      )),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 20, top: 15),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Voir plus",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                            color: AppColors.UMAH_YELLOW),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 8, bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Besoin d’aide? ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: 'Urbanist',
                                              letterSpacing: 1,
                                            )),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(" Contactez-Nous!",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: AppColors.UMAH_YELLOW,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: 'Urbanist',
                                                letterSpacing: 1,
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                ]))));
              })
        ],
      ),
    )));
  }
}
