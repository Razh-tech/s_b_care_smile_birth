import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_screen_widget.dart' show ForgotPasswordScreenWidget;
import 'package:flutter/material.dart';

class ForgotPasswordScreenModel
    extends FlutterFlowModel<ForgotPasswordScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailTF widget.
  FocusNode? emailTFFocusNode;
  TextEditingController? emailTFTextController;
  String? Function(BuildContext, String?)? emailTFTextControllerValidator;
  String? _emailTFTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j75bfb72' /* Email is required. */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'm98yekp4' /* Please enter a valid email add... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Request Email Reset Password)] action in Button widget.
  ApiCallResponse? requestEmailResult;

  @override
  void initState(BuildContext context) {
    emailTFTextControllerValidator = _emailTFTextControllerValidator;
  }

  @override
  void dispose() {
    emailTFFocusNode?.dispose();
    emailTFTextController?.dispose();
  }
}
