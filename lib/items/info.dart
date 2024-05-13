import 'package:flutter/material.dart';

class Lisensi extends StatelessWidget {
  const Lisensi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INFO PENGEMBANG'),
        backgroundColor: const Color.fromARGB(255, 27, 228, 255),
      ),
      body: SingleChildScrollView(
        // Menambahkan SingleChildScrollView
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 27, 228, 255),
                Color.fromARGB(255, 193, 255, 250)
              ],
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROFILE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  height: 20,
                  color: Colors.black,
                ),
                SizedBox(height: 20),
                ListTile(
                  title: Text(
                    'NIM:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text('204855090', style: TextStyle(fontSize: 18)),
                ),
                ListTile(
                  title: Text(
                    'Nama Mahasiswa:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle:
                      Text('Novia Ardani', style: TextStyle(fontSize: 18)),
                ),
                ListTile(
                  title: Text(
                    'Jurusan:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text('Teknik Informatika',
                      style: TextStyle(fontSize: 18)),
                ),
                ListTile(
                  title: Text(
                    'Judul Skripsi:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text(
                      'Pengembangan Aplikasi Ebook Siswa Berbasis Android Untuk Meningkatkan Potensi Minat Membaca',
                      style: TextStyle(fontSize: 18)),
                ),
                ListTile(
                  title: Text(
                    'Dosen Pembimbing 1:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle:
                      Text('Muh. Hifni M.Pd', style: TextStyle(fontSize: 18)),
                ),
                ListTile(
                  title: Text(
                    'Dosen Pembimbing 2:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text('Yudi Sutaryana S.Kom M.Kom',
                      style: TextStyle(fontSize: 18)),
                ),
                Divider(
                  height: 20,
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    'INFO E-BOOK',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  subtitle: Text(
                      'Aplikasi Ebook siswa ini merupakan buku yang berbentuk elektronik atau digital yg berisi informasi, atau panduan selayaknya buku pada umumnya.\n Aplikasi Ebook siswa ini bertujuan untuk mengeksplorasi bagaimana pengalaman siswa atau siswi dalam menggunakan aplikasi ebook siswa berbasis android dan bagaimana pengalaman tersebut memengaruhi minat baca mereka.\nAplikasi ini masih jauh dari kata sempurna.\nOleh karena itu, segala saran dan kritik membangun sangat saya harapkan demi kesempurnaan aplikasi ebook siswa ini.',
                      style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
