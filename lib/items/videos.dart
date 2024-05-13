import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  VideosState createState() => VideosState();
}

class VideosState extends State<Videos> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  int _currentVideoIndex = 1;

  List<String> videoTitles = [
    'One of the Biggest Mistakes in Learning (Kok Bisa Explains)',
    'Why Are We Nervous When Talking in Public?',
    'Video Motivasi Pendidikan Siswa-Siswa SMP/Sederajat',
    'Stop Bullying - Stop Kekerasan di Sekolah',
    'Seberapa Penting Kesehatan Mental Untuk Kita?'
  ];

  @override
  void initState() {
    _controller = VideoPlayerController.asset(
        'assets/video/video$_currentVideoIndex.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadNewVideo(int newIndex) async {
    await _controller.pause();
    await _controller.seekTo(Duration.zero);
    setState(() {
      _currentVideoIndex = newIndex;
      _controller = VideoPlayerController.asset(
          'assets/video/video$_currentVideoIndex.mp4');
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
    });
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VIDEO EDUCATIONS'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 15 / 9,
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return VideoPlayer(_controller);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    setState(() {
                      if (_currentVideoIndex > 1) {
                        _loadNewVideo(_currentVideoIndex - 1);
                      }
                    });
                  },
                  icon: Icons.skip_previous,
                ),
                const SizedBox(width: 16),
                CustomButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  icon: _controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                ),
                const SizedBox(width: 16),
                CustomButton(
                  onPressed: () {
                    setState(() {
                      if (_currentVideoIndex < 5) {
                        _loadNewVideo(_currentVideoIndex + 1);
                      }
                    });
                  },
                  icon: Icons.skip_next,
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Video lainnya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/video/cover/cover${index + 1}.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _loadNewVideo(index + 1);
                            },
                            child: Text(
                              videoTitles[index],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;

  const CustomButton({super.key, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Icon(icon),
        ),
      ),
    );
  }
}
