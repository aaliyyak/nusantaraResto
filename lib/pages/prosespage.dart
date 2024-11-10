
import 'package:flutter/material.dart';
import 'package:nusantararesto/pages/landing.dart';
import 'package:nusantararesto/pages/orderpage.dart';
import 'package:nusantararesto/themes/themes.dart';

class ProsesPage extends StatelessWidget {
  const ProsesPage(
      {super.key,
      required String nama,
      required String harga,
      required String qty,
      required String imageUrl,
      required String namaLengkap,
      required String nomorTelepon,
      required String alamat,
      required String metodeBayar,
      required String totalKeseluruhan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: MediaQuery.of(context).size.height * 0.15,
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Pesananmu sudah\nDiterima!",
                textAlign: TextAlign.center,
                style: blackTextstyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(height: 160, child: Image.asset("assets/pr.png")),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Pesananmu sedang diproses,mohon ditunggu ya!",
                textAlign: TextAlign.center,
                style: greyTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 28,
            ),
           // TextButton(
          //    style: TextButton.styleFrom(
          //      backgroundColor: secondaryColor,
           //   ),
          //    onPressed: () {
          //      Navigator.push(
           //       context,
        //          MaterialPageRoute(builder: (context) => OrderScreen()),
        //        );
            //  },
           //   child: Text(
            //    "Cek Pesanan",
            //    style: whiteTextstyle,
           //   ),
           // ),
            SizedBox(
              height: 23,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LandingPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  "Kembali ke Beranda",
                  style: secodaryTextstyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
