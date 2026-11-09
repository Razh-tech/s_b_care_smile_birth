import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'service_list_page_widget.dart' show ServiceListPageWidget;
import 'package:flutter/material.dart';

class ServiceListPageModel extends FlutterFlowModel<ServiceListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (Get Address Mitra)] action in IconButton widget.
  ApiCallResponse? getPracticeAddress1;
  // Stores action output result for [Backend Call - API (Get Address Mitra)] action in IconButton widget.
  ApiCallResponse? getPracticeAddress2;
  // Stores action output result for [Backend Call - API (Get Address Mitra)] action in IconButton widget.
  ApiCallResponse? getPracticeAddress;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
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
