import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'information_costomer_pending_widget.dart'
    show InformationCostomerPendingWidget;
import 'package:flutter/material.dart';

class InformationCostomerPendingModel
    extends FlutterFlowModel<InformationCostomerPendingWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
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
  // State field(s) for DropDownlocation widget.
  String? dropDownlocationValue;
  FormFieldController<String>? dropDownlocationValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - isInternetConnected] action in Button widget.
  bool? internetUploadOutput;
  bool isDataUploading_uploadData49b = false;
  FFUploadedFile uploadedLocalFile_uploadData49b =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData49b = '';

  // Stores action output result for [Custom Action - locationPermission] action in Button widget.
  bool? locationPermissionOutput;
  // Stores action output result for [Custom Action - isInternetConnected] action in Button widget.
  bool? internetOutput;
  // Stores action output result for [Backend Call - API (SavePinpointAPI)] action in Button widget.
  ApiCallResponse? savePinpointAPIOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
