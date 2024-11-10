import 'dart:async';
//import 'package:nusantararesto/pages/homepage.dart';
import 'package:nusantararesto/pages/landing.dart';
import 'package:nusantararesto/themes/themes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  // memanggil function ap yg akan dijalankan saat halaman ini dipanggil
  void initState() {
    // TODO: implement initState
    super.initState();
    movingPage();
  }

  //fungsi setelah 2 detik akan berpindah halaman
  void movingPage() {
    Timer(Duration(seconds: 10), () {
      // masukkan fungsi navigation
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingPage()));
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // baris ke-1
            Container(
              margin: EdgeInsets.only(
                  left: 20, top: 100),
              child: Row(
                children: [
                  ///Image.asset("assets/image1.png"),
                  //SizedBox(
                 //   width: 9,
                 // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Rasa ",
                        style: splashTextstyle1.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                       Text(
                        " Nusantara",
                        style: splashTextstyle1.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            
            // baris ke-3
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/splash.jpg",
                      width: double.infinity,
                      fit: BoxFit.cover,
                      
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // baris ke-2
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                    //  Text(
                     //   "Temukan Selera",
                    //    style: splashTextstyle2.copyWith(
                    //      fontSize: 30,
                   //       fontWeight: FontWeight.w400,
                   //     ),
                  //    ),
                 //     Text(
                //        "Makanan dan Minuman Anda Disini",
                //        style: splashTextstyle2.copyWith(
               //           fontSize: 30,
              //            fontWeight: FontWeight.w400,
            //            ),
            //          ),
                    
                  Center(
                    child: Text(
                      "Family-Food-Restaurant",
                      style: splashTextstyle2.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  //Text(
                  //  "Burger!",
                   // style: splashTextstyle2.copyWith(
                  //    fontSize: 40,
                   //   fontWeight: FontWeight.w400,
                   // ),
                 // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
