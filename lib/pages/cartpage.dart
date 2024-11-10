
import 'package:flutter/material.dart';
import 'package:nusantararesto/themes/themes.dart';
import 'package:nusantararesto/widgets/cartwidget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 39,
        ),
        child: ListView(
          children: [
            Text(
              "Daftar Pesanan ",
              style: blackTextstyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20,),
            // widget cart
            CartWidget(
              nama: "Ikan Nila",
              harga: "20000",
              imageUrl: "assets/nila.png",
              qty: "1",
            ),
            CartWidget(
              nama: "Ayam Geprek",
              harga: "23000",
              imageUrl: "assets/ayam.png",
              qty: "1",
            ),
            
          ],
        ),
      ),
    );
  }
}
