// ignore_for_file: must_be_immutable, unused_local_variable, avoid_web_libraries_in_flutter

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdfx/pdfx.dart';

class PDFCV extends StatefulWidget {
  dynamic context;
  PDFCV({Key? key, this.context}) : super(key: key);

  @override
  State<PDFCV> createState() => _PDFCVState();
}

class _PDFCVState extends State<PDFCV> {
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/cv.pdf'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CV'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: _pdf(),
                height: 800.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              _button()
            ],
          ),
        ));
  }

  Widget _pdf() {
    return PdfView(
      controller: pdfController,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      backgroundDecoration: BoxDecoration(
          color: Colors.black87,
          border: Border.all(width: 10.0, color: Colors.blueAccent.shade400)),
    );
  }

  downloadFile(url) {
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = "CV";
    anchorElement.click();
  }

  Widget _button() {
    return TextButton(
        onPressed: () async {
          downloadFile('https://professio.herokuapp.com/api/users/download');
        },
        child: Text(
          'Descargar CV',
          style: GoogleFonts.andada(
              textStyle: Theme.of(context).textTheme.headline3,
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic),
        ));
  }
}
