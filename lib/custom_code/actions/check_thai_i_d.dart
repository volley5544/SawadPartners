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

Future<bool?> checkThaiID(String? thaiID) async {
  // Add your function code here!
  RegExp regex = RegExp(r'\d+');
  Iterable<Match> matches = regex.allMatches(thaiID!);
  String numbers = "";
  for (Match match in matches) {
    numbers += match.group(0) ?? "";
  }

  if (numbers!.length != 13) {
    // ID card number should be exactly 13 digits
    return false;
  }

  int sum = 0;
  for (int i = 0; i < 12; i++) {
    sum += int.parse(numbers[i]) * (13 - i);
  }

  int checkDigit = (11 - (sum % 11)) % 10;
  return checkDigit == int.parse(numbers[12]);
}
