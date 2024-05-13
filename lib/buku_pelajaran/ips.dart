import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ips extends StatefulWidget {
  const Ips({super.key});

  @override
  State<Ips> createState() => _IpsState();
}

class _IpsState extends State<Ips> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  final String eBooks = "ips.pdf";

  @override
  void initState() {
    super.initState();
    _pdfViewerController.addListener(() async {
      int currentPage = _pdfViewerController.pageNumber;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('$eBooks-lastPage', currentPage);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      int lastPage = prefs.getInt('$eBooks-lastPage') ?? 1;
      _pdfViewerController.jumpToPage(lastPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ilmu Pengetahuan Sosial"),
      ),
      body: SfPdfViewer.asset(
        "assets/buku/$eBooks",
        controller: _pdfViewerController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveCurrentPage,
        tooltip: 'Simpan Halaman',
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> _saveCurrentPage() async {
    int currentPage = _pdfViewerController.pageNumber;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('$eBooks-lastPage', currentPage);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Halaman $currentPage disimpan!'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
