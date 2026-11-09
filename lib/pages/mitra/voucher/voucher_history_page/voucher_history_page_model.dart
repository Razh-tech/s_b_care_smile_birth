import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'voucher_history_page_widget.dart' show VoucherHistoryPageWidget;
import 'package:flutter/material.dart';

class VoucherHistoryPageModel
    extends FlutterFlowModel<VoucherHistoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for Column widget.
  ScrollController? columnController5;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    columnController5 = ScrollController();
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    columnController5?.dispose();
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
