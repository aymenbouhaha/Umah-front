import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class ResetPasswordFields extends StatefulWidget {
  ResetPasswordFields({Key? key ,this.controller, required String this.label , required this.onValidate, required this.onSaved }) : super(key: key);


  String label ;
  void Function(String? value) onSaved;
  String? Function(String? value) onValidate;
  TextEditingController? controller;


  @override
  State<ResetPasswordFields> createState() => _ResetPasswordFieldsState();
}

class _ResetPasswordFieldsState extends State<ResetPasswordFields> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextStyle(color: Colors.black,letterSpacing: 0.5,fontSize: 16 ,fontWeight: FontWeight.w600, fontFamily: "Poppins"),),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: TextFormField(
            controller: widget.controller,
            onSaved: widget.onSaved,
            validator: widget.onValidate,
            obscureText: true,
            decoration: InputDecoration(
              isDense : true,
              errorStyle: TextStyle(fontSize: 15),
              contentPadding: EdgeInsets.symmetric(vertical:10,horizontal: 20),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: AppColors.UMAH_GREY
                  ),
                  borderRadius: BorderRadius.circular(9)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: AppColors.UMAH_GREY
                  ),
                  borderRadius: BorderRadius.circular(15)
              ),
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: AppColors.UMAH_GREY
                  ),
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
          ),
        ),
      ],
    )
    ;
  }
}
