 
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/colors.dart';



class TextBoxWidget extends StatefulWidget {

  TextBoxWidget({Key? key , this.onSaved , this.validator, this.iconAsset , required this.widthPercent, this.obscureText= false, required this.hintText, this.iconHeight, this.iconWidth , this.controller}) : super(key: key);

  String hintText;
  double widthPercent;
  String? iconAsset;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  double? iconHeight;
  double? iconWidth;
  TextEditingController? controller;
  bool? obscureText;



  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * widget.widthPercent,
      child: TextFormField(
        obscureText: widget.obscureText!,
        controller: widget.controller,
        decoration: InputDecoration(
          errorStyle: TextStyle(fontWeight: FontWeight.w500 , fontSize: 15, fontFamily: "Poppins"),
          fillColor: AppColors.TEXT_BOX_COLOUR,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          prefixIcon:  widget.iconAsset != null ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(widget.iconAsset!, height: widget.iconHeight, width: widget.iconWidth , color:  AppColors.TEXT_BOX_CONTENT_COLOUR,),
          ) : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontFamily: "Urbanist",
              fontWeight: FontWeight.w900,
              fontSize: 15
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50)
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)
          ),
        ),
        style: TextStyle(
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w900,
            fontSize: 15
        ),
        validator: widget.validator,
        onSaved: widget.onSaved,
      ),
    );
  }
}
