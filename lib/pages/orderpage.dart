
import 'package:flutter/material.dart';
import 'package:nusantararesto/themes/themes.dart';
import 'package:nusantararesto/widgets/orderwidget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            Text(
              "Riwayat Pesanan",
              style: blackTextstyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //panggil order widgets
            OrderWidget(
              nama: "Ayam Geprek",
              imageUrl: "assets/ayam.png",
              harga: "20000",
              qty: "1",
              status: "Diproses",
            ),

            OrderWidget(
              nama: "Ikan Nila",
              imageUrl: "assets/nila.png",
              harga: "15000",
              qty: "1",
              status: "Selesai",
            ),
          ],
        ),
      ),
    );
  }
}
