import '/components/loading_sceen/loading_sceen_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'inbox_email_model.dart';
export 'inbox_email_model.dart';

class InboxEmailWidget extends StatefulWidget {
  const InboxEmailWidget({super.key});

  static String routeName = 'inboxEmail';
  static String routePath = 'inboxEmail';

  @override
  State<InboxEmailWidget> createState() => _InboxEmailWidgetState();
}

class _InboxEmailWidgetState extends State<InboxEmailWidget>
    with TickerProviderStateMixin {
  late InboxEmailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InboxEmailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: double.infinity,
                  child: LoadingSceenWidget(),
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      FFAppState().isInSearchCostomerPage = true;
      FFAppState().findCustomerInput = '';
      safeSetState(() {});
      Navigator.pop(context);
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFFA723),
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.goNamed(SearchCustomerPageWidget.routeName);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 24.0,
            ),
          ),
          title: Text(
            'Pending',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                  color: Colors.white,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                ),
          ),
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onFieldSubmitted: (_) async {
                          FFAppState().findCustomerInput =
                              _model.textController.text;
                          safeSetState(() {});
                        },
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: false,
                          labelText: 'ค้นหารายชื่อลูกค้า',
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodySmallIsCustom,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    if (FFAppState().customerNamePending.length > 0)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final listPending =
                                  FFAppState().customerNamePending.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listPending.length,
                                itemBuilder: (context, listPendingIndex) {
                                  final listPendingItem =
                                      listPending[listPendingIndex];
                                  return Visibility(
                                    visible: functions.containsInString(
                                            FFAppState().findCustomerInput,
                                            FFAppState()
                                                .customerNamePending
                                                .elementAtOrNull(
                                                    listPendingIndex))! ||
                                        functions.containsInString(
                                            FFAppState().findCustomerInput,
                                            FFAppState()
                                                .contractPending
                                                .elementAtOrNull(
                                                    listPendingIndex))!,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                                child: Image.asset(
                                                  'assets/images/blank-profile-picture-gc19a78ed8_1280.png',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFAppState()
                                                                  .contractPending
                                                                  .elementAtOrNull(
                                                                      listPendingIndex)!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFAppState()
                                                              .customerNamePending
                                                              .elementAtOrNull(
                                                                  listPendingIndex)!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFAppState()
                                                              .addressPending
                                                              .elementAtOrNull(
                                                                  listPendingIndex)!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    InformationCostomerPendingWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'customerName':
                                                          serializeParam(
                                                        FFAppState()
                                                            .customerNamePending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'thaiID1': serializeParam(
                                                        FFAppState()
                                                            .thaiIDPending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'contract':
                                                          serializeParam(
                                                        FFAppState()
                                                            .contractPending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'address': serializeParam(
                                                        FFAppState()
                                                            .addressPending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'district':
                                                          serializeParam(
                                                        FFAppState()
                                                            .districtPending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'province':
                                                          serializeParam(
                                                        FFAppState()
                                                            .provincePending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'postCode':
                                                          serializeParam(
                                                        FFAppState()
                                                            .postCodePending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'phonenumber':
                                                          serializeParam(
                                                        FFAppState()
                                                            .phoneNumberPending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'carBrand':
                                                          serializeParam(
                                                        FFAppState()
                                                            .carbrandPending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'carColor':
                                                          serializeParam(
                                                        FFAppState()
                                                            .carcolorPending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'refID': serializeParam(
                                                        FFAppState()
                                                            .refIDPending
                                                            .elementAtOrNull(
                                                                listPendingIndex),
                                                        ParamType.String,
                                                      ),
                                                      'indexOfPending':
                                                          serializeParam(
                                                        listPendingIndex,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Color(0xFFFFA723),
                                                  elevation: 1.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
