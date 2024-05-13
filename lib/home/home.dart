import 'package:flutter/material.dart';
import 'package:ebook/buku_pelajaran/bahasa_arab.dart';
import 'package:ebook/buku_pelajaran/bahasa_indonesia.dart';
import 'package:ebook/buku_pelajaran/bahasa_inggris.dart';
import 'package:ebook/buku_pelajaran/ipa.dart';
import 'package:ebook/buku_pelajaran/ips.dart';
import 'package:ebook/buku_pelajaran/matematika.dart';
import 'package:ebook/buku_pelajaran/ppkn.dart';
import 'package:ebook/items/details.dart';
import 'package:ebook/items/videos.dart';
import 'package:logger/logger.dart';

class Home extends StatelessWidget {
  final Logger _logger = Logger();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-BOOK SISWA'),
        leading: Transform.rotate(
          angle: -25 * 3.141592653589793238 / 180,
          child: Image.asset('assets/logo.png', width: 20),
        ),
        backgroundColor: const Color.fromARGB(255, 27, 228, 255),
        elevation: 10.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 27, 228, 255),
              Color.fromARGB(255, 193, 255, 250)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            _buildBookItem(
              title: 'BAHASA INDONESIA',
              author: 'Titik Harsiati.',
              coverImage: 'assets/cover/bahasa indonesia.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BahasaIndonesia()),
                );
              },
            ),
            _buildBookItem(
              title: 'BAHASA INGGRIS',
              author: 'Siti Wachidah.',
              coverImage: 'assets/cover/bahasa inggris.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BahasaInggris()),
                );
              },
            ),
            _buildBookItem(
              title: 'BAHASA ARAB',
              author: 'Achmad Rasyid Ridha, M.PI',
              coverImage: 'assets/cover/bahasa arab.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BahasaArab()),
                );
              },
            ),
            _buildBookItem(
              title: 'MATEMATIKA',
              author: 'Tim Gakko Tosho',
              coverImage: 'assets/cover/matematika.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Matematika()),
                );
              },
            ),
            _buildBookItem(
              title: 'PPKN',
              author: 'Lukman Surya',
              coverImage: 'assets/cover/ppkn.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PPKN()),
                );
              },
            ),
            _buildBookItem(
              title: 'IPA',
              author: 'Wasis',
              coverImage: 'assets/cover/ipa.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ipa()),
                );
              },
            ),
            _buildBookItem(
              title: 'IPS',
              author: 'Wasis',
              coverImage: 'assets/cover/ips.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ips()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'E-Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.white,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Videos()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Details()),
            );
          } else {
            _logger.d('Tab $index dipilih');
          }
        },
      ),
    );
  }

  Widget _buildBookItem({
    required String title,
    required String author,
    required String coverImage,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        color: Colors.lightBlue,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  coverImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    author,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
