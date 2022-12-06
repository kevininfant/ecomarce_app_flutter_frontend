import 'package:ecomerce_app/Screens/authScreen/authScreen.dart';
import 'package:flutter/material.dart';
Route<dynamic> genarateRoute(RouteSettings routeSettings){

  switch (routeSettings.name) {
    case AuthScreen.routeName: 
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) =>  AuthScreen()) ;

      
    
    default:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Screen dosesnot exits!'),
        ),
      )) ;
  }
}