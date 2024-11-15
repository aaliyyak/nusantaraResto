import 'package:flutter/material.dart';
import 'package:nusantararesto/themes/themes.dart';
import 'package:nusantararesto/widgets/productwidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();

  // Daftar warna untuk setiap banner card
  final List<Color> bannerColors = [
    Colors.blueGrey,
    Colors.lime.shade900,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 22),
        child: ListView(
          children: [
            // Kolom pencarian
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.search),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: borderColor),
                ),
                hintText: "Cari Menu favoritmu...",
                hintStyle: greyTextstyle,
              ),
            ),
            SizedBox(height: 20),

            // Banner and dots indicator in a Stack
            Stack(
              children: [
                Container(
                  height: 170,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      _buildBannerCard("assets/nila.png", "KHUSUS PENGGUNA BARU!", "Dapetin Diskon\nbayar dengan COD!", bannerColors[0]),
                      _buildBannerCard("assets/ayam.png", "PROMO TERBATAS!", "Beli Sekarang\nDapatkan Cashback!", bannerColors[1]),
                      _buildBannerCard("assets/nila.png", "DISKON BULANAN!", "Nikmati diskon\nhingga 50%!", bannerColors[2]),
                    ],
                  ),
                ),
                
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Positioned(
                    bottom: 8, // Adjust this value to move the dots higher or lower
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: secondaryColor,
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 8,
                          expansionFactor: 3,
                        ),
                      ),
                    ),
                  ),
            ),
            SizedBox(height: 20),

            // Teks "Mungkin kamu suka!"
            Text(
              "Menu yang Mungkin kamu sukai!",
              style: blackTextstyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),

            // Daftar produk
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 12,
                childAspectRatio: 5 / 7,
                mainAxisSpacing: 12,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ProductWidget(
                    nama: "Nasi Ikan Nila",
                    imageUrl: "assets/nila.png",
                    harga: "20000",
                    rating: 4.8,
                  ),
                  ProductWidget(
                    nama: "Nasi Ayam Geprek",
                    imageUrl: "assets/ayam copy.png",
                    harga: "15000",
                    rating: 4.6,
                  ),
                  ProductWidget(
                    nama: "Nasi Ayam Geprek",
                    imageUrl: "assets/ayam copy.png",
                    harga: "15000",
                     rating: 4.5,

                  ),
                  ProductWidget(
                    nama: "Nasi Ikan Nila",
                    imageUrl: "assets/nila.png",
                    harga: "20000",
                    rating: 4.8,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
        
      ),
      
    );
  }

  // Widget untuk membuat card banner dengan warna latar belakang
  Widget _buildBannerCard(String imageUrl, String title, String subtitle, Color backgroundColor) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4, left: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: backgroundColor, // Warna latar belakang diubah
              width: double.infinity,
              padding: EdgeInsets.only(right: 90), // Space for image
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 29),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      title,
                      style: whiteTextstyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      subtitle,
                      style: blackTextstyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                      onPressed: () {
                        // Tambahkan aksi di sini
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 19),
                        child: Text(
                          "Pesan Sekarang!",
                          style: whiteTextstyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: 20, // Adjust top position as needed
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        
      ],
    );
    
  }
}
