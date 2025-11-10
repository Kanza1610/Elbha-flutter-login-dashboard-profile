import 'package:flutter/material.dart';
import '../models/user_model.dart';

class SettingsScreen extends StatefulWidget {
  final User user;

  const SettingsScreen({super.key, required this.user});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _darkMode = false;
  bool _biometric = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
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
          // Profil Singkat
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.user.nim,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Pengaturan Umum
          _buildSectionHeader('Pengaturan Umum'),
          _buildSettingSwitch(
            'Notifikasi',
            'Terima notifikasi dari aplikasi',
            Icons.notifications,
            _notifications,
            (value) {
              setState(() {
                _notifications = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    value ? 'Notifikasi diaktifkan' : 'Notifikasi dimatikan',
                  ),
                ),
              );
            },
          ),
          _buildSettingSwitch(
            'Mode Gelap',
            'Tampilkan aplikasi dalam mode gelap',
            Icons.dark_mode,
            _darkMode,
            (value) {
              setState(() {
                _darkMode = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    value ? 'Mode gelap diaktifkan' : 'Mode gelap dimatikan',
                  ),
                ),
              );
            },
          ),
          _buildSettingSwitch(
            'Login Biometrik',
            'Gunakan sidik jari atau wajah untuk login',
            Icons.fingerprint,
            _biometric,
            (value) {
              setState(() {
                _biometric = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    value ? 'Biometrik diaktifkan' : 'Biometrik dimatikan',
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Pengaturan Akun
          _buildSectionHeader('Pengaturan Akun'),
          _buildSettingItem(
            'Ubah Password',
            'Ganti password akun Anda',
            Icons.lock,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fitur ubah password akan datang!'),
                ),
              );
            },
          ),
          _buildSettingItem(
            'Privacy & Security',
            'Kelola privasi dan keamanan akun',
            Icons.security,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fitur privacy & security akan datang!'),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Tentang Aplikasi
          _buildSectionHeader('Tentang Aplikasi'),
          _buildSettingItem(
            'Versi Aplikasi',
            'v1.0.0 - AMP UAS 2025',
            Icons.info,
            () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Tentang Aplikasi'),
                  content: const Text(
                    'Advance Mobile Programming\n'
                    'Ujian Akhir Semester 2025\n'
                    'Dibuat oleh Elbha Aulia Kanza Prathista\n'
                    'NIM: 23670114\n'
                    'Program Studi Informatika 5B',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('TUTUP'),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 32),

          // Tombol Logout
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                _showLogoutConfirmation(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'LOGOUT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildSettingSwitch(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('BATAL'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog
              Navigator.pop(context); // Kembali ke settings
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('LOGOUT'),
          ),
        ],
      ),
    );
  }
}
