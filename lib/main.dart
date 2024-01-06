import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makangih/helpers/user_info.dart';
import 'package:makangih/pages/homepage.dart';
import 'package:makangih/pages/loginpage.dart';
import 'package:makangih/pages/makanan/createmakanan.dart';
import 'package:makangih/pages/makanan/detailmakanan.dart';
import 'package:makangih/pages/minuman/createminuman.dart';
import 'package:makangih/pages/minuman/detailminuman.dart';
import 'package:makangih/pages/signuppage.dart';
import 'package:makangih/pages/splashpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  // print(token);
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MakanGih',
      theme: ThemeData(
            useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow.shade700,
            // ···
            brightness: Brightness.dark,
          ),
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.poppins(),
          ),

       ),

       home:  token == null ? LoginPage() : HomePage()  ,
       
    )
  );
}



