import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';



class PreviewReportScreen extends StatelessWidget {
  final String reportContent;
  final Uint8List? signature;
  final File? image;
  final String pdfPath;

  const PreviewReportScreen({
    Key? key,
    required this.reportContent,
    required this.signature,
    this.image,
    required this.pdfPath,
  }): super(key: key);

   // Share PDF file function
  Future<void> _sharePDF() async {
    final file = File(pdfPath);
    if (await file.exists()) {
      Share.shareFiles([pdfPath], text: 'Here is the generated report.');
    } else {
      print("PDF file doesn't exist.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Report')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(
            child: PDFView(
              filePath: pdfPath,
            ),
          ),
             
                const SizedBox(height: 20),
              
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true); // Return to the previous screen
                    },
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                onPressed: _sharePDF,
                child: const Text('Share PDF'),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
