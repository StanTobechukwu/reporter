import 'package:flutter/material.dart';
//import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart'as pw;
import 'package:path_provider/path_provider.dart';
import 'package:report_app/selectionpage.dart';
import 'dart:io';
import 'package:signature/signature.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'previewPage.dart';
import 'dart:typed_data';


class   SecondScreen extends StatefulWidget {
 final Map<String, String> ?textFromPage1;
 final String ?textFromPage2;
 final String ? typeOfText;
  const SecondScreen({ this.textFromPage1, this.textFromPage2, this.typeOfText, super.key }) ;

  @override
 State<SecondScreen> createState() => _SecondScreenState(); 

}
class _SecondScreenState extends State<SecondScreen> {

 final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  File? _image;
 // bool _showPreview = false; // Control the visibility of the preview
   final ImagePicker _picker = ImagePicker();



    // Method to pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Method to capture image with camera

  Future<void> _pickImage(ImageSource source) async {
    
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


    Future<void> _navigateToPreviewScreen() async {
                  // Collect all input data
                  String fullReport;
                  if (widget.typeOfText== 'plainInputPage') {
                    fullReport= widget.textFromPage2 ?? 'No Data Provided';}
                    else{ fullReport= '''

Mouth and pharynx: ${widget.textFromPage1?['mouthAndPharynx']??'NA'}

Upper third of esophagus: ${widget.textFromPage1?['upperEsophagus']?? 'NA' }

Middle third of esophagus: ${widget.textFromPage1?['middleEsophagus']?? 'NA'  }

Lower third of esophagus: ${widget.textFromPage1?['lowerEsophagus' ] ??'NA' }

Stomach: ${widget.textFromPage1?['stomachAndDuodenum']?? 'NA'  }
'''; }
  
    // Get the signature bytes
    Uint8List? signature = await _signatureController.toPngBytes();
  // Show the preview report screen
   final pdfPath = await _generatePDF(fullReport);
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewReportScreen(
            reportContent: fullReport,
            signature : signature,
            pdfPath: pdfPath,
            image: _image,))); 
                if (result == true) {
    await _generatePDF(fullReport); 
  
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SelectionPage()),  // Replace with your main screen widget
        (Route<dynamic> route) => false);  // Clears the navigation stack
     }}

  Future<bool> _requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status.isGranted;}


  Future<void> createDirectoryIfNotExists(String dirPath) async {
  final directory = Directory(dirPath);
  
  // Check if the directory exists
  if (!await directory.exists()) {
    // Create the directory
    await directory.create(recursive: true);
    print('Directory created: $dirPath');
  } else {
    print('Directory already exists: $dirPath');
  }
}



Future<String> _generatePDF(String fullReport) async {
   if (await _requestStoragePermission()){
    final pdf = pw.Document();
    final signature = await _signatureController.toPngBytes();

    pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Endoscopy Report', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 20),
            pw.Text(fullReport),
             pw.SizedBox(height: 20), // Space before adding the signature
          if (signature != null) pw.Text('Signature:'), // Optional label for signature
          if (signature != null) pw.Image(pw.MemoryImage(signature), width: 300, height: 150),
        ],
        ),
      ),
    );

  

      // Add image to the PDF
    if (_image != null) {
      final imageBytes = _image!.readAsBytesSync();
      final image = pw.MemoryImage(imageBytes);

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Center(
            child: pw.Image(image, width: 300, height: 300)
          ),
        ),
      );
    }

    // Get the directory for saving the PDF
    final directory = await getExternalStorageDirectory();
    final pdfPath = '${directory!.path}/Downloads/report.pdf';

     final downloadsDirPath = '${directory.path}/Downloads';
    // Create the Downloads directory if it doesn't exist
    await createDirectoryIfNotExists(downloadsDirPath);
    final file = File(pdfPath);
    await file.writeAsBytes(await pdf.save());


    // Show Confirmation Page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF saved at ${file.path}')),
    );
    return pdfPath;}
    
     else {
      // Handle permission denied
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission is required to save the PDF')),
      );return '';
    }
  }

 /* void _showReportPreview(String fullReport) {
    setState(() {
      _showPreview = true;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display captured signature
            Signature(
              controller: _signatureController,
              height: 150,
              backgroundColor: Colors.grey[200]!,
            ),
            ElevatedButton(
              onPressed: () => _signatureController.clear(),
              child: const Text("Clear Signature"),
            ),
              
            const SizedBox(
              height: 15.0,
            ),
              Container(
            padding: const EdgeInsets.all(8.0),
             margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.circular(12.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Pick image from gallery button
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: _pickImageFromGallery,
                    child: const Text('Pick Image from Gallery'),
                  ),
                ),
                // Capture image button
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    child: const Text("Capture Image"),
                  ),
                ),
              ],
            ),
          ),
            _image != null
                ? Image.file(_image!, height: 200)  // Display the captured image
                : const Text("No image selected"),

            
    
//     SizedBox(height:20),
//     ElevatedButton(
//       onPressed:() {
//         Navigator.pop(
//           context,
//           MaterialPageRoute(builder:(context)
//           =>SelectionPage()),
//           );
// },
// child: Text('Back'),
// ),
const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                 onPressed: ()async{_navigateToPreviewScreen();},
                child: const Text('Go to Preview Page'),
                 ),
          ),
            ],
        ),
      ),
    );
  }}