import 'package:flutter/material.dart';

import '../styles/colors.dart';

class InstrumentCard extends StatelessWidget {

  InstrumentCard({Key? key, required this.name, required this.imagePath}) : super(key: key);

  String imagePath;

  String name;


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: ClipRRect(
          borderRadius:
          BorderRadius.circular(10),
          child: Stack(
            children: [
              Align(
                alignment:
                Alignment.bottomCenter,
                child: Image.asset(
                  this.imagePath,
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,),
              ),
              Align(
                  alignment:
                  Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: double.infinity,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    child: Text(
                      this.name,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w900,
                          color: AppColors
                              .UMAH_YELLOW),
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}
