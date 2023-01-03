import 'package:ecomerce_app/Screens/authScreen/authScreen.dart';
import 'package:ecomerce_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
Widget build(BuildContext context) {
   
      return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
             onGenerateRoute:((settings) => genarateRoute(settings)) ,
            home: const AuthScreen(),
          );
        }
       
      );
 
  }
   
}

