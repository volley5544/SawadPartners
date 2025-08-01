import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBuildVersion] action in Home widget.
  String? getBuildVersion;
  // Stores action output result for [Custom Action - isInternetConnected] action in Home widget.
  bool? internetOutput;
  // Stores action output result for [Backend Call - API (getLeadAPI)] action in Home widget.
  ApiCallResponse? getLead;
  // Stores action output result for [Backend Call - API (getLeadAPI)] action in Home widget.
  ApiCallResponse? getLead1;
  // Stores action output result for [Backend Call - Read Document] action in Home widget.
  AgentDataRecord? queryAgentData;
  InstantTimer? moveBannerSlide;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for BannerPageView widget.
  PageController? bannerPageViewController;

  int get bannerPageViewCurrentIndex => bannerPageViewController != null &&
          bannerPageViewController!.hasClients &&
          bannerPageViewController!.page != null
      ? bannerPageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    moveBannerSlide?.cancel();
    webNavModel.dispose();
  }
}
