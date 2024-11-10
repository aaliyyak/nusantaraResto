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
    Homepage(), //0
    CartPage(), //1
    OrderScreen(), //2
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: ConvexAppBar(
  items: [
    TabItem(icon: Icons.home, title: 'Beranda'),
    TabItem(icon: Icons.shopping_cart, title: 'Keranjang'),
    TabItem(icon: Icons.receipt, title: 'Pesanan'),
  ],
  initialActiveIndex: _selectedIndex, // Default is the first item.
  onTap: _onItemTapped,
  backgroundColor: whiteColor,
  activeColor: const Color(0XFF964B22),
  color: Colors.black,
  height: 50, // Adjust this value to increase or decrease the height
),

    );
  }
}
