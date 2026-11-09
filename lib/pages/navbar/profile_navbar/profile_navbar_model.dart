import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'profile_navbar_widget.dart' show ProfileNavbarWidget;
import 'package:flutter/material.dart';

class ProfileNavbarModel extends FlutterFlowModel<ProfileNavbarWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? profileController;
  // State field(s) for Column widget.
  ScrollController? columnController;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (Logout)] action in Button widget.
  ApiCallResponse? logoutResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    profileController?.finish();
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
