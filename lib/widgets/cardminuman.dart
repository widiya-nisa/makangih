import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makangih/model/minuman.dart';
import 'package:makangih/widgets/starwidget.dart';

class CardMinuman extends StatelessWidget {
  final  imageUrl;
  final  name;
  final  price;
  final  desc;
  final  onTap;



  const CardMinuman({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.desc,
     this.onTap,
    super.key, });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(9),
        width: double.infinity,
        height: 147,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 16
              ),
              width: 120,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(imageUrl),
                fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.circular(
                  16
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 16
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    width: 300,
                    child: Text(
                    desc,
                    style: GoogleFonts.poppins(
                      color: Colors.blueGrey,
                      fontSize: 10,
                      fontWeight: FontWeight.w500
                    
                    ),
                    softWrap: true,
                  ),
                  ),
                  SizedBox(height: 6),
                  
                  Container(
                    width: 300,
                    child:   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          StarWidget(),
                          StarWidget(),
                          StarWidget(),
                          StarWidget(),
                          StarWidget(), 
                        ],
                      ),
                      Text(
                      'Rp.' + price,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w800
                      ),
                  )            
                    ],
                  ),
                  )
      
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}