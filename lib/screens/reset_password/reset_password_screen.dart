import 'package:flutter/material.dart';
import 'package:umah_front/screens/reset_password/widgets/reset_password_fields.dart';

import '../../shared/styles/colors.dart';
import '../../shared/widgets/button_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController actualPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child:
                  Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black)),
          centerTitle: true,
        ),
        backgroundColor: AppColors.UMAH_LIGHT_GREY,
        body: SingleChildScrollView(
          child: Container(
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ResetPasswordFields(
                      label: "Mot de passe actuel :",
                      onValidate: (_) {
                        return null;
                      },
                      onSaved: (_) {},
                      controller: actualPassword,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ResetPasswordFields(
                        label: "Nouveau Mot de passe :",
                        controller: newPassword,
                        onValidate: (_) {
                          return null;
                        },
                        onSaved: (_) {}),
                    SizedBox(
                      height: 8,
                    ),
                    ResetPasswordFields(
                        label: "Confirmer le Mot de passe :",
                        onValidate: (_) {
                          return null;
                        },
                        onSaved: (_) {}),
                    SizedBox(
                      height: 30,
                    ),
                    ButtonWidget(
                      textContent: "Confirmer",
                      height: 40,
                      width: width * 0.5,
                      fontColor: Colors.black,
                      color: AppColors.UMAH_YELLOW,
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
