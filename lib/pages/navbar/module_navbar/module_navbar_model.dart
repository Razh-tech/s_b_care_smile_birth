import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'module_navbar_widget.dart' show ModuleNavbarWidget;
import 'package:flutter/material.dart';

class ModuleNavbarModel extends FlutterFlowModel<ModuleNavbarWidget> {
  ///  Local state fields for this page.

  bool isModuleFullList = true;

  String? searchKeyword;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for SearchElearningTF widget.
  FocusNode? searchElearningTFFocusNode;
  TextEditingController? searchElearningTFTextController;
  String? Function(BuildContext, String?)?
      searchElearningTFTextControllerValidator;
  List<String> simpleSearchResults1 = [];
  Completer<ApiCallResponse>? apiRequestCompleter3;
  Completer<ApiCallResponse>? apiRequestCompleter5;
  // Stores action output result for [Backend Call - API (Get User Wallet)] action in Button widget.
  ApiCallResponse? balanceResult;
  // Stores action output result for [Backend Call - API (Get User Wallet)] action in Button widget.
  ApiCallResponse? balanceResult2;
  // State field(s) for SearchEbookTF widget.
  FocusNode? searchEbookTFFocusNode;
  TextEditingController? searchEbookTFTextController;
  String? Function(BuildContext, String?)? searchEbookTFTextControllerValidator;
  List<String> simpleSearchResults2 = [];
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter4;
  Completer<ApiCallResponse>? apiRequestCompleter1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    searchElearningTFFocusNode?.dispose();
    searchElearningTFTextController?.dispose();

    searchEbookTFFocusNode?.dispose();
    searchEbookTFTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted5({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter5?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

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

  Future waitForApiRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter4?.isCompleted ?? false;
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
