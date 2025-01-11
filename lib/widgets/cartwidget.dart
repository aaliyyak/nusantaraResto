import 'package:flutter/material.dart';
import 'package:nusantararesto/themes/themes.dart';
import 'package:nusantararesto/config/config.dart';
import 'package:intl/intl.dart';

class CartWidget extends StatefulWidget {
  CartWidget({
    super.key,
    required this.nama,
    required this.harga,
    required this.qty,
    required this.imageUrl,
    required this.onQuantityChanged,
  });

  final String nama, harga, imageUrl;
  final int qty;
  final Function(int) onQuantityChanged;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.qty;
  }

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
    widget.onQuantityChanged(quantity);
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      widget.onQuantityChanged(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            widget.imageUrl,
            width: 120,
            height: 120,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.nama,
                style: blackTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Konversi harga string ke integer setelah menghapus titik
              Text(
                Config.convertToIdr(
                  int.parse(widget.harga.replaceAll('.', '')), 0),
                style: greyTextstyle,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: _decreaseQuantity,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: const Icon(
                        Icons.remove,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    quantity.toString(),
                    style: blackTextstyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: _increaseQuantity,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Config {
  // Fungsi untuk konversi angka ke format Rupiah
  static String convertToIdr(int amount, int decimal) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: decimal,
    );
    return formatter.format(amount);
  }
}
