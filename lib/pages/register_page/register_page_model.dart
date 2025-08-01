import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'register_page_widget.dart' show RegisterPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPageModel extends FlutterFlowModel<RegisterPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey5 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'กรุณากรอก Email ให้ถูกต้อง';
    }
    return null;
  }

  // State field(s) for NewPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  String? _newPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'password อย่างน้อย 8 ตัว';
    }
    if (val.length > 20) {
      return 'password ไม่เกิน 20 ตัว';
    }

    return null;
  }

  // State field(s) for ConfirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'กรุณาใส่ ชื่อ-นามสกุล';
    }

    return null;
  }

  // State field(s) for ThaiID widget.
  FocusNode? thaiIDFocusNode;
  TextEditingController? thaiIDTextController;
  late MaskTextInputFormatter thaiIDMask;
  String? Function(BuildContext, String?)? thaiIDTextControllerValidator;
  String? _thaiIDTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'กรุณาใส่เลขบัตรประชาชน';
    }

    if (val.length < 13) {
      return 'Requires at least 13 characters.';
    }

    return null;
  }

  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberTextController;
  late MaskTextInputFormatter phonenumberMask;
  String? Function(BuildContext, String?)? phonenumberTextControllerValidator;
  String? _phonenumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'กรุณาใส่เบอร์โทรศัพท์ 10 หลัก';
    }

    if (val.length < 10) {
      return 'กรุณาใส่เบอร์โทรศัพท์ 10 หลัก';
    }

    return null;
  }

  // Stores action output result for [Custom Action - checkThaiID] action in Button-Login widget.
  bool? thaiIDOutput;
  // Stores action output result for [Custom Action - createFirebaseCopy] action in Button-Login widget.
  String? createFirebaseOutput;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    newPasswordVisibility = false;
    newPasswordTextControllerValidator = _newPasswordTextControllerValidator;
    confirmPasswordVisibility = false;
    nameTextControllerValidator = _nameTextControllerValidator;
    thaiIDTextControllerValidator = _thaiIDTextControllerValidator;
    phonenumberTextControllerValidator = _phonenumberTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    thaiIDFocusNode?.dispose();
    thaiIDTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();
  }
}
