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

// import 'package:flutter_web_browser/flutter_web_browser.dart';
// import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

final MyInAppBrowser browser = new MyInAppBrowser();

Future openTableauBrowser() async {
  // Add your function code here!
  // WidgetsFlutterBinding.ensureInitialized();
  // await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

  var options = InAppBrowserClassSettings(
      browserSettings: InAppBrowserSettings(hideUrlBar: false),
      webViewSettings: InAppWebViewSettings(javaScriptEnabled: true));

  await browser.openUrlRequest(
      urlRequest: URLRequest(
          url: WebUri(
              "https://pt.swpfin.com/ssw_mis/mis/tb/mb/EmployeeInsurancePerformance/Top_10_Sales/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC80My4yNDkuMTExLjIxOjgwODhcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODcyMzMxNDcsIm5iZiI6MTY4NzIzMzE0NywianRpIjoiZXFLcTVTU1V1V2hrUEFWeSIsInN1YiI6Mzk4NjQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.fOOrO9pvP1EFNZpMvRB8lW-MdSwi0QQRaeyT1J0dR4I")),
      settings: options);

  // var url = 'https://pt.swpfin.com/ssw_mis/mis/tb/post';
  // var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  // var body = {
  //   'token':
  //       'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC80My4yNDkuMTExLjIxOjgwODhcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODcyMzMxNDcsIm5iZiI6MTY4NzIzMzE0NywianRpIjoiZXFLcTVTU1V1V2hrUEFWeSIsInN1YiI6Mzk4NjQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.fOOrO9pvP1EFNZpMvRB8lW-MdSwi0QQRaeyT1J0dR4I',
  //   'report_name': 'EmployeeInsurancePerformance',
  //   'sheet_name': 'Top_10_Sales'
  // };

  // var response = await http.post(Uri.parse(url), headers: headers, body: body);

  // if (response.statusCode == 200) {
  //   print('statusCode = ' + '${response.statusCode}');
  //   // var resultUrl =
  //   //     response.body; // Assuming the server responds with the resulting URL
  //   // print('body = ' + '${resultUrl}');

  //   return '${response.body}';
  //   //await FlutterWebBrowser.openWebPage(url: resultUrl);
  //   // await FlutterWebBrowser.openWebPage(
  //   //   url: resultUrl,
  //   //   customTabsOptions: CustomTabsOptions(
  //   //     urlBarHidingEnabled: true,
  //   //     shareState: CustomTabsShareState.off,
  //   //     showTitle: false,
  //   //     instantAppsEnabled: false,
  //   //     defaultColorSchemeParams: CustomTabsColorSchemeParams(
  //   //       toolbarColor: Colors.transparent,
  //   //       secondaryToolbarColor: Colors.transparent,
  //   //       navigationBarColor: Colors.transparent,
  //   //       navigationBarDividerColor: Colors.transparent,
  //   //     ),
  //   //     colorScheme: CustomTabsColorScheme.dark,
  //   //   ),
  //   // );
  // } else {
  //   // Handle error
  //   // print('rip');
  //   // print('statusCode = ' + '${response.statusCode}');
  //   return 'failed';
  // }
}

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}
