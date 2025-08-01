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

import 'package:firebase_auth/firebase_auth.dart';

Future<String> createFirebaseCopyCopy(
  String? username,
  String? password,
) async {
  // Add your function code here!
  bool thisFirebaseAccountIsCreated = false;
  String authType = 'Login';
  String emailUser = '$username@sawadpartner.com';
  try {
    UserCredential userCredential1 = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username!, password: password!);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found' ||
        e.code == 'wrong-password' ||
        e.code == 'invalid-email') {
      authType = 'notLogin';
      thisFirebaseAccountIsCreated = false;
    } else {
      authType = 'Login';
      thisFirebaseAccountIsCreated = true;
    }

    //else if (e.code == 'wrong-password') {
    //print('Wrong password provided for that user.');
    //}
  }
  FFAppState().isFromLogin = true;
  FFAppState().LoggedIn = true;
  FFAppState().agentName = username!;
  return authType;
}
