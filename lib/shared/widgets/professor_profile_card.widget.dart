import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfessorProfileCard extends StatelessWidget {
  ProfessorProfileCard(
      {Key? key,
      required this.name,
      required this.studentsNumber,
      required this.profileImagePath,
      required this.address,
      required this.instrument})
      : super(key: key);

  String profileImagePath;
  String name;
  String instrument;
  String address;
  String studentsNumber;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent),
        width: width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                child: SvgPicture.asset(
                    this.profileImagePath),
                radius: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.name,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    this.instrument,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    this.address,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    this.studentsNumber,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
