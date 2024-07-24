import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umah_front/screens/notification_screen/widgets/widget.dart';
import 'package:umah_front/shared/styles/colors.dart';

class NotificationScreen extends StatelessWidget {
  final bool isClient;

  const NotificationScreen({Key? key,required this.isClient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width10 = MediaQuery.of(context).size.width / 41;
    double height10 = MediaQuery.of(context).size.height / 82;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
           statusBarColor: AppColors.UMAH_VIOLET.withOpacity(.8),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image:AssetImage("assets/images/background/png/notificationsBackground.png")
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,

          children: [
            SizedBox(height: height10*3,),
            //appbar
            Row(
              children: [
                SizedBox(width: width10*3,),
                Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Notifications",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                          SizedBox(width: width10*1.5,),
                          Icon(Icons.notifications_active_outlined,color: AppColors.UMAH_YELLOW,size: 25,),
                        ],
                      )),
                ),


              ],
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                return isClient?studentNotificationItem(context):teacherNotificationItem(context);
              },),
            )


          ],
        ),
      ),
      backgroundColor: AppColors.UMAH_VIOLET,
    );
  }
}
