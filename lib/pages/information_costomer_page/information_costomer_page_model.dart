import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'information_costomer_page_widget.dart'
    show InformationCostomerPageWidget;
import 'package:flutter/material.dart';

class InformationCostomerPageModel
    extends FlutterFlowModel<InformationCostomerPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey4 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'กรุณากรอกจุดสังเกต';
    }

    return null;
  }

  // State field(s) for DropDownlocation widget.
  String? dropDownlocationValue;
  FormFieldController<String>? dropDownlocationValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'กรุณากรอกหมายเหตุ';
    }

    return null;
  }

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - isInternetConnected] action in Button widget.
  bool? internetUploadpic;
  bool isDataUploading_uploadData49c = false;
  FFUploadedFile uploadedLocalFile_uploadData49c =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData49c = '';

  // Stores action output result for [Custom Action - locationPermission] action in Button widget.
  bool? locationPermissionOutput;
  // Stores action output result for [Custom Action - isInternetConnected] action in Button widget.
  bool? internetOutput;
  // Stores action output result for [Backend Call - API (SavePinpointAPI)] action in Button widget.
  ApiCallResponse? savePinpointAPIOutput;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
