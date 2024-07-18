import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bind extends StatefulWidget {
  const Bind({super.key});

  @override
  State<Bind> createState() => _BindState();
}

class _BindState extends State<Bind> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  // final String eBooks =
  //     "https://drive.google.com/uc?export=download&id=1d03ZpFfGC-tfRxBZHSUbpi31MoMsQvr9";
  final String eBookAsset = "assets/buku/b ind.pdf";

  @override
  void initState() {
    super.initState();
    _pdfViewerController.addListener(() async {
      int currentPage = _pdfViewerController.pageNumber;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('$eBookAsset-lastPage', currentPage);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      int lastPage = prefs.getInt('$eBookAsset-lastPage') ?? 1;
      _pdfViewerController.jumpToPage(lastPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BAHASA INDONESIA"),
      ),
      body: SfPdfViewer.asset(
        // Menggunakan SfPdfViewer.network
        eBookAsset,
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
    await prefs.setInt('$eBookAsset-lastPage', currentPage);
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