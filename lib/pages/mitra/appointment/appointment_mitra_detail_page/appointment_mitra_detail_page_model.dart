import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'appointment_mitra_detail_page_widget.dart'
    show AppointmentMitraDetailPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AppointmentMitraDetailPageModel
    extends FlutterFlowModel<AppointmentMitraDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Backend Call - API (Accept Appointment)] action in Button widget.
  ApiCallResponse? acceptResult;
  // Stores action output result for [Backend Call - API (End Appointment)] action in Button widget.
  ApiCallResponse? endResult;
  // Stores action output result for [Backend Call - API (Insert Appointment Done Notification)] action in Button widget.
  ApiCallResponse? notifResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
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
