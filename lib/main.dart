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
      title: 'Layanan IT',
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

  static const List<Map<String, dynamic>> katalog = [
    {
      'nama': 'Paket Basic',
      'harga': 'Rp 2.500.000',
      'kategori': 'Layanan IT',
      'icon': Icons.computer,
      'deskripsi':
          'Paket layanan IT dasar untuk kebutuhan bisnis dan sistem sederhana.',
    },
    {
      'nama': 'Paket Profesional',
      'harga': 'Rp 5.000.000',
      'kategori': 'Layanan IT',
      'icon': Icons.laptop_mac,
      'deskripsi':
          'Solusi IT profesional untuk kebutuhan bisnis dengan fitur lengkap.',
    },
    {
      'nama': 'Paket Enterprise',
      'harga': 'Rp 10.000.000',
      'kategori': 'Layanan IT',
      'icon': Icons.business,
      'deskripsi': 'Solusi IT lengkap untuk perusahaan dengan kebutuhan sistem yang kompleks.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        title: const Text(
          'Layanan IT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Katalog Layanan',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          const Text(
            'Pilih layanan IT yang sesuai dengan kebutuhan Anda.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),

          const SizedBox(height: 20),

          _buildCard(context, katalog[0]),

          const SizedBox(height: 15),

          _buildCard(context, katalog[1]),

          const SizedBox(height: 15),

          _buildCard(context, katalog[2]),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, Map<String, dynamic> data) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: ListTile(
        contentPadding: const EdgeInsets.all(18),

        // ICON
        leading: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(data['icon'], color: Colors.blue[800], size: 30),
        ),

        // TITLE
        title: Text(
          data['nama'],
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),

        // SUBTITLE
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Text(
            '${data['harga']}\n${data['kategori']}',
            style: const TextStyle(height: 1.5),
          ),
        ),

        // CTA
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                nama: data['nama'],
                harga: data['harga'],
                kategori: data['kategori'],
                deskripsi: data['deskripsi'],
                icon: data['icon'],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String nama;
  final String harga;
  final String kategori;
  final String deskripsi;
  final IconData icon;

  const DetailScreen({
    super.key,
    required this.nama,
    required this.harga,
    required this.kategori,
    required this.deskripsi,
    required this.icon,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Detail Katalog',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(widget.icon, size: 60, color: Colors.blue[800]),
            ),

            const SizedBox(height: 20),

            Text(
              widget.nama,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            Text(
              widget.kategori,
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              widget.harga,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.deskripsi,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.green : Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isSelected ? 'Paket Dipilih ✓' : 'Pilih Paket',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Katalog'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
