// ignore_for_file: prefer_const_constructors

import 'package:flower_app/provider/cart.dart';
import 'package:flower_app/screens/checkout.dart';
import 'package:flower_app/screens/details.dart';
import 'package:flower_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
