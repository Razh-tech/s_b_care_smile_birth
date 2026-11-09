import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registration_screen_widget.dart' show RegistrationScreenWidget;
import 'package:flutter/material.dart';

class RegistrationScreenModel
    extends FlutterFlowModel<RegistrationScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for InputField-Section widget.
  ScrollController? inputFieldSectionScrollController;
  // State field(s) for FullnameTF widget.
  FocusNode? fullnameTFFocusNode;
  TextEditingController? fullnameTFTextController;
  String? Function(BuildContext, String?)? fullnameTFTextControllerValidator;
  String? _fullnameTFTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n0e1a8dh' /* Fullname is required */,
      );
    }

    if (val.length < 4) {
      return FFLocalizations.of(context).getText(
        'a3w7baa6' /* Full name must be at least 4 c... */,
      );
    }

    return null;
  }

  // State field(s) for UsernameTextField widget.
  FocusNode? usernameTextFieldFocusNode;
  TextEditingController? usernameTextFieldTextController;
  String? Function(BuildContext, String?)?
      usernameTextFieldTextControllerValidator;
  String? _usernameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'owjguu9e' /* Username is required */,
      );
    }

    if (val.length < 4) {
      return FFLocalizations.of(context).getText(
        'rm3x72jt' /* Username must be at least 4 ch... */,
      );
    }
    if (val.length > 20) {
      return FFLocalizations.of(context).getText(
        'sgcf5tbg' /* Username must be under 20 char... */,
      );
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'po7kefgm' /* Only letters, without whitespa... */,
      );
    }
    return null;
  }

  // State field(s) for phoneTextField widget.
  FocusNode? phoneTextFieldFocusNode;
  TextEditingController? phoneTextFieldTextController;
  String? Function(BuildContext, String?)?
      phoneTextFieldTextControllerValidator;
  String? _phoneTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1onvin41' /* WhatsApp is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'kpkbe2ht' /* Phone number must be at least ... */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kcbs36tg' /* Email is required. */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'tgmxzctr' /* Please enter a valid email add... */,
      );
    }
    return null;
  }

  // State field(s) for PasswordTextField widget.
  late FocusNode passwordTextFieldPasswordVisibilityFocusNode;
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  String? _passwordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ye710bwu' /* Password is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '09u4hdfs' /* Password must be at least 6 ch... */,
      );
    }
    if (val.length > 64) {
      return FFLocalizations.of(context).getText(
        '3llyjp1m' /* Password must be under 64 char... */,
      );
    }
    if (!RegExp('^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '6i5dush2' /* Password must be at least 6 ch... */,
      );
    }
    return null;
  }

  // State field(s) for RePasswordTextField widget.
  late FocusNode rePasswordTextFieldPasswordVisibilityFocusNode;
  FocusNode? rePasswordTextFieldFocusNode;
  TextEditingController? rePasswordTextFieldTextController;
  late bool rePasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      rePasswordTextFieldTextControllerValidator;
  // State field(s) for EmailCheckbox widget.
  bool? emailCheckboxValue;
  // State field(s) for ToSCheckbox widget.
  bool? toSCheckboxValue;
  // Stores action output result for [Backend Call - API (Register)] action in Button widget.
  ApiCallResponse? registerResponse;

  @override
  void initState(BuildContext context) {
    inputFieldSectionScrollController = ScrollController();
    fullnameTFTextControllerValidator = _fullnameTFTextControllerValidator;
    usernameTextFieldTextControllerValidator =
        _usernameTextFieldTextControllerValidator;
    phoneTextFieldTextControllerValidator =
        _phoneTextFieldTextControllerValidator;
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    passwordTextFieldPasswordVisibilityFocusNode = FocusNode();
    passwordTextFieldVisibility = false;
    passwordTextFieldTextControllerValidator =
        _passwordTextFieldTextControllerValidator;
    rePasswordTextFieldPasswordVisibilityFocusNode = FocusNode();
    rePasswordTextFieldVisibility = false;
  }

  @override
  void dispose() {
    inputFieldSectionScrollController?.dispose();
    fullnameTFFocusNode?.dispose();
    fullnameTFTextController?.dispose();

    usernameTextFieldFocusNode?.dispose();
    usernameTextFieldTextController?.dispose();

    phoneTextFieldFocusNode?.dispose();
    phoneTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();
    passwordTextFieldPasswordVisibilityFocusNode.dispose();
    rePasswordTextFieldFocusNode?.dispose();
    rePasswordTextFieldTextController?.dispose();
    rePasswordTextFieldPasswordVisibilityFocusNode.dispose();
  }
}
