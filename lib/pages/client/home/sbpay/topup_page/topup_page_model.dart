import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'topup_page_widget.dart' show TopupPageWidget;
import 'package:flutter/material.dart';

class TopupPageModel extends FlutterFlowModel<TopupPageWidget> {
  ///  Local state fields for this page.

  int? currency;

  int? amountTopup;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for BankDD widget.
  String? bankDDValue;
  FormFieldController<String>? bankDDValueController;
  // State field(s) for AmountTF widget.
  FocusNode? amountTFFocusNode;
  TextEditingController? amountTFTextController;
  String? Function(BuildContext, String?)? amountTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Topup SBPay)] action in Button widget.
  ApiCallResponse? topupResult;
  Completer<ApiCallResponse>? apiRequestCompleter;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    amountTFFocusNode?.dispose();
    amountTFTextController?.dispose();
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
