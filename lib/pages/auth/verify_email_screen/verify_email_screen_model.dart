import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'verify_email_screen_widget.dart' show VerifyEmailScreenWidget;
import 'package:flutter/material.dart';

class VerifyEmailScreenModel extends FlutterFlowModel<VerifyEmailScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailTF widget.
  FocusNode? emailTFFocusNode;
  TextEditingController? emailTFTextController;
  String? Function(BuildContext, String?)? emailTFTextControllerValidator;
  String? _emailTFTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oln1pbwr' /* Email is required. */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'lr3wlhcf' /* Please enter a valid email add... */,
      );
    }
    return null;
  }

  // State field(s) for VerificationCodeTF widget.
  FocusNode? verificationCodeTFFocusNode;
  TextEditingController? verificationCodeTFTextController;
  String? Function(BuildContext, String?)?
      verificationCodeTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Resend Email Reset Password)] action in Text widget.
  ApiCallResponse? resendEmailResult;
  // Stores action output result for [Backend Call - API (Verify Code Reset Password)] action in Button widget.
  ApiCallResponse? verifyCodeResult;

  @override
  void initState(BuildContext context) {
    emailTFTextControllerValidator = _emailTFTextControllerValidator;
  }

  @override
  void dispose() {
    emailTFFocusNode?.dispose();
    emailTFTextController?.dispose();

    verificationCodeTFFocusNode?.dispose();
    verificationCodeTFTextController?.dispose();
  }
}
