import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umah_front/shared/styles/colors.dart';

import '../../../shared/widgets/button_widget.dart';

Widget teacherNotificationItem(context){
  double width10 = MediaQuery.of(context).size.width / 41;
  double height10 = MediaQuery.of(context).size.height / 82;
  return Container(
    padding:EdgeInsets.symmetric(horizontal: width10*2,vertical: height10),
    margin: EdgeInsets.symmetric(horizontal: width10*3,vertical: height10*2),
    height: height10*19,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Foulen Ben Foulen ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 17),),
        Text("vous a envoyé une commande",style: Theme.of(context).textTheme.bodySmall,),
        SizedBox(height: height10,),
        Row(
          children: [
            SizedBox(width: width10,),
            Container(
              height: height10*6,
              width:height10*6 ,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(.5),offset: Offset(0,4),blurRadius: 5)
                ],
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset("assets/images/illustrations/profile_placeholder_illustration.svg"),
            ),
            SizedBox(width: width10*2,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Adresse de foulen ben foulen",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text("Instrument",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text("Durée",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text("Prix",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text("+216 99 999 999",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10),maxLines: 1,overflow: TextOverflow.ellipsis,),


                ],
              ),
            )
          ],
        ),
        SizedBox(height: height10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ButtonWidget(color: AppColors.UMAH_VIOLET,onTap: (){},fontColor: AppColors.UMAH_VIOLET,textContent: "Accepter",filled: false,width: width10*8,height: height10*2.5,),
            SizedBox(width: width10*2,),
            ButtonWidget(color: AppColors.UMAH_YELLOW,onTap: (){},fontColor: AppColors.UMAH_YELLOW,textContent: "Refuser",filled: false,width: width10*8,height: height10*2.5,)

          ],
        )

      ],
    ),
  );

}

Widget studentNotificationItem(context){
  double width10 = MediaQuery.of(context).size.width / 41;
  double height10 = MediaQuery.of(context).size.height / 82;
  return Container(
    padding:EdgeInsets.symmetric(horizontal: width10*2,vertical: height10),
    margin: EdgeInsets.symmetric(horizontal: width10*3,vertical: height10*2),
    height: height10*10,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
    ),
    child: Row(
      children: [
        SizedBox(width: width10,),
        Container(
          height: height10*6,
          width:height10*6 ,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(.5),offset: Offset(0,4),blurRadius: 5)
            ],
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/images/illustrations/profile_placeholder_illustration.svg"),
        ),
        SizedBox(width: width10*2,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Foulen Ben Foulen ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 17),maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text("a accepté votre commande",style: Theme.of(context).textTheme.bodySmall,),
              Spacer(),
              Text("+216 99 999 999",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10),maxLines: 1,overflow: TextOverflow.ellipsis,),
              SizedBox(height: height10,)

            ],
          ),
        )
      ],
    ),
  );

}