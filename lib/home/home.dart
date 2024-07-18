import 'package:ebook/buku_pelajaran/b_in.dart';
import 'package:ebook/buku_pelajaran/ipa.dart';
import 'package:ebook/buku_pelajaran/ips.dart';
import 'package:ebook/buku_pelajaran/mtk.dart';
import 'package:ebook/buku_pelajaran/ppkn.dart';
import 'package:flutter/material.dart';
import 'package:ebook/buku_pelajaran/b_ar.dart';
import 'package:ebook/buku_pelajaran/b_ing.dart';
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
        title: const Text('e-Book Siswa'),
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 27, 228, 255),
              Color.fromARGB(255, 193, 255, 250)
            ],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            _buildBookItem(
              title: 'BAHASA ARAB',
              author: 'Achmad Rasyid Ridha, M.Pi',
              coverImage: 'assets/cover/1.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Barab()),
                );
              },
            ),
            _buildBookItem(
              title: 'BAHASA INDONESIA',
              author: 'Titik Harsiati',
              coverImage: 'assets/cover/2.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bind()),
                );
              },
            ),
            _buildBookItem(
              title: 'BAHASA IINGGRIS',
              author: 'Siti Wachidah',
              coverImage: 'assets/cover/3.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bing()),
                );
              },
            ),
            _buildBookItem(
              title: 'IPA',
              author: 'Victoriani Inabuy, dkk.',
              coverImage: 'assets/cover/4.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ipa()),
                );
              },
            ),
            _buildBookItem(
              title: 'IPS',
              author: 'Ahmad Mushlih',
              coverImage: 'assets/cover/5.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ips()),
                );
              },
            ),
            _buildBookItem(
              title: 'MATEMATIKA',
              author: 'Abdur Rahman As’ari',
              coverImage: 'assets/cover/6.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Mtk()),
                );
              },
            ),
            _buildBookItem(
              title: 'PPKN',
              author: ' Lukman Surya Saputra',
              coverImage: 'assets/cover/7.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ppkn()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
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
        color: Colors.blue,
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
