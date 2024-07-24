import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umah_front/shared/styles/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CourseCard extends StatefulWidget {
  CourseCard(
      {Key? key,
      required this.isDone,
      required this.adresse,
      required this.date,
      required this.duration,
      required this.instrument,
      required this.number,
      required this.price,
      required this.professor,
      required this.rating,
      required this.imagePath})
      : super(key: key);
  bool isDone;
  String professor;
  String price;
  String duration;
  String date;
  String number;
  String adresse;
  String rating;
  String instrument;
  String imagePath;
  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var style = TextStyle(
        fontFamily: "Poppins",
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: AppColors.UMAH_VIOLET);
    return Padding(
        padding: EdgeInsets.only(top: height * 0.05),
        child: Container(
          width: width * 0.8,
          height: widget.isDone ? height * 0.3 : height * 0.26,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              )),
          child: Padding(
              padding:
                  EdgeInsets.only(left: width * 0.07, bottom: height * 0.02),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 11, bottom: 6),
                        child: Text(
                           widget.professor,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.UMAH_VIOLET),
                          textAlign: TextAlign.start,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              // BoxShadow(
                              //   color: Colors.grey.withOpacity(0.6),
                              //   spreadRadius: 0,
                              //   blurRadius: 1,
                              //   offset: Offset(0, 0), // changes position of shadow
                              // ),
                              BoxShadow(
                                  color: Colors.grey.withOpacity(.4),
                                  offset: Offset(2, 2),
                                  blurRadius: 1),
                              BoxShadow(
                                  color: Colors.grey.withOpacity(.4),
                                  offset: Offset(-2, 2),
                                  blurRadius: 1)
                            ],
                          ),
                          child: SvgPicture.asset(
                            widget.imagePath,
                            width: 90,
                            height: 90,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: width * 0.055),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.adresse,
                                  style: style,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                 widget.instrument,
                                  style: style,
                                ),
                                Text(
                                  widget.instrument,
                                  style: style,
                                ),
                                Text(
                                 widget.price,
                                  style: style,
                                ),
                                Text(
                                 widget.number,
                                  style: style,
                                ),
                              ],
                            ))
                      ],
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: EdgeInsets.only(
                                // bottom: 10,
                                top: height * 0.015,
                                right: width * 0.07),
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.55,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3, color: AppColors.UMAH_VIOLET),
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Text(
                                widget.date,
                                style: TextStyle(
                                    color: AppColors.UMAH_VIOLET,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "Poppins",
                                    fontSize: 12),
                              ),
                            ))),
                    widget.isDone
                        ? Padding(
                            padding: EdgeInsets.only(
                                right: width * 0.055, top: height * 0.02),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Donnez votre avis sur le cours:",
                                  style: TextStyle(
                                      color: AppColors.UMAH_VIOLET,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      fontSize: 10),
                                ),
                                RatingBar.builder(
                                  initialRating:double.parse(widget.rating),
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: AppColors.UMAH_VIOLET,
                                  ),
                                  onRatingUpdate: (rating) {
                                    setState(() {
                                      _rating = rating;
                                    });
                                  },
                                  ignoreGestures: false,
                                ),
                              ],
                            ))
                        : Container(),
                  ])),
        ));
  }
}
