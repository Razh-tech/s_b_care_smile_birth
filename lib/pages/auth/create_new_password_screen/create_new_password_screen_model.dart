import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_new_password_screen_widget.dart'
    show CreateNewPasswordScreenWidget;
import 'package:flutter/material.dart';

class CreateNewPasswordScreenModel
    extends FlutterFlowModel<CreateNewPasswordScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PasswordTF widget.
  late FocusNode passwordTFPasswordVisibilityFocusNode;
  FocusNode? passwordTFFocusNode;
  TextEditingController? passwordTFTextController;
  late bool passwordTFVisibility;
  String? Function(BuildContext, String?)? passwordTFTextControllerValidator;
  String? _passwordTFTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2duhoz26' /* Your new password */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'ps1vwjfl' /* Password must be at least 6 ch... */,
      );
    }
    if (val.length > 64) {
      return FFLocalizations.of(context).getText(
        '71jlp3oe' /* Password must be under 64 char... */,
      );
    }

    return null;
  }

  // State field(s) for RePasswordTF widget.
  late FocusNode rePasswordTFPasswordVisibilityFocusNode;
  FocusNode? rePasswordTFFocusNode;
  TextEditingController? rePasswordTFTextController;
  late bool rePasswordTFVisibility;
  String? Function(BuildContext, String?)? rePasswordTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Reset Password)] action in Button widget.
  ApiCallResponse? resetPasswordResult;

  @override
  void initState(BuildContext context) {
    passwordTFPasswordVisibilityFocusNode = FocusNode();
    passwordTFVisibility = false;
    passwordTFTextControllerValidator = _passwordTFTextControllerValidator;
    rePasswordTFPasswordVisibilityFocusNode = FocusNode();
    rePasswordTFVisibility = false;
  }

  @override
  void dispose() {
    passwordTFFocusNode?.dispose();
    passwordTFTextController?.dispose();
    passwordTFPasswordVisibilityFocusNode.dispose();
    rePasswordTFFocusNode?.dispose();
    rePasswordTFTextController?.dispose();
    rePasswordTFPasswordVisibilityFocusNode.dispose();
  }
}
