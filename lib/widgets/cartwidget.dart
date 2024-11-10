
import 'package:flutter/material.dart';
import 'package:nusantararesto/config/config.dart';
import 'package:nusantararesto/pages/ordernow.dart';
import 'package:nusantararesto/themes/themes.dart';

// ignore: must_be_immutable
class CartWidget extends StatefulWidget {
  CartWidget(
      {super.key,
      required this.nama,
      required this.harga,
      required this.qty,
      required this.imageUrl});

  // variabel utk menerima isian dari si pemanggil widget ini
  String nama, harga, qty, imageUrl;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = int.tryParse(widget.qty) ?? 1; // Safeguard for invalid integers
  }

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            widget.imageUrl,
            width: 150,
            height: 150,
          ),
          // SizedBox(
          //   width: 20,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.nama,
                style: blackTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                Config.convertToIdr(int.parse(widget.harga), 0),
                style: greyTextstyle,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/ic-kurang.png",
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.qty,
                    style: blackTextstyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/ic-tambah.png",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),

              // button pesan
              SizedBox(height: 8,),
              Container(
                width: 84,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: secondaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderNowPage(
                          nama: widget.nama,
                          harga: widget.harga,
                          qty: quantity.toString(),
                          imageUrl: widget.imageUrl,
                        ),
                      ),
                    );
                  },
                  
                  child: Text(
                    "Pesan",
                    style: whiteTextstyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
