// ignore_for_file: prefer_const_constructors, use_super_parameters, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class Entry extends StatelessWidget {

  final IconData icon; 
  final String hintText; 
  final TextInputType inputType;
  final String label;
  final bool isPassword;

  const Entry({
    required this.icon,
    required this.hintText,
    required this.inputType,
    required this.label,
    required this.isPassword,
    Key ? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: inputType,
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            hintText: '$hintText',
            prefixIcon: Icon(
              icon,
              size: 30.0,
            ),
            
            label: Text('$label'),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            contentPadding: EdgeInsets.all(10.0)),
            obscureText: isPassword,
      ),
    );
  }
}
