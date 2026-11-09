import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'provider_list_page_widget.dart' show ProviderListPageWidget;
import 'package:flutter/material.dart';

class ProviderListPageModel extends FlutterFlowModel<ProviderListPageWidget> {
  ///  Local state fields for this page.

  bool isProviderFullList = true;

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
  // Stores action output result for [Backend Call - API (Update Default Provider)] action in Button widget.
  ApiCallResponse? setProviderResult;
  // Stores action output result for [Backend Call - API (Update Default Provider)] action in Button widget.
  ApiCallResponse? setDefaultResult;
  // Stores action output result for [Backend Call - API (Update Default Provider)] action in Button widget.
  ApiCallResponse? resetDefaultProvider;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSearchFocusNode?.dispose();
    textFieldSearchTextController?.dispose();
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
