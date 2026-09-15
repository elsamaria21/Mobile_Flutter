import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katalog Produk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data katalog
    final List<Map<String, dynamic>> katalog = [
      {
        'nama': 'Laptop',
        'harga': 'Rp8.500.000',
        'icon': Icons.laptop_mac,
        'warna': Colors.blue,
        'deskripsi': 'Laptop dengan performa tinggi yang cocok digunakan untuk belajar, mengerjakan tugas, bekerja, dan berbagai aktivitas sehari-hari.',
      },
      {
        'nama': 'Smartphone',
        'harga': 'Rp4.500.000',
        'icon': Icons.smartphone,
        'warna': Colors.green,
        'deskripsi': 'Smartphone modern dengan desain menarik dan fitur lengkap yang dapat membantu pengguna dalam berkomunikasi dan menjalankan berbagai aplikasi.',
      },
      {
        'nama': 'Headset',
        'harga': 'Rp750.000',
        'icon': Icons.headphones,
        'warna': Colors.orange,
        'deskripsi': 'Headset dengan desain nyaman yang cocok digunakan untuk mendengarkan musik, menonton video, bermain game, dan mengikuti meeting.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Katalog Produk',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Daftar Katalog',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            'Pilih produk untuk melihat detail katalog.',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),

          const SizedBox(height: 20),

          _buildCard(
            context: context,
            nama: katalog[0]['nama'],
            harga: katalog[0]['harga'],
            icon: katalog[0]['icon'],
            warna: katalog[0]['warna'],
            deskripsi: katalog[0]['deskripsi'],
          ),

          const SizedBox(height: 18),

          _buildCard(
            context: context,
            nama: katalog[1]['nama'],
            harga: katalog[1]['harga'],
            icon: katalog[1]['icon'],
            warna: katalog[1]['warna'],
            deskripsi: katalog[1]['deskripsi'],
          ),

          const SizedBox(height: 18),

          _buildCard(
            context: context,
            nama: katalog[2]['nama'],
            harga: katalog[2]['harga'],
            icon: katalog[2]['icon'],
            warna: katalog[2]['warna'],
            deskripsi: katalog[2]['deskripsi'],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required String nama,
    required String harga,
    required IconData icon,
    required Color warna,
    required String deskripsi,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: warna.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, size: 50, color: warna),
            ),

            const SizedBox(height: 15),

            Text(
              nama,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            Text(
              harga,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: warna,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        nama: nama,
                        harga: harga,
                        icon: icon,
                        warna: warna,
                        deskripsi: deskripsi,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: warna,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Lihat Detail',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String nama;
  final String harga;
  final IconData icon;
  final Color warna;
  final String deskripsi;

  const DetailScreen({
    super.key,
    required this.nama,
    required this.harga,
    required this.icon,
    required this.warna,
    required this.deskripsi,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool disukai = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Katalog',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: widget.warna,

        // ICON BACK
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: widget.warna.withOpacity(0.15),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(widget.icon, size: 70, color: widget.warna),
            ),

            const SizedBox(height: 25),

            Text(
              widget.nama,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              widget.harga,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: widget.warna,
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: widget.warna.withOpacity(0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    widget.deskripsi,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    disukai = !disukai;
                  });
                },
                icon: Icon(disukai ? Icons.favorite : Icons.favorite_border),
                label: Text(disukai ? 'Produk Disukai' : 'Sukai Produk'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.warna,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              disukai
                  ? 'Kamu menyukai produk ini'
                  : 'Kamu belum menyukai produk ini',
              style: TextStyle(
                color: disukai ? widget.warna : Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
