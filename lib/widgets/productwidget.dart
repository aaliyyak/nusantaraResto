// Sesuaikan ProductWidget dengan rating
import 'package:flutter/material.dart';
import 'package:nusantararesto/config/config.dart';
import 'package:nusantararesto/pages/productdetail.dart';
import 'package:nusantararesto/themes/themes.dart';

// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  ProductWidget({
    super.key,
    required this.nama,
    required this.imageUrl,
    required this.harga,
    this.rating = 0.0, // Tambahkan rating dengan nilai default 0.0
  });

  // Variabel untuk menerima data
  final String nama, imageUrl, harga;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => ProductDetail(
              nama: nama,
              imageUrl: imageUrl,
              harga: harga,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(
                nama,
                style: blackTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(
                Config.convertToIdr(int.parse(harga), 0),
                style: greyTextstyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13, top: 4),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  SizedBox(width: 4),
                  Text(
                    rating.toStringAsFixed(1), // Tampilkan rating dengan 1 angka desimal
                    style: greyTextstyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
