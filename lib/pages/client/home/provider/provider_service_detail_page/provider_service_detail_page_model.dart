import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'provider_service_detail_page_widget.dart'
    show ProviderServiceDetailPageWidget;
import 'package:flutter/material.dart';

class ProviderServiceDetailPageModel
    extends FlutterFlowModel<ProviderServiceDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown1 widget.
  int? dropDown1Value;
  FormFieldController<int>? dropDown1ValueController;
  // State field(s) for DropDown2 widget.
  int? dropDown2Value;
  FormFieldController<int>? dropDown2ValueController;
  // State field(s) for DropDown3 widget.
  int? dropDown3Value;
  FormFieldController<int>? dropDown3ValueController;
  // State field(s) for DropDown4 widget.
  int? dropDown4Value;
  FormFieldController<int>? dropDown4ValueController;
  // State field(s) for DropDown5 widget.
  int? dropDown5Value;
  FormFieldController<int>? dropDown5ValueController;
  // State field(s) for DropDown6 widget.
  int? dropDown6Value;
  FormFieldController<int>? dropDown6ValueController;
  // State field(s) for DropDown7 widget.
  int? dropDown7Value;
  FormFieldController<int>? dropDown7ValueController;
  // Stores action output result for [Backend Call - API (Get User Wallet)] action in Button widget.
  ApiCallResponse? balanceResult;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
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
