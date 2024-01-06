import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makangih/pages/homepage.dart';
import 'package:makangih/pages/signuppage.dart';
import 'package:makangih/service/login_service.dart';
import 'package:makangih/widgets/forminput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Widget logo(){
      return Container(
        margin: EdgeInsets.only(
          top: 70,
          bottom: 10,
          left: 16,
          right: 16
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/logoresto.png'))
        ),
      );
    }

    Widget formLogin(){
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login To Your Account',
             style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500
             ),
            ),
            SizedBox(
              height: 26,
            ),

             FormInput(name: "Email",
             controller: _usernameCtrl,),
             FormInput(name: "Password",
             obscureText: true,
             controller: _passwordCtrl,
             ),

          ],
        ),
      );
      
    }

    Widget loginButton(){
      return GestureDetector(
        onTap: () async {
          String username = _usernameCtrl.text;
          String password = _passwordCtrl.text;
          await LoginService().login(username, password).then((value) {
          if (value == true){
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
          } else{
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Login Gagal'),
                  content: Text('email atau password salah.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
          }
          }
          );

        },
          
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 40,
          margin: EdgeInsets.only(
            left: 50,
            right: 50,
            bottom: 5
          ),
          decoration: BoxDecoration(
            color: Colors.yellow.shade700,
            borderRadius: BorderRadius.circular(12),
            
          ),
          child: Text(
            'Login',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      );
    }

    Widget belumPunyaAkun(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't Have An Account ?",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w300
            ),
          ),
          TextButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SignUp())
            );
          }, 
          child:Text(
            'Sign Up',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          )
          )
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                     logo(),
                    formLogin(),
                    loginButton(),
                    belumPunyaAkun()
                  ],
                )
              
              )
             
            ],
          )
        ],
      ),
    );
  }
}