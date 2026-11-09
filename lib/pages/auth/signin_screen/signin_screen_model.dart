import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signin_screen_widget.dart' show SigninScreenWidget;
import 'package:flutter/material.dart';

class SigninScreenModel extends FlutterFlowModel<SigninScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Container widget.
  ScrollController? containerScrollController1;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode1;
  TextEditingController? emailTextFieldTextController1;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController1Validator;
  // State field(s) for PasswordTextField widget.
  late FocusNode passwordTextFieldPasswordVisibilityFocusNode1;
  FocusNode? passwordTextFieldFocusNode1;
  TextEditingController? passwordTextFieldTextController1;
  late bool passwordTextFieldVisibility1;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextController1Validator;
  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? loginResult;
  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? loginResultFP;
  // State field(s) for Container widget.
  ScrollController? containerScrollController2;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode2;
  TextEditingController? emailTextFieldTextController2;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController2Validator;
  // State field(s) for PasswordTextField widget.
  late FocusNode passwordTextFieldPasswordVisibilityFocusNode2;
  FocusNode? passwordTextFieldFocusNode2;
  TextEditingController? passwordTextFieldTextController2;
  late bool passwordTextFieldVisibility2;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextController2Validator;
  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? loginResult2;
  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? loginResultFP2;

  @override
  void initState(BuildContext context) {
    containerScrollController1 = ScrollController();
    passwordTextFieldPasswordVisibilityFocusNode1 = FocusNode();
    passwordTextFieldVisibility1 = false;
    containerScrollController2 = ScrollController();
    passwordTextFieldPasswordVisibilityFocusNode2 = FocusNode();
    passwordTextFieldVisibility2 = false;
  }

  @override
  void dispose() {
    containerScrollController1?.dispose();
    emailTextFieldFocusNode1?.dispose();
    emailTextFieldTextController1?.dispose();

    passwordTextFieldFocusNode1?.dispose();
    passwordTextFieldTextController1?.dispose();
    passwordTextFieldPasswordVisibilityFocusNode1.dispose();
    containerScrollController2?.dispose();
    emailTextFieldFocusNode2?.dispose();
    emailTextFieldTextController2?.dispose();

    passwordTextFieldFocusNode2?.dispose();
    passwordTextFieldTextController2?.dispose();
    passwordTextFieldPasswordVisibilityFocusNode2.dispose();
  }
}
