import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BahasaIndonesia extends StatefulWidget {
  const BahasaIndonesia({super.key});

  @override
  State<BahasaIndonesia> createState() => _BahasaIndonesiaState();
}

class _BahasaIndonesiaState extends State<BahasaIndonesia> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  final String eBooks = "bahasa indonesia.pdf";

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
        title: const Text("Bahasa Indonesia"),
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
