import 'dart:async';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    Timer(
      Duration(seconds: 3),
      (){
        Navigator.pushNamed(context, '/login');
      }
    );
    super.initState();

  }  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/logoresto.png'),
                fit: BoxFit.fill
                )
              ),
            )
          ],
        ),
      ),
    );
}
}