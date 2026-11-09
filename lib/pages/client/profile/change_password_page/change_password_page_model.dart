import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_password_page_widget.dart' show ChangePasswordPageWidget;
import 'package:flutter/material.dart';

class ChangePasswordPageModel
    extends FlutterFlowModel<ChangePasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for CurrentPasswordTF widget.
  late FocusNode currentPasswordTFPasswordVisibilityFocusNode;
  FocusNode? currentPasswordTFFocusNode;
  TextEditingController? currentPasswordTFTextController;
  late bool currentPasswordTFVisibility;
  String? Function(BuildContext, String?)?
      currentPasswordTFTextControllerValidator;
  // State field(s) for NewPasswordTF widget.
  late FocusNode newPasswordTFPasswordVisibilityFocusNode;
  FocusNode? newPasswordTFFocusNode;
  TextEditingController? newPasswordTFTextController;
  late bool newPasswordTFVisibility;
  String? Function(BuildContext, String?)? newPasswordTFTextControllerValidator;
  // State field(s) for Re_PasswordTF widget.
  late FocusNode rePasswordTFPasswordVisibilityFocusNode;
  FocusNode? rePasswordTFFocusNode;
  TextEditingController? rePasswordTFTextController;
  late bool rePasswordTFVisibility;
  String? Function(BuildContext, String?)? rePasswordTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Change Password)] action in Button widget.
  ApiCallResponse? changePwResult;
  // Stores action output result for [Backend Call - API (Logout)] action in Button widget.
  ApiCallResponse? logoutResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    currentPasswordTFPasswordVisibilityFocusNode = FocusNode();
    currentPasswordTFVisibility = false;
    newPasswordTFPasswordVisibilityFocusNode = FocusNode();
    newPasswordTFVisibility = false;
    rePasswordTFPasswordVisibilityFocusNode = FocusNode();
    rePasswordTFVisibility = false;
  }

  @override
  void dispose() {
    columnController?.dispose();
    currentPasswordTFFocusNode?.dispose();
    currentPasswordTFTextController?.dispose();
    currentPasswordTFPasswordVisibilityFocusNode.dispose();
    newPasswordTFFocusNode?.dispose();
    newPasswordTFTextController?.dispose();
    newPasswordTFPasswordVisibilityFocusNode.dispose();
    rePasswordTFFocusNode?.dispose();
    rePasswordTFTextController?.dispose();
    rePasswordTFPasswordVisibilityFocusNode.dispose();
  }
}
