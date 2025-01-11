import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:nusantararesto/pages/cartpage.dart';
import 'package:nusantararesto/pages/homepage.dart';
import 'package:nusantararesto/pages/orderpage.dart';
import 'package:nusantararesto/themes/themes.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Homepage(), // 0
    CartPage(), // 1
    OrderScreen(), // 2
  ];

  void _onItemTapped(int index) {
    if (index >= 0 && index < _widgetOptions.length) {
      setState(() {
        _selectedIndex = index;
        debugPrint("Indeks dipilih: $_selectedIndex");
      });
    } else {
      debugPrint("Indeks tidak valid: $index");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedPage;
    try {
      selectedPage = _widgetOptions.elementAt(_selectedIndex);
    } catch (e) {
      debugPrint("Kesalahan saat memilih halaman: $e");
      selectedPage = Homepage(); // Default fallback
    }

    return Scaffold(
      body: selectedPage,
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Beranda'),
          TabItem(icon: Icons.shopping_cart, title: 'Keranjang'),
          TabItem(icon: Icons.receipt, title: 'Pesanan'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: whiteColor,
        activeColor: Colors.black,
        color: Colors.lime.shade900,
        height: 49,
      ),
    );
  }
}
