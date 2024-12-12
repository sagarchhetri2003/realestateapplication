// import 'package:realestateapplication/view/splash_screen_view.dart';
// import 'package:realestateapplication/view/login_screen_view.dart';
// import 'package:realestateapplication/view/register_screen_view.dart';
// import 'package:realestateapplication/view/location_screen_view.dart';
import 'package:realestateapplication/view/payment_screen_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: PaymentScreenView());
  }
}
