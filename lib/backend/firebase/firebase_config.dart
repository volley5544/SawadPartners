import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDqwXkznuQzISw99vnjtH41Cf56F2yLByM",
            authDomain: "sawad-partner-mobile-app.firebaseapp.com",
            projectId: "sawad-partner-mobile-app",
            storageBucket: "sawad-partner-mobile-app.appspot.com",
            messagingSenderId: "693895981513",
            appId: "1:693895981513:web:111a0586ca6f4b9a50a018",
            measurementId: "G-M6QE1QX3QZ"));
  } else {
    await Firebase.initializeApp();
  }
}
