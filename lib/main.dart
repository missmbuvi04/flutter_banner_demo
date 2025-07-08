import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banner Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ProductBannerPage(),
    );
  }
}


class ProductBannerPage extends StatelessWidget {
  const ProductBannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of ProductCard widgets
    // Each ProductCard has an image, price, and a boolean to show the banner
    final products = [
      ProductCard(
        imagePath: 'assets/image1.jpeg',
        price: 'KSh 2 000',
        showBanner: true,
      ),
      ProductCard(
        imagePath: 'assets/image2.jpeg',
        price: 'KSh 2 700',
        showBanner: true,
      ),
      ProductCard(
        imagePath: 'assets/image3.jpeg',
        price: 'KSh 3 000',
        showBanner: false,
      ),
      ProductCard(
        imagePath: 'assets/image4.jpeg',
        price: 'KSh 2 200',
        showBanner: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Shoe Offers')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: products,
        ),
      ),
    );
  }
}


class ProductCard extends StatelessWidget {
  final String imagePath;
  final String price;
  final bool showBanner;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.price,
    this.showBanner = false,
  });

  @override
  Widget build(BuildContext context) {
    // 1️⃣ Create a card with an image and price
    // 2️⃣ If [showBanner] is true, wrap the card in a Banner
    final card = Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          // Product image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover, // Ensures the image covers the area without distortion
            ),
          ),
          const SizedBox(height: 8),
          
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );

    // If showBanner is true, wrap the card in a Banner widget
    if (showBanner) {
      return Banner(
        // message – text displayed in the banner

        message: 'SALE!',
        
        location: BannerLocation.bottomStart,
        // 3️⃣ color – ribbon background colour
        color: Colors.green,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize :16,),
        child: card,
      );
    }
    return card;
  }
}
