import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'form_lead_page_model.dart';
export 'form_lead_page_model.dart';

class FormLeadPageWidget extends StatefulWidget {
  const FormLeadPageWidget({super.key});

  static String routeName = 'formLeadPage';
  static String routePath = 'formLeadPage';

  @override
  State<FormLeadPageWidget> createState() => _FormLeadPageWidgetState();
}

class _FormLeadPageWidgetState extends State<FormLeadPageWidget>
    with TickerProviderStateMixin {
  late FormLeadPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormLeadPageModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFFA723),
          automaticallyImplyLeading: false,
          title: Text(
            'ฟอร์มลีด',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).displaySmallIsCustom,
                ),
          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                wrapWithModel(
                  model: _model.webNavModel,
                  updateCallback: () => safeSetState(() {}),
                  child: WebNavWidget(
                    iconOne: Icon(
                      Icons.dashboard_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    iconTwo: Icon(
                      Icons.group,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    iconThree: Icon(
                      Icons.home_work_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    iconFour: Icon(
                      Icons.account_circle,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    colorBgOne: FlutterFlowTheme.of(context).primaryBackground,
                    colorBgTwo:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    colorBgThree:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    colorBgFour:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textOne: FlutterFlowTheme.of(context).primaryText,
                    textTwo: FlutterFlowTheme.of(context).secondaryText,
                    textThree: FlutterFlowTheme.of(context).secondaryText,
                    textFour: FlutterFlowTheme.of(context).secondaryText,
                    iconFive: Icon(
                      Icons.reduce_capacity,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    colorBgFive:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textFive: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
              Expanded(
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FutureBuilder<List<UrlLinkStorageRecord>>(
                    future: queryUrlLinkStorageRecordOnce(
                      queryBuilder: (urlLinkStorageRecord) =>
                          urlLinkStorageRecord.where(
                        'url_name',
                        isEqualTo: 'lead_url',
                      ),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitCircle(
                              color: Color(0xFFDB6415),
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<UrlLinkStorageRecord>
                          webViewUrlLinkStorageRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final webViewUrlLinkStorageRecord =
                          webViewUrlLinkStorageRecordList.isNotEmpty
                              ? webViewUrlLinkStorageRecordList.first
                              : null;

                      return FlutterFlowWebView(
                        content: FFAppState().accessToken == '1234'
                            ? '${webViewUrlLinkStorageRecord?.urlLink}${functions.splitFirstString(FFAppState().agentName, '@')}'
                            : '${webViewUrlLinkStorageRecord?.urlLink}${FFAppState().agentCode}',
                        bypass: true,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        verticalScroll: false,
                        horizontalScroll: false,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
