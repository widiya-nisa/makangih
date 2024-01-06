import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardMakanan extends StatelessWidget {
  final  imageUrl;
  final  name;
  final  price;
  final  onTap;
  
  const CardMakanan({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
              width: 156,
              height: 209,
              margin: EdgeInsets.only(left: 11, right: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 156,
                    height: 139,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(imageUrl),
                      fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)
      
                      )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16,
                      bottom: 8,
                    ),
                    child: Text(
                      name,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 18,
                          right: 3
                        ),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(
                            'assets/star.png'
                          ))
                        ),
                      ),
                     
                      Expanded(
                        child: Text(
                          '4.9',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Text(
                          'Rp.' + price,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
      
                        ),
                      )
                    ],
                  ),
                 
                ],
              ),
            ),
    );
  }
}