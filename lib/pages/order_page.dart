import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderPage extends StatefulWidget {
  final int totalHarga;
  final List<Map<String, dynamic>> selectedItems;

  const OrderPage({
    super.key,
    required this.totalHarga,
    required this.selectedItems,
  });

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String? selectedMetode;
  String? namaPemesan;
  int? nomorMeja;

  String formatCurrency(int amount) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(amount);
  }

  int generateRandomNomorMeja() {
    return Random().nextInt(50) + 1; // Nomor meja antara 1 hingga 50
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pesanan Anda:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...widget.selectedItems.map((item) {
                return ListTile(
                  title: Text(item['nama']),
                  trailing: Text(formatCurrency(item['harga'])),
                );
              }).toList(),
              const SizedBox(height: 10),
              Text(
                "Total Harga: ${formatCurrency(widget.totalHarga)}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    namaPemesan = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Nama Pemesan",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Metode Pembayaran:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedMetode,
                hint: const Text("Pilih metode pembayaran"),
                isExpanded: true,
                items: ['Cash', 'Transfer Bank', 'QRIS']
                    .map(
                      (metode) => DropdownMenuItem(
                        value: metode,
                        child: Text(metode),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedMetode = value;
                  });
                },
              ),
              //const Spacer(),
              SizedBox(height: 25,),
              ElevatedButton(
                onPressed: selectedMetode != null && namaPemesan != null
                    ? () {
                        if (selectedMetode == 'QRIS') {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Scan QR Code untuk pembayaran: ",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 10),
                                  Image.asset(
                                    'assets/bc.jpeg',
                                    height: 290,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      // Menampilkan nomor meja setelah pembayaran QRIS
                                      nomorMeja = generateRandomNomorMeja();
                                    });
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Pembayaran Berhasil"),
                              content: const Text(
                                  "Terima kasih, pesanan Anda sedang diproses."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      // Menampilkan nomor meja setelah pembayaran cash atau transfer bank
                                      nomorMeja = generateRandomNomorMeja();
                                    });
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      (selectedMetode != null && namaPemesan != null)
                          ? Colors.blue
                          : Colors.grey,
                ),
                child: const Text(
                  "Bayar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // Menampilkan nomor meja setelah pembayaran
              if (nomorMeja != null)
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          "Nomor Meja Anda:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "$nomorMeja",
                          style: const TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
