import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'appointment_verification_page_widget.dart'
    show AppointmentVerificationPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AppointmentVerificationPageModel
    extends FlutterFlowModel<AppointmentVerificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for CodeTF widget.
  FocusNode? codeTFFocusNode;
  TextEditingController? codeTFTextController;
  String? Function(BuildContext, String?)? codeTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Verify Appointment)] action in Button widget.
  ApiCallResponse? verifyResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    codeTFFocusNode?.dispose();
    codeTFTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
