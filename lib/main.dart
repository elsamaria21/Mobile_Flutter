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
      title: 'Kartu Harga Layanan IT',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const PricingPage(),
    );
  }
}

class PricingPage extends StatelessWidget {
  const PricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kartu Harga Layanan IT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // =========================
            // PAKET PROFESIONAL
            // =========================
            PricingCard(
              icon: Icons.laptop_mac,
              packageName: 'Paket Profesional',
              description: 'Solusi lengkap untuk kebutuhan bisnis Anda',
              price: 'Rp 5.000.000',
              duration: '/ proyek',
              recommended: true,
              features: const [
                'Desain UI/UX Khusus',
                'Setup Database',
                'Maintenance & Update',
                'Free Konsultasi',
              ],
            ),

            const SizedBox(height: 25),

            // =========================
            // PAKET STANDAR
            // =========================
            PricingCard(
              icon: Icons.smartphone,
              packageName: 'Paket Standar',
              description: 'Solusi untuk startup kecil dan menengah',
              price: 'Rp 2.500.000',
              duration: '/ proyek',
              recommended: false,
              features: const ['Desain UI/UX Standar', 'Setup Database'],
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// WIDGET KARTU HARGA
// ======================================================

class PricingCard extends StatelessWidget {
  final IconData icon;
  final String packageName;
  final String description;
  final String price;
  final String duration;
  final bool recommended;
  final List<String> features;

  const PricingCard({
    super.key,
    required this.icon,
    required this.packageName,
    required this.description,
    required this.price,
    required this.duration,
    required this.recommended,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        // Efek bayangan
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      // =================================================
      // STACK
      // =================================================
      child: Stack(
        children: [
          // Elemen utama kartu
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // HEADER PAKET
              // =========================
              Icon(icon, size: 55, color: const Color(0xFF1769E0)),

              const SizedBox(height: 12),

              Text(
                packageName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                description,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),

              const SizedBox(height: 18),

              // =========================
              // HARGA + DURASI
              // =========================
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1769E0),
                    ),
                  ),

                  const SizedBox(width: 5),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      duration,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // =========================
              // FITUR LAYANAN
              // =========================
              Column(
                children: features.map((feature) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: Row(
                      children: [
                        const Icon(Icons.check, size: 18, color: Colors.green),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            feature,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 10),

              // =========================
              // TOMBOL
              // =========================
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$packageName dipilih')),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1769E0),
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    elevation: 2,
                  ),

                  child: const Text(
                    'Pilih Paket',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

          // =================================================
          // BADGE REKOMENDASI
          // =================================================
          if (recommended)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFFFC107),
                  borderRadius: BorderRadius.circular(8),
                ),

                child: const Text(
                  'Rekomendasi',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
