import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';
import 'package:umah_front/core/providers/auth_provider.dart';
import 'package:umah_front/screens/sign_in_screen/sign_in_screen.dart';
import '../../models/http_exception.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/button_widget.dart';
import '../../shared/widgets/date_picker_widget.dart';
import '../../shared/widgets/text_box_widget.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key, required this.isStudent}) : super(key: key);

  bool isStudent;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isLoading=false;

  String path = "assets/images/background/png/background group.png";
  final _formKey = GlobalKey<FormState>();
  var _selectedIndex = 0;
  String day = "Jour";
  List<String> genderArray = ["Homme", "Femme"];
  String month = "Mois";
  String year = "Année";
  String? firstName, lastName, email, password, address, phoneNumber, gender;
  TextEditingController passwordController = TextEditingController();

  void onOpenDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime(1900),
            firstDate: DateTime(0),
            lastDate: DateTime(2022),
            locale: Locale("fr"))
        .then((value) {
      if (value != null) {
        day = value.day.toString();
        month = value.month.toString();
        year = value.year.toString();
        setState(() {});
      }
    });
  }

  Future<void> _submit() async{
    if (!_formKey.currentState!.validate() || day == "Jour") {
      return;
    }
    _formKey.currentState!.save();
    gender = genderArray[_selectedIndex];
    setState(() {
      isLoading=true;
    });
    dynamic credentials={
      "firstname": firstName,
      "email": email,
      "lastname": lastName,
      "phoneNumber": phoneNumber,
      "address": address,
      "gender": gender == "Homme"? "MALE": "FEMALE",
      "profileImage": "hithere",
      "password": password,
      "dateBirth" : "$year-$month-$day"
    };
    try{
     await Provider.of<AuthenticationProvider>(context, listen: false).signUp(credentials, widget.isStudent);
     Navigator.of(context).push(
       MaterialPageRoute(builder: (ctx)=>SignInScreen())
     );
    }on HttpException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message, style: TextStyle(fontFamily: "Poppins", fontSize: 15),))
      );
    }catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Une erreur est survenue veuillez réessayer", style: TextStyle(fontFamily: "Poppins", fontSize: 15),))
      );
    }
    isLoading=false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios , color: Colors.black, size: 20,),
            onPressed: ()=>Navigator.of(context).pop(),
          ),
        ),
      ),
        body: Container(
        height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/illustrations/earth.svg"),
                ],
              ),
              alignment: Alignment.topCenter,
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.7,
              maxChildSize: 1,
              snap: true,
              snapSizes: [0.7,1],
              builder: (BuildContext context, ScrollController scrollController){
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Align(
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    topLeft: Radius.circular(50))),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Créer Votre Compte",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 28,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/illustrations/sign_up_man_illustration.svg"),
                                        SvgPicture.asset(
                                            "assets/images/illustrations/sign_up_woman_illustration.svg")
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.8,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FlutterToggleTab(
                                    width: 80,
                                    height: 30,
                                    borderRadius: 50,
                                    unSelectedBackgroundColors: [ AppColors.TEXT_BOX_COLOUR],
                                    labels: genderArray,
                                    selectedTextStyle: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                    ),
                                    unSelectedTextStyle: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 12,
                                      color:  AppColors.TEXT_BOX_CONTENT_COLOUR,
                                      fontFamily: "Poppins",
                                    ),
                                    selectedBackgroundColors: [ AppColors.UMAH_VIOLET],
                                    selectedIndex: _selectedIndex,
                                    selectedLabelIndex: (index) => {
                                      setState(() => {_selectedIndex = index})
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        TextBoxWidget(
                                          hintText: "Nom",
                                          widthPercent: 0.38,
                                          iconAsset: "assets/images/icons/profile_icon.svg",
                                          iconHeight: 20,
                                          iconWidth: 20,
                                          onSaved: (value) {
                                            lastName = value;
                                          },
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.04,
                                        ),
                                        TextBoxWidget(
                                          hintText: "Prénom",
                                          widthPercent: 0.38,
                                          iconAsset: "assets/images/icons/profile_icon.svg",
                                          iconHeight: 20,
                                          iconWidth: 20,
                                          onSaved: (value) {
                                            firstName = value;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  this.widget.isStudent==false ?
                                    TextBoxWidget(
                                      hintText: "CIN",
                                      widthPercent: 0.8,
                                      iconAsset: "assets/images/icons/cin_icon.svg",
                                      iconHeight: 25,
                                      iconWidth: 25,
                                      onSaved: (value) {

                                      },
                                    ):SizedBox(),
                                  this.widget.isStudent==false ?
                                  SizedBox(
                                    height: 20,
                                  ) : SizedBox(),

                                  TextBoxWidget(
                                    hintText: "E-mail",
                                    widthPercent: 0.8,
                                    iconAsset: "assets/images/icons/mail_icon.svg",
                                    iconHeight: 20,
                                    iconWidth: 20,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Veuillez enter votre mail";
                                      }
                                      if (!EmailValidator.validate(value)) {
                                        return "Veuillez verifier le mail";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      email = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextBoxWidget(
                                    controller: passwordController,
                                    hintText: "Password",
                                    widthPercent: 0.8,
                                    obscureText: true,
                                    iconAsset: "assets/images/icons/lock_icon.svg",
                                    iconHeight: 25,
                                    iconWidth: 25,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Veuillez entrer votre mot de passe";
                                      }
                                      if (value.length < 8) {
                                        return "Votre mot de passe doint contenir au moins 8 caractéres";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      password = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextBoxWidget(
                                    hintText: "Confirmer Votre Mot de Passe",
                                    widthPercent: 0.8,
                                    obscureText: true,
                                    iconAsset: "assets/images/icons/lock_icon.svg",
                                    iconHeight: 25,
                                    iconWidth: 25,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Veuillez re-entrez votre mot de passe";
                                      }
                                      if (value != passwordController.text) {
                                        return "Veuillez verifier votre mot de passe";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextBoxWidget(
                                    hintText: "Adresse",
                                    widthPercent: 0.8,
                                    iconAsset: "assets/images/icons/adress_icon.svg",
                                    iconHeight: 25,
                                    iconWidth: 25,
                                    onSaved: (value) {
                                      address = value;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Veuillez entrez votre adresse";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextBoxWidget(
                                    hintText: "Numéro De Téléphone",
                                    widthPercent: 0.8,
                                    iconAsset: "assets/images/icons/phone_icon.svg",
                                    iconHeight: 25,
                                    iconWidth: 25,
                                    onSaved: (value) {
                                      phoneNumber = value;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Veuillez entrer votre numéro de telephone";
                                      }
                                      if (value.length != 8) {
                                        return "Veuillez un numero valide";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Row(
                                      children: [
                                        DatePickerWidget(
                                            textContent: day, onTap: onOpenDatePicker),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.04,
                                        ),
                                        DatePickerWidget(
                                            textContent: month, onTap: onOpenDatePicker),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.04,
                                        ),
                                        DatePickerWidget(
                                            textContent: year, onTap: onOpenDatePicker),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  isLoading? Center(
                                    child: CircularProgressIndicator(),
                                  ) :
                                  ButtonWidget(
                                    height: 55,
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    color:  AppColors.UMAH_YELLOW,
                                    textContent: "Continuer",
                                    onTap: () {
                                      _submit();
                                    },
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Vous avez dejà un compte?",
                                          style: TextStyle(
                                              color:  AppColors.TEXT_BOX_CONTENT_COLOUR,
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (context)=>SignInScreen())
                                            );
                                          },
                                          child: Text(
                                            "connectez-vous!",
                                            style: TextStyle(
                                                color:  AppColors.UMAH_VIOLET,
                                                fontFamily: "Poppins",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Align(
                        child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,7),
                                    blurRadius: 3,
                                    color: Colors.grey
                                )
                              ]
                          ),
                          child: SvgPicture.asset("assets/images/illustrations/sol_key_signup_sign_in.svg", height: 30, width: 30),
                        ),
                        alignment: Alignment.topCenter,
                      ),
                    ],
                  ),
                );
              }

          )
        ],
      ),
    ));
  }
}
