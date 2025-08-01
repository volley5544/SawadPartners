// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future downloadPDFButton(String? pdfUrl) async {
  // Add your function code here!

  final uri = Uri.parse(pdfUrl!); // Convert the string to a Uri.

  final response = await http.get(uri); // Use the Uri object in http.get.

  if (response.statusCode == 200) {
    // Get the document directory on the device.
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/my_pdf.pdf';

    // Write the PDF data to the file.
    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
  }
}
