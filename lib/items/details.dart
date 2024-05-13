import 'package:ebook/items/info.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INFO'),
        backgroundColor: const Color.fromARGB(255, 27, 228, 255),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'E-Book Siswa',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                'Versi 1.0.0',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                height: 300,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Transform.rotate(
                      angle: -25 * 3.14159 / 180,
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.contain,
                        width: 140,
                      ),
                    ),
                    const Positioned(
                      bottom: 150,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '© 2024 E-Book Siswa',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Lisensi()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Info Pengembang',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
