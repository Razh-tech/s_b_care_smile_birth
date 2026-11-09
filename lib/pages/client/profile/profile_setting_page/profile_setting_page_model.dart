import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_setting_page_widget.dart' show ProfileSettingPageWidget;
import 'package:flutter/material.dart';

class ProfileSettingPageModel
    extends FlutterFlowModel<ProfileSettingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for UsernameTF widget.
  FocusNode? usernameTFFocusNode;
  TextEditingController? usernameTFTextController;
  String? Function(BuildContext, String?)? usernameTFTextControllerValidator;
  // State field(s) for FullnameTF widget.
  FocusNode? fullnameTFFocusNode;
  TextEditingController? fullnameTFTextController;
  String? Function(BuildContext, String?)? fullnameTFTextControllerValidator;
  String? _fullnameTFTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ax0verr1' /* Field is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 64) {
      return 'Maximum 64 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for PhoneTF widget.
  FocusNode? phoneTFFocusNode;
  TextEditingController? phoneTFTextController;
  String? Function(BuildContext, String?)? phoneTFTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for DoBTF widget.
  FocusNode? doBTFFocusNode;
  TextEditingController? doBTFTextController;
  String? Function(BuildContext, String?)? doBTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Update User Profile)] action in Button widget.
  ApiCallResponse? updateResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    fullnameTFTextControllerValidator = _fullnameTFTextControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    usernameTFFocusNode?.dispose();
    usernameTFTextController?.dispose();

    fullnameTFFocusNode?.dispose();
    fullnameTFTextController?.dispose();

    phoneTFFocusNode?.dispose();
    phoneTFTextController?.dispose();

    doBTFFocusNode?.dispose();
    doBTFTextController?.dispose();
  }
}
