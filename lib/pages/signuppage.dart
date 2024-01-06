import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makangih/model/user.dart';
import 'package:makangih/pages/loginpage.dart';
import 'package:makangih/service/user_service.dart';
import 'package:makangih/widgets/forminput.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameCtrl = TextEditingController();
    final _emailCtrl = TextEditingController();
    final _phoneCtrl = TextEditingController();
    final _passwordCtrl = TextEditingController();

    Widget ButtonKembali(){
      return GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/login'),
        child: Container(
          margin: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.yellow.shade700,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
      );
    }

    
    Widget logo(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
        margin: EdgeInsets.only(
          bottom: 10,
          left: 16,
          right: 16
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/logoresto.png'))
        ),
      )
        ],
      );
    }

    Widget formSignUp(){
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Your Account',
             style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500
             ),
            ),
            SizedBox(
              height: 26,
            ),
            FormInput(name: 'Nama', controller: _nameCtrl,),
            FormInput(name: 'Email',  controller: _emailCtrl),
            FormInput(name: 'Phone Number' ,  controller: _phoneCtrl),
            FormInput(
              name: 'Password',
              obscureText: true,
               controller: _passwordCtrl
              ),

          ],
        ),
      );
    }

    Widget SignUpButton(){
      return GestureDetector(
        onTap: () async{
          User user = User(
            name: _nameCtrl.text,
            email: _emailCtrl.text,
            phone: _phoneCtrl.text,
            password: _passwordCtrl.text,
          );
          await UserService().simpan(user).then((value) =>
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()))
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
            'Sign Up',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      );
    }

     Widget sudahPunyaAkun(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already Have  Account ?",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w300
            ),
          ),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, '/login');
          }, 
          child:Text(
            'Log in',
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
          Form(
            key : _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ButtonKembali(),
                logo(),
                formSignUp(),
                SignUpButton(),
                sudahPunyaAkun()
              ],
            ),
          )
        ],
      ),
    );
  }
}