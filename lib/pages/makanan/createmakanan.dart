import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makangih/model/makanan.dart';
import 'package:makangih/pages/homepage.dart';
import 'package:makangih/pages/loginpage.dart';
import 'package:makangih/service/makanan_service.dart';
import 'package:makangih/widgets/forminput.dart';

class CreateMakanan extends StatefulWidget {
  const CreateMakanan({super.key});

  @override
  State<CreateMakanan> createState() => _CreateMakananState();
}

class _CreateMakananState extends State<CreateMakanan> {
  final _formKey = GlobalKey<FormState>();
    final _nameCtrl = TextEditingController();
    final _deskripsiCtrl = TextEditingController();
    final _linkimageCtrl = TextEditingController();
    final _hargaCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {

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

    
  

    Widget formCreateFood(){
      return Container(
        margin: EdgeInsets.only(
          left: 50,
          right: 50,
          top: 40
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tambah Produk Makanan',
             style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500
             ),
            ),
            SizedBox(
              height: 26,
            ),
            FormInput(name: 'Nama Makanan', controller: _nameCtrl,),
            FormInput(name: 'Deskripsi', controller: _deskripsiCtrl,),
            FormInput(name: 'link Image', controller: _linkimageCtrl,),
            FormInput(name: 'Harga', controller: _hargaCtrl,),
          ],
        ),
      );
    }

    Widget createButton(){
      return GestureDetector(
        onTap: () async{
            Makanan makanan = Makanan(
            name: _nameCtrl.text,
            deskripsi: _deskripsiCtrl.text,
            linkimage: _linkimageCtrl.text,
            harga: _hargaCtrl.text,
          );
          await MakananService().simpan(makanan).then((value) =>
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()))
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
            'Tambah',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      );
    }

  


    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonKembali(),
              formCreateFood(),
              createButton(),
            ],
          )
        ],
      ),
    );
  }
}