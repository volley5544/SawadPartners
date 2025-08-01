import '/backend/api_requests/api_calls.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_customer_page_widget.dart' show SearchCustomerPageWidget;
import 'package:flutter/material.dart';

class SearchCustomerPageModel
    extends FlutterFlowModel<SearchCustomerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - isInternetConnected] action in searchCustomerPage widget.
  bool? internetConnectOutput;
  // Stores action output result for [Backend Call - API (ShowPinpointAPI)] action in searchCustomerPage widget.
  ApiCallResponse? pinpointAPIOutput;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
