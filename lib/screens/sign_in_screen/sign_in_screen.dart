import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:umah_front/core/providers/auth_provider.dart';
import 'package:umah_front/screens/student/main_page_client.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/button_widget.dart';
import '../../shared/widgets/text_box_widget.dart';
import '../prof student screen/prof_student_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);


  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  late String email;
  late String password;
  bool isLoading=false;


  _submit() async {
    if (!_formKey.currentState!.validate()){
      return ;
    }
    _formKey.currentState!.save();
    setState(() {
      this.isLoading=true;
    });
    try{
      await Provider.of<AuthenticationProvider>(context, listen: false).login(email, password);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx)=>MainPageClient(isProfessor: false,))
      );

    } on HttpException catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message, style: TextStyle(fontFamily: "Poppins", fontSize: 15),))
      );
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Une erreur est survenue veuillez réessayer", style: TextStyle(fontFamily: "Poppins", fontSize: 15),))
      );
    }
    setState(() {
      this.isLoading=false;
    });
  }



  @override
  Widget build(BuildContext context) {

    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 82;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      extendBody: true,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.UMAH_VIOLET.withOpacity(.9),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColors.UMAH_VIOLET.withOpacity(.4),
                statusBarIconBrightness: Brightness.light),
            automaticallyImplyLeading: false,
            title: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.of(context).pop();
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
              preferredSize: Size.fromHeight(height10 * 11),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top:height10 * 2.8,
                    ),
                    padding: EdgeInsets.only(
                      top: height10 * 5,
                    ),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(height10 * 4),
                          topRight: Radius.circular(height10 * 4),
                        )),
                    child: Text(
                      "Connectez-vous!",
                      style:Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Container(
                    height: height10*5,
                    width: height10*5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height10*1.5),
                      color: AppColors.UMAH_VIOLET,
                    ),
                    child: SvgPicture.asset("assets/images/illustrations/sol_key_illustration.svg", color: Colors.white,height: height10*3),
                  ),
                ],
              ),
            ),
            pinned: true,
            expandedHeight:height10 * 36,
            flexibleSpace:
            FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/background/png/loading_back.png",),fit: BoxFit.cover)
                  ),
                  child:SvgPicture.asset("assets/images/illustrations/earth.svg",width: 30,height: 30,fit: BoxFit.scaleDown,) ,
                )
            ),
          ),
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //email
                  SizedBox(height: height10*4,),
                  TextBoxWidget(
                    hintText: "E-mail",
                    onSaved: (value){
                      email=value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez enter votre mail";
                      }
                      if (!EmailValidator.validate(value)) {
                        return "Veuillez verifier le mail";
                      }
                      return null;
                    },
                    widthPercent: 0.8,
                    iconAsset: "assets/images/icons/mail_icon.svg",
                    iconHeight: 20,
                    iconWidth: 20,
                    // validator: cubit.emailValidator,
                  ),
                  //password
                  SizedBox(height: height10*3,),
                  TextBoxWidget(
                    onSaved: (value){
                      password=value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer votre mot de passe";
                      }
                      if (value.length < 8) {
                        return "Votre mot de passe doint contenir au moins 8 caractéres";
                      }
                      return null;
                    },
                    hintText: "Password",
                    widthPercent: 0.8,
                    obscureText: true,
                    iconAsset: "assets/images/icons/lock_icon.svg",
                    iconHeight: 25,
                    iconWidth: 25,
                    // validator: cubit.passwordValidator,
                  ),
                  SizedBox(height: height10*3,),
                  //stay connected
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_box_outline_blank_rounded,size: 16,color: AppColors.TEXT_BOX_CONTENT_COLOUR,),
                      SizedBox(width: width10,),
                      Text("Rester Connecté!",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.TEXT_BOX_CONTENT_COLOUR,fontWeight: FontWeight.w600),),

                    ],
                  ),
                  SizedBox(height: height10*4,),
                  //login button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Mot de passe oublié ?",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.UMAH_VIOLET,fontWeight: FontWeight.w600),),
                      SizedBox(width: width10*3,),
                      isLoading? Center(
                        child: CircularProgressIndicator(),
                      ) : ButtonWidget(
                        fontColor: Colors.white,
                        height: height10*5.5,
                        width: width10*13.8,
                        color:  AppColors.UMAH_VIOLET,
                        textContent: "S’identifier",
                        onTap: ()async {
                          _submit();
                        },
                      ),
                    ],),
                  SizedBox(height: height10*5,),
                  //forget password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vous n’avez pas de compte?",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.TEXT_BOX_CONTENT_COLOUR,fontWeight: FontWeight.w600),),
                      SizedBox(width: width10*1.5,),
                      InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>ProfStudentScreen())
                            );
                          },
                          child: Text("Rejoignez nous!",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.UMAH_YELLOW,fontWeight: FontWeight.w600),)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
