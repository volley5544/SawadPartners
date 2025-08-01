import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static String routeName = 'Login';
  static String routePath = 'login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

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

    return FutureBuilder<AgentDataRecord>(
      future: AgentDataRecord.getDocumentOnce(FFAppState().agentDataDocRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCircle(
                  color: Color(0xFFDB6415),
                  size: 50.0,
                ),
              ),
            ),
          );
        }

        final loginAgentDataRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              body: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/41.png',
                    ).image,
                  ),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FutureBuilder<List<ApiUrlRecord>>(
                  future: queryApiUrlRecordOnce(
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
                    List<ApiUrlRecord> columnApiUrlRecordList = snapshot.data!;
                    final columnApiUrlRecord = columnApiUrlRecordList.isNotEmpty
                        ? columnApiUrlRecordList.first
                        : null;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.2),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 300.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: TextFormField(
                                                key: ValueKey(
                                                    'emailAddress_n8gw'),
                                                controller: _model
                                                    .emailAddressTextController,
                                                focusNode: _model
                                                    .emailAddressFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Username',
                                                  hintText:
                                                      'Enter your username',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBtnText,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(16.0, 24.0,
                                                              0.0, 24.0),
                                                  prefixIcon: Icon(
                                                    Icons.mail,
                                                    color: Color(0xFFFF8B02),
                                                    size: 24.0,
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                validator: _model
                                                    .emailAddressTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              key: ValueKey('password_7vdu'),
                                              controller:
                                                  _model.passwordTextController,
                                              focusNode:
                                                  _model.passwordFocusNode,
                                              obscureText:
                                                  !_model.passwordVisibility,
                                              decoration: InputDecoration(
                                                labelText: 'password',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                                hintText: 'Enter your password',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 24.0,
                                                            24.0, 24.0),
                                                prefixIcon: Icon(
                                                  Icons.vpn_key,
                                                  color: Color(0xFFFF8B02),
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () => safeSetState(
                                                    () => _model
                                                            .passwordVisibility =
                                                        !_model
                                                            .passwordVisibility,
                                                  ),
                                                  focusNode: FocusNode(
                                                      skipTraversal: true),
                                                  child: Icon(
                                                    _model.passwordVisibility
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: Color(0xFFFF8B02),
                                                    size: 22.0,
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              validator: _model
                                                  .passwordTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.goNamed(
                                                RegisterPageWidget.routeName);
                                          },
                                          child: Text(
                                            'sign up account',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: FutureBuilder<
                                                List<BuildVersionRecord>>(
                                              future:
                                                  queryBuildVersionRecordOnce(
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
                                                        color:
                                                            Color(0xFFDB6415),
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<BuildVersionRecord>
                                                    buttonLoginBuildVersionRecordList =
                                                    snapshot.data!;
                                                final buttonLoginBuildVersionRecord =
                                                    buttonLoginBuildVersionRecordList
                                                            .isNotEmpty
                                                        ? buttonLoginBuildVersionRecordList
                                                            .first
                                                        : null;

                                                return FFButtonWidget(
                                                  key: ValueKey(
                                                      'Button-Login_nb8j'),
                                                  onPressed: () async {
                                                    var _shouldSetState = false;
                                                    _model.getBuildVersion =
                                                        await actions
                                                            .getBuildVersion();
                                                    _shouldSetState = true;
                                                    if (!((_model
                                                                .emailAddressTextController
                                                                .text ==
                                                            'po33511') ||
                                                        (_model.emailAddressTextController
                                                                .text ==
                                                            'po31622'))) {
                                                      if (isAndroid) {
                                                        if (buttonLoginBuildVersionRecord
                                                                ?.androidVersion !=
                                                            _model
                                                                .getBuildVersion) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'กรุณาอัพเดท SAWAD PARTNER เป็นเวอร์ชั่นล่าสุดเพื่อใช้งาน'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      } else {
                                                        if (buttonLoginBuildVersionRecord
                                                                ?.iosVersion !=
                                                            _model
                                                                .getBuildVersion) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'กรุณาอัพเดท SAWAD PARTNER เป็นเวอร์ชั่นล่าสุดเพื่อใช้งาน'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      }
                                                    }
                                                    if (!((_model.emailAddressTextController
                                                                    .text !=
                                                                '') &&
                                                        (_model.passwordTextController
                                                                    .text !=
                                                                ''))) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'กรุณาใส่ Username และ Password',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .gray600,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                    FFAppState().ApiUrlLink =
                                                        columnApiUrlRecord!
                                                            .aPIUrl;
                                                    safeSetState(() {});
                                                    if (loginAgentDataRecord
                                                        .agentCode
                                                        .contains(
                                                            (String username) {
                                                      return ('${username[0]}${username[1]}${username[2]}')
                                                          .toLowerCase();
                                                    }(_model.emailAddressTextController
                                                                .text))) {
                                                      _model.loginFirebaseAgentOutput =
                                                          await actions
                                                              .createFirebaseCopyCopy(
                                                        '${_model.emailAddressTextController.text}@sawadagent.com'
                                                            .toLowerCase(),
                                                        _model
                                                            .passwordTextController
                                                            .text,
                                                      );
                                                      _shouldSetState = true;
                                                      FFAppState().agentData =
                                                          AgentDataModelStruct(
                                                        agentCode:
                                                            loginAgentDataRecord
                                                                .agentCode,
                                                        agentName:
                                                            loginAgentDataRecord
                                                                .agentName,
                                                        agentShortName:
                                                            loginAgentDataRecord
                                                                .agentShortName,
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      _model.loginFirebaseOutput =
                                                          await actions
                                                              .createFirebaseCopyCopy(
                                                        _model
                                                            .emailAddressTextController
                                                            .text,
                                                        _model
                                                            .passwordTextController
                                                            .text,
                                                      );
                                                      _shouldSetState = true;
                                                    }

                                                    if (!((_model
                                                                .loginFirebaseOutput !=
                                                            'Login') &&
                                                        (_model.loginFirebaseAgentOutput !=
                                                            'Login'))) {
                                                      FFAppState().isFromLogin =
                                                          true;
                                                      FFAppState().LoggedIn =
                                                          true;
                                                      FFAppState().agentName =
                                                          _model
                                                              .emailAddressTextController
                                                              .text;
                                                      safeSetState(() {});

                                                      context.goNamed(
                                                          SetPinPageWidget
                                                              .routeName);

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                    _model.authenOutput =
                                                        await AuthenAPINewCall
                                                            .call(
                                                      apiUrl: FFAppState()
                                                          .ApiUrlLink,
                                                      username: _model
                                                          .emailAddressTextController
                                                          .text,
                                                      password: _model
                                                          .passwordTextController
                                                          .text,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.authenOutput
                                                                ?.statusCode ??
                                                            200) !=
                                                        200) {
                                                      if ((_model.authenOutput
                                                                  ?.statusCode ??
                                                              200) ==
                                                          401) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'username หรือ password ผิดกรุณากรอกใหม่'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'พบข้อผิดพลาด (${(_model.authenOutput?.statusCode ?? 200).toString()})'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                    FFAppState().accessToken =
                                                        AuthenAPINewCall
                                                            .accessToken(
                                                      (_model.authenOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().LoggedIn =
                                                        true;
                                                    FFAppState().isFromLogin =
                                                        true;
                                                    FFAppState().agentCode =
                                                        AuthenAPINewCall
                                                            .agentCode(
                                                      (_model.authenOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().profileID =
                                                        AuthenAPINewCall.apiKey(
                                                      (_model.authenOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toString();
                                                    FFAppState().agentName =
                                                        AuthenAPINewCall
                                                            .agentName(
                                                      (_model.authenOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    safeSetState(() {});
                                                    if (AuthenAPINewCall
                                                            .passwordChange(
                                                          (_model.authenOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        'N') {
                                                      context.goNamed(
                                                        ChangePasswordWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'oldPassword':
                                                              serializeParam(
                                                            AuthenAPINewCall
                                                                .currentPassword(
                                                              (_model.authenOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      _model.createFirebaseOutput =
                                                          await actions
                                                              .createFirebase(
                                                        _model
                                                            .emailAddressTextController
                                                            .text,
                                                      );
                                                      _shouldSetState = true;

                                                      context.goNamed(
                                                          SetPinPageWidget
                                                              .routeName);
                                                    }

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  text: 'Login',
                                                  options: FFButtonOptions(
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFF0258FF),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFFF6500),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 2.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await startAudioRecording(
                                  context,
                                  audioRecorder: _model.audioRecorder ??=
                                      AudioRecorder(),
                                );

                                await launchUrl(Uri(
                                  scheme: 'tel',
                                  path: '0945451899',
                                ));
                                await stopAudioRecording(
                                  audioRecorder: _model.audioRecorder,
                                  audioName: 'recordedFileBytes',
                                  onRecordingComplete:
                                      (audioFilePath, audioBytes) {
                                    _model.wowRecord1 = audioFilePath;
                                    _model.recordedFileBytes = audioBytes;
                                  },
                                );

                                safeSetState(() {});
                              },
                              child: Text(
                                'Copyright ©2023.  Srisawad Corporation Plc.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
