import 'package:flutter/material.dart';

void main() => runApp(const BannerDemoApp());

class BannerDemoApp extends StatelessWidget {
  const BannerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Banner Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const BannerHomePage(),
    );
  }
}

class BannerHomePage extends StatefulWidget {
  const BannerHomePage({super.key});

  @override
  State<BannerHomePage> createState() => _BannerHomePageState();
}

class _BannerHomePageState extends State<BannerHomePage> {
  final List<bool> _onSale = [true, false, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Widget Demo'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _onSale.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final card = GestureDetector(
            onTap: () {
              setState(() {
                _onSale[index] = !_onSale[index];
              });
            },
            child: Card(
              elevation: 3,
              color: Colors.deepPurple[100],
              child: Center(
                child: Text(
                  'Product ${index + 1}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          );

          return _onSale[index]
              ? Banner(
                  message: 'ON SALE',
                  location: BannerLocation.topStart,
                  color: Colors.blueAccent,
                  child: card,
                )
              : card;
        },
      ),
    );
  }
}











