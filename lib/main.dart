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

/// Screen that displays a 2 × 2 grid of shoe cards.
class ProductBannerPage extends StatelessWidget {
  const ProductBannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Hard‑coded product list: first two have a banner.
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

/// Re‑usable widget that shows one product card.
/// If [showBanner] is true, the card is wrapped in a Banner widget.
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
    // The underlying card
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
              fit: BoxFit.cover, // fills the width while preserving aspect
            ),
          ),
          const SizedBox(height: 8),
          // Price label
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );

    // Optionally overlay the Banner
    if (showBanner) {
      return Banner(
        // 1️⃣ message – the text on the ribbon
        message: 'OFFER!',
        // 2️⃣ location – corner in which the ribbon appears
        location: BannerLocation.topEnd,
        // 3️⃣ color – ribbon background colour
        color: Colors.redAccent,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        child: card,
      );
    }
    return card;
  }
}
