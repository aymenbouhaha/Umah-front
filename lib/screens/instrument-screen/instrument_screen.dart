import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umah_front/screens/instrument-screen/widgets/widget.dart';
import '../../shared/styles/colors.dart';

class InstrumentScreen extends StatefulWidget {

   InstrumentScreen({Key? key}) : super(key: key);

  @override
  State<InstrumentScreen> createState() => _InstrumentScreenState();
}

class _InstrumentScreenState extends State<InstrumentScreen> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 82;
    // Initialize the background color of the SliverAppBar
    Color backgroundColor =Colors.transparent;
    // Add listener to _controller
    _controller.addListener(() {
      // Update the background color of the SliverAppBar based on the scroll position
      if (_controller.offset > 257) {
        if(backgroundColor!=Colors.white)
        setState(() {
          backgroundColor = Colors.white;

        });
      } else {
        if(backgroundColor!=Colors.transparent)
          setState(() {
          backgroundColor = Colors.transparent;
        });
      }
      // print(backgroundColor.toString());
    });


    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: CustomScrollView(
        controller:_controller ,
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark),
            automaticallyImplyLeading: false,
            title: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  // Navigator.of(context).pop();
                  print(backgroundColor.toString());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.black,
                  ),
                )),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(height10 * 10),
              child: Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.only(
                  top: 3,
                ),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(height10 * 5),
                      topRight: Radius.circular(height10 * 5),
                    )),
                child: Container(
                  margin: EdgeInsets.zero,
                  padding:
                      EdgeInsets.only(top: height10 * 2, left: width10 * 3),
                  decoration: BoxDecoration(
                      color: AppColors.UMAH_VIOLET,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(height10 * 5),
                        topRight: Radius.circular(height10 * 5),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choisissez votre",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                      ),
                      Text(
                        "Professeur",
                        style:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: AppColors.UMAH_YELLOW,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: height10 * 36,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              "assets/images/background/png/instrumentBackground.png"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        height: height10 * 14,
                        width: height10 * 16,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/other/guitare.png",
                              ),
                            )),
                      ),
                      SizedBox(
                        height: height10 * .5,
                      ),
                      Text("Guitare",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white, fontSize: 22)),
                      SizedBox(height: height10*4,)
                    ],
                  ),
                )),
          ),
          SliverToBoxAdapter(

            child: Container(
              color: AppColors.UMAH_VIOLET,
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width10*3),
                        child: ProfessorProfileCard(name: 'Foulen Ben Foulen ',address:'Adresse de foulen ben foulen' ,instrument:'Instrument' ,profileImagePath:'assets/images/illustrations/profile_placeholder_illustration.svg' ,studentsNumber:"200 élèves enseignés" ,),
                      );
                    },
                    itemCount: 5,
                  ),
                  SizedBox(height: height10*2,),
                  InkWell(
                      onTap: (){
                      },
                      child: Text("Chargez plus",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.UMAH_YELLOW),)
                  ),
                  SizedBox(height: height10*4,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
