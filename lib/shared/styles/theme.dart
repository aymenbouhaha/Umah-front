import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class Themes{
  static final lightTheme=ThemeData(
      fontFamily: 'Poppins',
      primarySwatch: AppColors.mainSwatchColor,
      appBarTheme:  AppBarTheme(
          actionsIconTheme: IconThemeData(color: AppColors.UMAH_VIOLET,size: 20),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize:24,
          ),
          iconTheme: IconThemeData(color: AppColors.UMAH_VIOLET),
          elevation: 0,
          color: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          )
      ),

      textTheme:  TextTheme(

        bodyLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.UMAH_VIOLET
        ),
        bodyMedium: TextStyle(
          color: AppColors.UMAH_VIOLET,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        bodySmall: TextStyle(
            fontSize: 12,
          color: AppColors.UMAH_GREY,

        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme:BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor:  AppColors.UMAH_GREY
      )
  );

}