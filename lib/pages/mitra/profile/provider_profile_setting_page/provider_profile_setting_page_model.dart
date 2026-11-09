import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'provider_profile_setting_page_widget.dart'
    show ProviderProfileSettingPageWidget;
import 'package:flutter/material.dart';

class ProviderProfileSettingPageModel
    extends FlutterFlowModel<ProviderProfileSettingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Column widget.
  ScrollController? columnController;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // State field(s) for BankDD widget.
  String? bankDDValue;
  FormFieldController<String>? bankDDValueController;
  // State field(s) for BankOwnerTF widget.
  FocusNode? bankOwnerTFFocusNode;
  TextEditingController? bankOwnerTFTextController;
  String? Function(BuildContext, String?)? bankOwnerTFTextControllerValidator;
  String? _bankOwnerTFTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8wvuvsjc' /* Field is required */,
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

  // State field(s) for BankNumberTF widget.
  FocusNode? bankNumberTFFocusNode;
  TextEditingController? bankNumberTFTextController;
  String? Function(BuildContext, String?)? bankNumberTFTextControllerValidator;
  String? _bankNumberTFTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eze279ge' /* Field is required */,
      );
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 16) {
      return 'Maximum 16 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Update User Bank)] action in Button widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (Add User Bank)] action in Button widget.
  ApiCallResponse? createResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    bankOwnerTFTextControllerValidator = _bankOwnerTFTextControllerValidator;
    bankNumberTFTextControllerValidator = _bankNumberTFTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    columnController?.dispose();
    bankOwnerTFFocusNode?.dispose();
    bankOwnerTFTextController?.dispose();

    bankNumberTFFocusNode?.dispose();
    bankNumberTFTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
