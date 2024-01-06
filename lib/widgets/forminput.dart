import 'package:flutter/material.dart';


class FormInput extends StatelessWidget {
  final String name;
  final  controller;

  bool obscureText;
  FormInput({
    required this.name,
    this.obscureText = false,
     this.controller,

    super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(
        bottom: 26,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(2, 5)
          )
        ]
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: Colors.black12,
          filled: true,
          hintText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: Colors.yellowAccent,
            )
          )
        ),
        controller: controller,
      ),
    );
  }
}