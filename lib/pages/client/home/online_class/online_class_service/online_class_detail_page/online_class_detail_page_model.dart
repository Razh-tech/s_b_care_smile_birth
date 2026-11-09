import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'online_class_detail_page_widget.dart' show OnlineClassDetailPageWidget;
import 'package:flutter/material.dart';

class OnlineClassDetailPageModel
    extends FlutterFlowModel<OnlineClassDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown1 widget.
  String? dropDown1Value;
  FormFieldController<String>? dropDown1ValueController;
  // State field(s) for DropDown2 widget.
  String? dropDown2Value;
  FormFieldController<String>? dropDown2ValueController;
  // State field(s) for DropDown3 widget.
  String? dropDown3Value;
  FormFieldController<String>? dropDown3ValueController;
  // State field(s) for DropDown4 widget.
  String? dropDown4Value;
  FormFieldController<String>? dropDown4ValueController;
  // State field(s) for DropDown5 widget.
  String? dropDown5Value;
  FormFieldController<String>? dropDown5ValueController;
  // State field(s) for DropDown6 widget.
  String? dropDown6Value;
  FormFieldController<String>? dropDown6ValueController;
  // State field(s) for DropDown7 widget.
  String? dropDown7Value;
  FormFieldController<String>? dropDown7ValueController;
  // Stores action output result for [Backend Call - API (Get User Wallet)] action in Button widget.
  ApiCallResponse? balanceResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
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
