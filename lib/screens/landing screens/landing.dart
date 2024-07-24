import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umah_front/screens/landing%20screens/first_landing_screen.dart';
import 'package:umah_front/screens/landing%20screens/second_landing_screen.dart';
import 'package:umah_front/screens/landing%20screens/third_landing_screen.dart';
import 'package:umah_front/screens/welcome_before_screen.dart';
import '../../shared/styles/colors.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {


    resetNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      print('LandingScreen:');
      print(prefs.getBool('newLaunch'));
    if (prefs.containsKey("newLaunch")) {
      prefs.setBool('newLaunch', false);
    } else {
      prefs.setBool('newLaunch', false);      
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // resetNewLaunch();
  //   Timer(
  //       Duration(seconds: 9),
  //       () => Navigator.pushReplacement(context,
  //               MaterialPageRoute(builder: (context) {
  //             resetNewLaunch();
  //             return SignUpScreen();
  //           })));
  // }
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    FirstLandingScreen(),
    SecondLandingScreen(),
    ThirdLandingScreen()
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 68;
    return Scaffold(
      body: Stack(
        children: <Widget>[

          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Padding(
            padding: EdgeInsets.only(
                top: height10*5, left: width10*3
            ),
            child: InkWell(
              onTap: () {
                _controller.previousPage(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeInOutQuint);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                child: (_currentPage == 0)
                    ? SizedBox()
                    : Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List<Widget>.generate(_pages.length, (int index) {
                          return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 10,
                              width: (index == _currentPage) ? 30 : 10,
                              margin: EdgeInsets.symmetric(
                                  horizontal: width10/2, vertical: height10*3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == _currentPage)
                                      ? AppColors.UMAH_PURPLE
                                      : AppColors.UMAH_YELLOW));
                        })),
                    InkWell(
                      onTap: () {
                        if(_currentPage == (_pages.length - 1)){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context)=>WelcomeBeforeScreen())
                          );
                        }
                        else{
                          _controller.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeInOutQuint);
                        }
                      },
                      child: AnimatedContainer(
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 300),
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                              color: AppColors.UMAH_VIOLET,
                              borderRadius: BorderRadius.circular(35)),
                          child: (_currentPage == (_pages.length - 1))
                              ? Text(
                                  "S'identifier",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                )
                              : Text(
                                  "Suivant",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                )),
                    ),
                  ],
                ),
                SizedBox(
                  height: height10*3,
                )
              ])
        ],
      ),
    );
  }
}
