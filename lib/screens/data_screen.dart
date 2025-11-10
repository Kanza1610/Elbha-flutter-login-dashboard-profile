import 'package:flutter/material.dart';
import '../models/user_model.dart';

class DataScreen extends StatelessWidget {
  final User user;

  const DataScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Akademik'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDataCard(
            'Data Pribadi',
            Icons.person,
            [
              {'label': 'Nama', 'value': user.name},
              {'label': 'NIM', 'value': user.nim},
              {'label': 'Email', 'value': user.email},
              {'label': 'Telepon', 'value': user.phone},
            ],
          ),
          const SizedBox(height: 16),
          _buildDataCard(
            'Data Akademik',
            Icons.school,
            [
              {'label': 'Program Studi', 'value': user.prodi},
              {'label': 'Semester', 'value': user.semester},
              {'label': 'Status', 'value': 'Aktif'},
              {'label': 'Tahun Angkatan', 'value': '2023'},
            ],
          ),
          const SizedBox(height: 16),
          _buildDataCard(
            'Mata Kuliah Semester Ini',
            Icons.library_books,
            [
              {'label': 'Advance Mobile Programming', 'value': '3 SKS'},
              {'label': 'Pemrograman Web Lanjut', 'value': '3 SKS'},
              {'label': 'Basis Data Lanjut', 'value': '3 SKS'},
              {'label': 'Kecerdasan Buatan', 'value': '3 SKS'},
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataCard(
      String title, IconData icon, List<Map<String, String>> data) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...data.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          item['label']!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          item['value']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
