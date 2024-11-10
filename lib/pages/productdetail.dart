import 'package:flutter/material.dart';
import 'package:nusantararesto/config/config.dart';
import 'package:nusantararesto/pages/ordernow.dart';
import 'package:nusantararesto/themes/themes.dart';

// ignore: must_be_immutable
class ProductDetail extends StatefulWidget {
  ProductDetail({
    super.key,
    required this.nama,
    required this.imageUrl,
    required this.harga,
  });

  String nama, imageUrl, harga;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int jumlah = 1;
  bool _isFavorited = false; // Tambahkan variabel ini untuk status favorit

  void increment() {
    setState(() {
      jumlah++;
    });
  }

  void decrement() {
    setState(() {
      if (jumlah > 1) {
        jumlah--;
      }
    });
  }

  void toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
           //// Text(
            //////  "Detail Menu",
           //   style: blackTextstyle,
          //  ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: _isFavorited ? Colors.pink : Colors.grey, // Warna berubah ketika diklik
              ),
              onPressed: toggleFavorite, // Panggil fungsi toggle ketika ikon diklik
            ),
          ],
        ),
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Image.asset(
              widget.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nama,
                      style: blackTextstyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      Config.convertToIdr(int.parse(widget.harga), 0),
                      style: greyTextstyle.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: decrement,
                      child: Image.asset(
                        "assets/ic-kurang.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(jumlah.toString()),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: increment,
                      child: Image.asset(
                        "assets/ic-tambah.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Detail",
              style: blackTextstyle.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Burger daging yang rendah lemak, dilengkapi dengan keju,seledri, dan potongan bawang bombai yang lezat.",
              style: greyTextstyle.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Text(
              "Komposisi",
              style: blackTextstyle.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Roti, seledri, wijen, bawang bombai, daging sapi, keju..",
              style: greyTextstyle.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
  width: double.infinity,
  height: 90,
  color: Colors.grey.shade200,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 50,
        height: 45,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: whiteColor, // No background color
            side: BorderSide(color: Colors.white, width: 4), // Border color and width
            shadowColor: Colors.white.withOpacity(0.5), // Shadow color with opacity
            elevation: 5, // Shadow elevation
          ),
          onPressed: () {
            // Add action for shopping cart button
          },
          child: Center(
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderNowPage(
                nama: widget.nama,
                imageUrl: widget.imageUrl,
                harga: widget.harga,
                qty: jumlah.toString(),
              ),
            ),
          );
        },
        child: Container(
          width: 180,
          height: 42,
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: blackColor, width: 2),
          ),
          child: Center(
            child: Text(
              "Pesan Sekarang",
              style: whiteTextstyle,
            ),
          ),
        ),
      ),
    ],
  ),
),

    );
  }
}
