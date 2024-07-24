import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:umah_front/core/providers/auth_provider.dart';
import 'package:umah_front/core/providers/instrument_provider.dart';
import 'package:umah_front/core/providers/teachers_provider.dart';
import 'package:umah_front/screens/instrument-screen/instrument_screen.dart';
import 'package:umah_front/screens/landing%20screens/landing.dart';
import 'package:umah_front/screens/professor_waiting.dart';
import 'package:umah_front/screens/prof%20details%20screen/prof_details_screen.dart';
import 'package:umah_front/screens/notification_screen/notification_screen.dart';
import 'package:umah_front/screens/profileScreen/profile_screen.dart';
import 'package:umah_front/screens/sign_in_screen/sign_in_screen.dart';
import 'package:umah_front/screens/sign_up_screen/sign_up_screen.dart';
import 'package:umah_front/screens/student/main_page_client.dart';
import 'package:umah_front/shared/network/local/cache_helper.dart';
import 'package:umah_front/shared/network/remote/dio_helper.dart';
import 'package:umah_front/screens/student/second_main_page_client.dart';
import 'package:umah_front/screens/welcome_before_screen.dart';
import 'package:umah_front/shared/styles/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DioHelper.init();
    CacheHelper.init();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthenticationProvider()),
        ChangeNotifierProxyProvider<AuthenticationProvider,TeacherProvider>
          (
          create: (_)=>TeacherProvider(authToken: ""),
            update: (_,auth,teachers)=> TeacherProvider(authToken: auth.token)
        ),
        ChangeNotifierProvider.value(value: InstrumentProvider()),
      ],
      child: Consumer<AuthenticationProvider>(
        builder:(ctx, auth, _) => MaterialApp(
          theme: Themes.lightTheme,
          title: 'Umah',
          home: auth.isAuthenticated?
          MainPageClient(isProfessor: false)
              : FutureBuilder(
              future: auth.autoLogin(),
              builder: (context , AsyncSnapshot<bool> snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasError || snapshot.data == false){
                  return SignInScreen();
                }else{
                  return MainPageClient(isProfessor: false);
                }
              }
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate
          ],
          supportedLocales: [
            const Locale("fr"),
            const Locale("en")
          ],
        ),
      ),
    );
  }
}
class LoadPage extends StatefulWidget {
  LoadPage({ Key? key}) : super(key: key);

  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State {
  var newLaunch;

  @override
  void initState() {
    super.initState();
    loadNewLaunch();
  }

  loadNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bool _newLaunch = ((prefs.getBool('newLaunch') ?? true));
      print("newLaunch:");
      print(_newLaunch);
      newLaunch = _newLaunch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: newLaunch ? Landing() : SignInScreen());
  }
}





