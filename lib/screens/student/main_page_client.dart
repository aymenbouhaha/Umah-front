import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:umah_front/core/providers/instrument_provider.dart';
import 'package:umah_front/core/providers/teachers_provider.dart';
import 'package:umah_front/shared/styles/colors.dart';
import 'package:umah_front/shared/widgets/instrument_card.widget.dart';
import 'package:umah_front/shared/widgets/professor_profile_card.widget.dart';

import '../../shared/widgets/button_widget.dart';

class MainPageClient extends StatefulWidget {
  MainPageClient({Key? key, required this.isProfessor}) : super(key: key);

  bool isProfessor;

  @override
  State<MainPageClient> createState() => _MainPageClientState();
}

class _MainPageClientState extends State<MainPageClient> {
  // List<Map<String, dynamic>> list = [
  //   {"assets": "assets/images/other/batterie.png", "name": "Batterie"},
  //   {"assets": "assets/images/other/guitarre.png", "name": "Guitare"},
  //   {"assets": "assets/images/other/piano.png", "name": "Piano"},
  //   {"assets": "assets/images/other/violon.png", "name": "Violon"},
  // ];

  bool instrumentLoading=false;

  bool teacherLoading=false;

  @override
  void didChangeDependencies() {
    setState(() {
      instrumentLoading=true;
      teacherLoading=true;
    });
    Provider.of<InstrumentProvider>(context,listen: false).fetchInstruments()
    .then((_){
    }).catchError((_){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Une erreur est survenue lors du chargement des instruments", style: TextStyle(fontFamily: "Poppins", fontSize: 15),))
      );

    }).whenComplete(() =>setState((){instrumentLoading=false;}));
    Provider.of<TeacherProvider>(context,listen: false).fetchProfessors()
        .then((_){
    }).catchError((_){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Une erreur est survenue lors du chargement des instruments", style: TextStyle(fontFamily: "Poppins", fontSize: 15),))
      );

    }).whenComplete(() => setState((){teacherLoading=false;}));

    super.didChangeDependencies();
  }


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
                      SvgPicture.asset("assets/images/icons/notif_icon.svg")
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
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      width: width,
                      decoration: BoxDecoration(
                          color: AppColors.UMAH_VIOLET,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        physics: ScrollPhysics(),
                        child: Container(
                          width: width,
                          decoration: BoxDecoration(
                              color: AppColors.UMAH_VIOLET,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 10),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: width * 0.8,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Choisissez votre",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Instrument",
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
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  width: width * 0.8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Nos catégories",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white),
                                      ),
                                      InkWell(
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
                                    ],
                                  ),
                                ),
                              ),
                              instrumentLoading ? Center(child: CircularProgressIndicator(),):
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                child: Consumer<InstrumentProvider>(
                                  builder:(context,instrument,_){
                                    return GridView.builder(
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 1,
                                            crossAxisSpacing: 40,
                                            mainAxisSpacing: 40),
                                        itemCount: instrument.instruments.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return InstrumentCard(
                                              name: "${instrument.instruments[index].name}",
                                              imagePath: "assets/images/other/batterie.png");
                                        });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  width: width * 0.8,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Vous pouvez toujours modifier votre choix",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                                if(!widget.isProfessor)...[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                                  teacherLoading ? Center(child: CircularProgressIndicator(),):
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: width * 0.1),
                                    child: Consumer<TeacherProvider>(
                                      builder: (context, teacher , _){
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return ProfessorProfileCard(
                                                name: "${teacher.professors[index].firstname} ${teacher.professors[index].lastname}",
                                                studentsNumber: "${(index+1)*2} eleves enseignés",
                                                profileImagePath: "assets/images/illustrations/profile_placeholder_illustration.svg",
                                                address: "${teacher.professors[index].address}",
                                                instrument: "${index%3 ==0 ? "Accoredeon-Tabl" : index%2  ==0? "Guitarre" : "Flute"}"
                                            );
                                          },
                                          itemCount: teacher.professors.length,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20),
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
                                  )
                                ]else...[
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                          onTap: () {
                                          },
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
                                ]
                              ]

                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

