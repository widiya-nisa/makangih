import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 2
      ),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/star.png'))
      ),
    );
  }
}