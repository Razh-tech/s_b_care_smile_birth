import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'schedule_setting_page_widget.dart' show ScheduleSettingPageWidget;
import 'package:flutter/material.dart';

class ScheduleSettingPageModel
    extends FlutterFlowModel<ScheduleSettingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for SundayStatus widget.
  bool? sundayStatusValue;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in SundayStatus widget.
  ApiCallResponse? openSundaySchedule;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in SundayStatus widget.
  ApiCallResponse? closeSundaySchedule;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for MondayStatus widget.
  bool? mondayStatusValue;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in MondayStatus widget.
  ApiCallResponse? openMondaySchedule;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in MondayStatus widget.
  ApiCallResponse? closeMondaySchedule;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for TuesdayStatus widget.
  bool? tuesdayStatusValue;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in TuesdayStatus widget.
  ApiCallResponse? openTuesdaySchedule;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in TuesdayStatus widget.
  ApiCallResponse? closeTuesdaySchedule;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for WednesdayStatus widget.
  bool? wednesdayStatusValue;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in WednesdayStatus widget.
  ApiCallResponse? openWednesdaySchedule;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in WednesdayStatus widget.
  ApiCallResponse? closeWednesdaySchedule;
  // State field(s) for Column widget.
  ScrollController? columnController5;
  // State field(s) for ThursdayStatus widget.
  bool? thursdayStatusValue;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in ThursdayStatus widget.
  ApiCallResponse? openThursdaySchedule;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in ThursdayStatus widget.
  ApiCallResponse? closeThursdaySchedule;
  // State field(s) for Column widget.
  ScrollController? columnController6;
  // State field(s) for FridayStatus widget.
  bool? fridayStatusValue;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in FridayStatus widget.
  ApiCallResponse? openFridaySchedule;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in FridayStatus widget.
  ApiCallResponse? closeFridaySchedule;
  // State field(s) for Column widget.
  ScrollController? columnController7;
  // State field(s) for SaturdayStatus widget.
  bool? saturdayStatusValue;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in SaturdayStatus widget.
  ApiCallResponse? openSaturdaySchedule;
  // Stores action output result for [Backend Call - API (Update Schedule Day Status)] action in SaturdayStatus widget.
  ApiCallResponse? closeSaturdaySchedule;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    columnController5 = ScrollController();
    columnController6 = ScrollController();
    columnController7 = ScrollController();
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    columnController5?.dispose();
    columnController6?.dispose();
    columnController7?.dispose();
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
