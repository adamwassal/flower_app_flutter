// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flower_app/constants/colors.dart';
import 'package:flower_app/screens/login.dart';
import 'package:flower_app/widgets/entry.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(33.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Entry(
              label: 'Username',
              hintText: 'Enter unique username',
              icon: Icons.person,
              inputType: TextInputType.text,
              isPassword: false,
            ),
            Entry(
              label: 'Email',
              hintText: 'Enter your email',
              icon: Icons.email,
              inputType: TextInputType.emailAddress,
              isPassword: false,
            ),
            Entry(
              label: 'Password',
              hintText: 'Enter your password',
              icon: Icons.password,
              inputType: TextInputType.text,
              isPassword: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(btnbg),
                    padding: WidgetStateProperty.all(EdgeInsets.all(12.0)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))))),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("I have an account",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 17),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
