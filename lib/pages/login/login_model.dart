import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - locationPermission] action in Login widget.
  bool? location;
  // Stores action output result for [Firestore Query - Query a collection] action in Login widget.
  UserCustomRecord? userCustom;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Custom Action - getBuildVersion] action in Button-Login widget.
  String? getBuildVersion;
  // Stores action output result for [Custom Action - createFirebaseCopyCopy] action in Button-Login widget.
  String? loginFirebaseAgentOutput;
  // Stores action output result for [Custom Action - createFirebaseCopyCopy] action in Button-Login widget.
  String? loginFirebaseOutput;
  // Stores action output result for [Backend Call - API (authenAPINew)] action in Button-Login widget.
  ApiCallResponse? authenOutput;
  // Stores action output result for [Custom Action - createFirebase] action in Button-Login widget.
  String? createFirebaseOutput;
  AudioRecorder? audioRecorder;
  String? wowRecord1;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
