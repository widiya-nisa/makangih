import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makangih/model/makanan.dart';
import 'package:makangih/model/minuman.dart';
import 'package:makangih/pages/makanan/createmakanan.dart';
import 'package:makangih/pages/makanan/detailmakanan.dart';
import 'package:makangih/pages/minuman/createminuman.dart';
import 'package:makangih/pages/minuman/detailminuman.dart';
import 'package:makangih/service/makanan_service.dart';
import 'package:makangih/service/minuman_service.dart';
import 'package:makangih/widgets/cardmakanan.dart';
import 'package:makangih/widgets/cardminuman.dart';
import 'package:makangih/widgets/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MakananService _makananService = MakananService();

  @override
  Widget build(BuildContext context) {
    Widget Header(){
      return Container(
        margin: EdgeInsets.only(
          left: 14,
          bottom: 16,
          top: 16,
          right: 16

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
          'MAKANAN',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
           GestureDetector(
              onTap: () {
                  Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateMakanan())
            );
              },
              child: Container(
                alignment: Alignment.center,
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
        
          ],
        )
      );
    }

     Widget HeaderMinuman(){
      return Container(
        margin: EdgeInsets.only(
          left: 14,
          bottom: 16,
          top: 16,
          right: 16

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
          'MINUMAN',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
           GestureDetector(
              onTap: () {
                  Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateMinuman())
            );
              },
              child: Container(
                alignment: Alignment.center,
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
        
          ],
        )
      );
    }



    Widget minuman(){
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          left: 16,
          right: 16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
              margin: EdgeInsets.only(
                left: 14,
                bottom: 16,
                top: 16,

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MINUMAN',
                    style : GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade700,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
              
                ],
              )
            ),
           

            SizedBox(
              height: 16,
            ),

            CardMinuman(
            imageUrl: "https://images.unsplash.com/photo-1514994960127-ed3ef9239d11?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 
            name: "Rashbewwy", 
            desc: 'minuman ini sangat menyegarkan dengan rasanya yang asam tapi nikmat dapat menghilangkan dahagamu, percayalah!',
            price: "45.000"),
             CardMinuman(
            imageUrl: "https://images.unsplash.com/photo-1623123093799-70a72826e167?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 
            name: "Jus Alpoekad", 
            desc: 'minuman ini sangat menyegarkan dengan rasanya yang manis  karna buahnya ditanam di pegunungan yang sangat tinggi',
            price: "45.000"),
             CardMinuman(
            imageUrl: "https://images.unsplash.com/photo-1572490122747-3968b75cc699?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 
            name: "coklat milksek", 
            desc: 'Rasa coklat yang tiada tiganya, dicampur dengan toping oleo blackpink menambah kenikmatan rasa coklat miklsake ',
            price: "45.000"),
             CardMinuman(
            imageUrl: "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 
            name: "Esklim", 
            desc: 'Pokoknya ini enak dah, bingung deskripsiinnya soalnya seenak itu dan sengantuk itu buat mikir deskripsinya, jadi cobain aja mending',
            price: "45.000")
          ],
        ),
      );
    }
      

    return Scaffold(
      body: ListView(
        children: [
          Header(),
          MakananListWidget(),
          HeaderMinuman(),
          MinumanListWidget(),

        ],
      ),
    );
    
      
    
  }
}


class MakananListWidget extends StatelessWidget {
  final MakananService _makananService = MakananService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Makanan>>(
      future: _makananService.listData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Tidak ada data makanan.'));
        } else {
          List<Makanan> makananList = snapshot.data!;
          return MakananHorizontalList(makananList: makananList);
        }
      },
    );
  }
}

class MakananHorizontalList extends StatelessWidget {
  final List<Makanan> makananList;

  MakananHorizontalList({required this.makananList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: makananList.length,
        itemBuilder: (context, index) {
          return MakananCard(makanan: makananList[index]);
        },
      ),
    );
  }
}

class MakananCard extends StatelessWidget {
  final Makanan makanan;

  MakananCard({required this.makanan});

  @override
  Widget build(BuildContext context) {
    return CardMakanan(imageUrl: makanan.linkimage, 
             name: makanan.name, price: makanan.harga,
             onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMakanan(makanan: makanan),
          ),
        );
      },
             );
  }
}

class MinumanListWidget extends StatelessWidget {
  final MinumanService _minumanService = MinumanService();

  @override
  Widget build(BuildContext context) {
  return FutureBuilder<List<Minuman>>(
    future: _minumanService.listData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return Center(child: Text('Tidak ada data Minuman.'));
      } else {
        return Container(
          height: 500,
          margin: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => MinumanCard(minuman: snapshot.data![index]),
          ),
        );
      }
    },
  );
}
}


class MinumanCard extends StatelessWidget {
  final Minuman minuman;

  MinumanCard({required this.minuman});

  @override
  Widget build(BuildContext context) {
    return CardMinuman(
      imageUrl: minuman.linkimage, 
      name: minuman.name, 
      price: minuman.harga, 
      desc: minuman.deskripsi,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMinuman(minuman: minuman),
          ),
        );
      },
    );
  }
}