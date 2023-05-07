import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:vlogpost1/utils/download.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  String progress = '';
  // var assetPath = 'assets/flutter-succinctly.pdf';
  @override
  Widget build(BuildContext context) {
    var url =
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf';
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pdf Screen'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  setState(() {
                    DioFileDownlaod().startDownloading(url, context);
                  });
                },
                icon: const Icon(Icons.download))
          ],
        ),
        body: SfPdfViewer.network(url));
  }

  // Future<void> downloadPDFAsset(String assetPath) async {
  //   final dio = Dio();
  //   final appDocDir = await getApplicationDocumentsDirectory();
  //   final file = File('${appDocDir.path}/assetPath.pdf');

  //   try {
  //     final assetData = await rootBundle.load(assetPath);
  //     await file.writeAsBytes(assetData.buffer.asUint8List());

  //     final response = await dio.download(assetPath, file.path);
  //     print('Downloaded PDF with status code ${response.statusCode}');
  //   } catch (e) {
  //     print('Error downloading PDF: $e');
  //   }
  // }
}
