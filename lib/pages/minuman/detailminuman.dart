import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makangih/model/minuman.dart';
import 'package:makangih/pages/homepage.dart';
import 'package:makangih/pages/minuman/ubahminuman.dart';
import 'package:makangih/service/minuman_service.dart';
import 'package:makangih/widgets/starwidget.dart';

class DetailMinuman extends StatefulWidget {
  final Minuman minuman;

  const DetailMinuman({super.key, required this.minuman});

  @override
  State<DetailMinuman> createState() => _DetailMinumanState();
}

class _DetailMinumanState extends State<DetailMinuman> {
  Stream<Minuman> getData() async* {
 Minuman data = await MinumanService().getById(widget.minuman.id.toString());
 yield data;
  }
  @override
  Widget build(BuildContext context) {

    Widget backgroundImage(){
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(widget.minuman.linkimage),
          fit: BoxFit.cover
          )
        ),
      );
    };


    Widget content() {
      return Container(
        margin: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              height: 420,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.minuman.name,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              StarWidget(),
                              StarWidget(),
                              StarWidget(),
                              StarWidget(),
                              StarWidget(),
                              
                              SizedBox(width: 5,),
                              Text(
                            '4.9',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300
                            ),
                          ),
                            ],
                          )
                        ],
                      ),
                      Text(
                            widget.minuman.harga,
                            style: GoogleFonts.poppins(
                              color: Colors.yellow.shade700,
                              fontSize: 26,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Text(
              widget.minuman.deskripsi,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 20
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    GestureDetector(
                  onTap: () =>
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UbahMinuman(minuman: widget.minuman),
                  ),
                ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 40,
                    margin: EdgeInsets.only(
                      bottom: 5
                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade700,
                      borderRadius: BorderRadius.circular(12),
                      
                    ),
                    child: Text(
                      'Edit',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                  GestureDetector(
                    onTap: () {
                      AlertDialog alertDialog = AlertDialog(
                        content: const Text(
                          "Yakin Ingin Menghapus data ini?"
                        ),
                        actions: [
                          StreamBuilder(
                          stream: getData(), 
                          builder: (context, AsyncSnapshot snapshot) => ElevatedButton(onPressed:() async{
                            await MinumanService().hapus(snapshot.data).then((value) {
                              Navigator.pop(context);
                              Navigator.pushReplacement(context, 
                              MaterialPageRoute(builder: (context) => HomePage())
                              );
                            });
                          }, child: const Text("YA"),
                            style: ElevatedButton.styleFrom(primary: Colors.red,
                          ),
                          )),
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: const Text("TIDAK"),
                          style: ElevatedButton.styleFrom(primary: Colors.green),
                          )
                        ],
                      );
                      showDialog(context: context, builder: (context)=> alertDialog);
                    },
                      
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 40,
                      margin: EdgeInsets.only(
                        bottom: 5
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade700,
                        borderRadius: BorderRadius.circular(12),
                        
                      ),
                      child: Text(
                        'Hapus',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  )
                  ],
              ),
            )
          
          ],
        ),);}


    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              backgroundImage(),
              content(),
            ],
          )
        ],
      ),
    );
  }
}