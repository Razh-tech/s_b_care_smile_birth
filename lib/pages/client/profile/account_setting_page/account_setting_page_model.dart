import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'account_setting_page_widget.dart' show AccountSettingPageWidget;
import 'package:flutter/material.dart';

class AccountSettingPageModel
    extends FlutterFlowModel<AccountSettingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for EmailTF widget.
  FocusNode? emailTFFocusNode;
  TextEditingController? emailTFTextController;
  String? Function(BuildContext, String?)? emailTFTextControllerValidator;
  // State field(s) for PasswordTF widget.
  late FocusNode passwordTFPasswordVisibilityFocusNode;
  FocusNode? passwordTFFocusNode;
  TextEditingController? passwordTFTextController;
  late bool passwordTFVisibility;
  String? Function(BuildContext, String?)? passwordTFTextControllerValidator;
  // State field(s) for Re_PasswordTF widget.
  late FocusNode rePasswordTFPasswordVisibilityFocusNode;
  FocusNode? rePasswordTFFocusNode;
  TextEditingController? rePasswordTFTextController;
  late bool rePasswordTFVisibility;
  String? Function(BuildContext, String?)? rePasswordTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Change Password)] action in Button widget.
  ApiCallResponse? changePwResult;
  // Stores action output result for [Backend Call - API (Delete Account Request)] action in Button widget.
  ApiCallResponse? deleteAccRequest;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    passwordTFPasswordVisibilityFocusNode = FocusNode();
    passwordTFVisibility = false;
    rePasswordTFPasswordVisibilityFocusNode = FocusNode();
    rePasswordTFVisibility = false;
  }

  @override
  void dispose() {
    columnController?.dispose();
    emailTFFocusNode?.dispose();
    emailTFTextController?.dispose();

    passwordTFFocusNode?.dispose();
    passwordTFTextController?.dispose();
    passwordTFPasswordVisibilityFocusNode.dispose();
    rePasswordTFFocusNode?.dispose();
    rePasswordTFTextController?.dispose();
    rePasswordTFPasswordVisibilityFocusNode.dispose();
  }
}
