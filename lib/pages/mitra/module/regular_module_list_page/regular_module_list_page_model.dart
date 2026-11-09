import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'regular_module_list_page_widget.dart' show RegularModuleListPageWidget;
import 'package:flutter/material.dart';

class RegularModuleListPageModel
    extends FlutterFlowModel<RegularModuleListPageWidget> {
  ///  Local state fields for this page.

  bool isModuleFullList = true;

  String? searchKeyword;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldSearch widget.
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchTextControllerValidator;
  List<String> simpleSearchResults = [];
  Completer<ApiCallResponse>? apiRequestCompleter1;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    textFieldSearchFocusNode?.dispose();
    textFieldSearchTextController?.dispose();

    columnController1?.dispose();
    columnController2?.dispose();
  }

  /// Additional helper methods.
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
}
