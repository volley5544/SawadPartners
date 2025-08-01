import '/backend/api_requests/api_calls.dart';
import '/components/loading_sceen/loading_sceen_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_customer_page_model.dart';
export 'search_customer_page_model.dart';

class SearchCustomerPageWidget extends StatefulWidget {
  const SearchCustomerPageWidget({super.key});

  static String routeName = 'searchCustomerPage';
  static String routePath = 'searchCustomerPage';

  @override
  State<SearchCustomerPageWidget> createState() =>
      _SearchCustomerPageWidgetState();
}

class _SearchCustomerPageWidgetState extends State<SearchCustomerPageWidget>
    with TickerProviderStateMixin {
  late SearchCustomerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchCustomerPageModel());

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
      _model.internetConnectOutput = await actions.isInternetConnected();
      if (!_model.internetConnectOutput!) {
        Navigator.pop(context);
        return;
      }
      _model.pinpointAPIOutput = await ShowPinpointAPICall.call(
        apiUrl: FFAppState().ApiUrlLink,
        apiKey: FFAppState().profileID,
        token: FFAppState().accessToken,
      );

      if (FFAppState().accessToken == '1234') {
        Navigator.pop(context);
        return;
      }
      if ((_model.pinpointAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.pinpointAPIOutput?.statusCode ?? 200).toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        Navigator.pop(context);
        return;
      }
      if (ShowPinpointAPICall.statusLayer2(
            (_model.pinpointAPIOutput?.jsonBody ?? ''),
          ) ==
          200) {
        FFAppState().refIDlist = ShowPinpointAPICall.refID(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().Contractlist = ShowPinpointAPICall.contract(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().ThaiID1list = ShowPinpointAPICall.thaiID1(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().CustomerNamelist = ShowPinpointAPICall.costomerName(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().Addresslist = ShowPinpointAPICall.address(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().Districtlist = ShowPinpointAPICall.district(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().Provincelist = ShowPinpointAPICall.province(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().ZipCodelist = ShowPinpointAPICall.zipcode(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().Telephonelist = ShowPinpointAPICall.phone(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().CarBrandlist = ShowPinpointAPICall.carBrand(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().Colorlist = ShowPinpointAPICall.carcolor(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().Surveyorlist = ShowPinpointAPICall.surveyor(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().StatusPinPointlist = ShowPinpointAPICall.statusPinpoint(
          (_model.pinpointAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().callPinpoint = true;
        safeSetState(() {});
        Navigator.pop(context);
      } else {
        if (ShowPinpointAPICall.statusLayer2(
              (_model.pinpointAPIOutput?.jsonBody ?? ''),
            ) ==
            401) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text('ไม่พบรายชื่อลูกค้า'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          Navigator.pop(context);
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content:
                      Text('พบข้อผิดพลาด (${ShowPinpointAPICall.messageLayer2(
                    (_model.pinpointAPIOutput?.jsonBody ?? ''),
                  )})'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          Navigator.pop(context);
        }

        return;
      }
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
          title: Text(
            'ปักหมุด',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                  color: Colors.white,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 15.0, 0.0),
              child: badges.Badge(
                badgeContent: Text(
                  FFAppState().customerNamePending.length.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: Colors.white,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
                showBadge: FFAppState().customerNamePending.length > 0,
                shape: badges.BadgeShape.circle,
                badgeColor: Color(0xFFFF2323),
                elevation: 4.0,
                padding: EdgeInsets.all(8.0),
                position: badges.BadgePosition.topEnd(),
                animationType: badges.BadgeAnimationType.scale,
                toAnimate: true,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(CustomerPendingWidget.routeName);
                    },
                    child: Icon(
                      Icons.pending_actions_sharp,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                      child: Text(
                        (((_model.pinpointAPIOutput?.statusCode ?? 200) ==
                                        200) &&
                                    (ShowPinpointAPICall.statusLayer2(
                                          (_model.pinpointAPIOutput?.jsonBody ??
                                              ''),
                                        ) ==
                                        200)) ||
                                FFAppState().callPinpoint
                            ? 'รายชื่อลูกค้า  ${functions.containsInStringCopy(_model.textController.text, FFAppState().CustomerNamelist.toList()).toString() != '0' ? functions.containsInStringCopy(_model.textController.text, FFAppState().CustomerNamelist.toList()).toString() : functions.containsInStringCopy(_model.textController.text, FFAppState().Contractlist.toList()).toString()}  รายการ'
                            : 'ไม่พบข้อมูลรายชื่อลูกค้า',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              color: FlutterFlowTheme.of(context).black600,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodySmallIsCustom,
                            ),
                      ),
                    ),
                    if ((((_model.pinpointAPIOutput?.statusCode ?? 200) ==
                                200) &&
                            (ShowPinpointAPICall.statusLayer2(
                                  (_model.pinpointAPIOutput?.jsonBody ?? ''),
                                ) ==
                                200)) ||
                        FFAppState().callPinpoint)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final listPinpoint =
                                  FFAppState().refIDlist.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listPinpoint.length,
                                itemBuilder: (context, listPinpointIndex) {
                                  final listPinpointItem =
                                      listPinpoint[listPinpointIndex];
                                  return Visibility(
                                    visible: functions.containsInString(
                                            FFAppState().findCustomerInput,
                                            FFAppState()
                                                .CustomerNamelist
                                                .elementAtOrNull(
                                                    listPinpointIndex))! ||
                                        functions.containsInString(
                                            FFAppState().findCustomerInput,
                                            FFAppState()
                                                .Contractlist
                                                .elementAtOrNull(
                                                    listPinpointIndex))!,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FFAppState()
                                                      .StatusPinPointlist
                                                      .elementAtOrNull(
                                                          listPinpointIndex) ==
                                                  '1'
                                              ? Color(0xFFE9FFEA)
                                              : Colors.white,
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
                                                                  .Contractlist
                                                                  .elementAtOrNull(
                                                                      listPinpointIndex)!,
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
                                                              .CustomerNamelist
                                                              .elementAtOrNull(
                                                                  listPinpointIndex)!,
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
                                                              .Addresslist
                                                              .elementAtOrNull(
                                                                  listPinpointIndex)!,
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
                                                  context.goNamed(
                                                    InformationCostomerPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'customerName':
                                                          serializeParam(
                                                        FFAppState()
                                                            .CustomerNamelist
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
                                                      ),
                                                      'thaiID1': serializeParam(
                                                        FFAppState()
                                                            .ThaiID1list
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
                                                      ),
                                                      'contract':
                                                          serializeParam(
                                                        FFAppState()
                                                            .Contractlist
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
                                                      ),
                                                      'address': serializeParam(
                                                        FFAppState()
                                                            .Addresslist
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
                                                      ),
                                                      'district':
                                                          serializeParam(
                                                        FFAppState()
                                                            .Districtlist
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
                                                      ),
                                                      'province':
                                                          serializeParam(
                                                        FFAppState()
                                                            .Provincelist
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
                                                      ),
                                                      'postCode':
                                                          serializeParam(
                                                        FFAppState()
                                                            .ZipCodelist
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
                                                      ),
                                                      'phonenumber':
                                                          serializeParam(
                                                        FFAppState()
                                                            .Telephonelist
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
                                                      ),
                                                      'carBrand':
                                                          serializeParam(
                                                        FFAppState()
                                                            .CarBrandlist
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
                                                      ),
                                                      'carColor':
                                                          serializeParam(
                                                        FFAppState()
                                                            .Colorlist
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
                                                      ),
                                                      'refID': serializeParam(
                                                        FFAppState()
                                                            .refIDlist
                                                            .elementAtOrNull(
                                                                listPinpointIndex),
                                                        ParamType.String,
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
