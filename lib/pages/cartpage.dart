import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nusantararesto/themes/themes.dart';
import 'package:nusantararesto/widgets/cartwidget.dart';
import 'order_page.dart'; // Import OrderPage

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<bool> _selectedItems = [false, false]; // Checkbox untuk item
  List<int> _quantities = [1, 1]; // Kuantitas item

  // Fungsi untuk menghitung total harga berdasarkan checkbox
  int calculateTotal() {
    int total = 0;
    if (_selectedItems[0]) total += _quantities[0] * 20000;
    if (_selectedItems[1]) total += _quantities[1] * 23000;
    return total;
  }

  // Fungsi untuk memformat angka dengan titik pemisah ribuan
  String formatCurrency(int amount) {
    return NumberFormat('#,##0', 'id_ID').format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListView(
                children: [
                  Text(
                    "Daftar Pesanan",
                    style: blackTextstyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: _selectedItems[0],
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            _selectedItems[0] = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: CartWidget(
                          nama: "Ikan Nila",
                          harga: "20.000",
                          imageUrl: "assets/nila.png",
                          qty: _quantities[0],
                          onQuantityChanged: (newQty) {
                            setState(() {
                              _quantities[0] = newQty;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _selectedItems[1],
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            _selectedItems[1] = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: CartWidget(
                          nama: "Ayam Geprek",
                          harga: "23.000",
                          imageUrl: "assets/ayam.png",
                          qty: _quantities[1],
                          onQuantityChanged: (newQty) {
                            setState(() {
                              _quantities[1] = newQty;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: blackTextstyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      "Rp ${formatCurrency(calculateTotal())}",
                      style: blackTextstyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _selectedItems.contains(true)
                      ? () {
                          // Navigasi ke OrderPage dengan data pesanan
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(
                                totalHarga: calculateTotal(),
                                selectedItems: [
                                  if (_selectedItems[0])
                                    {'nama': 'Ikan Nila', 'harga': 20000},
                                  if (_selectedItems[1])
                                    {'nama': 'Ayam Geprek', 'harga': 23000},
                                ],
                              ),
                            ),
                          );
                        }
                      : null,
                  child: Text(
                    "Pesan Sekarang",
                    style: whiteTextstyle,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedItems.contains(true)
                        ? Colors.black
                        : Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
