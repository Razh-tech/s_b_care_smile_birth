import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'transfer_page_widget.dart' show TransferPageWidget;
import 'package:flutter/material.dart';

class TransferPageModel extends FlutterFlowModel<TransferPageWidget> {
  ///  Local state fields for this page.

  int? currency;

  int? amountTransfer;

  String? transferRecipient;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for AmountTF widget.
  FocusNode? amountTFFocusNode;
  TextEditingController? amountTFTextController;
  String? Function(BuildContext, String?)? amountTFTextControllerValidator;
  // State field(s) for NumberTF widget.
  FocusNode? numberTFFocusNode;
  TextEditingController? numberTFTextController;
  String? Function(BuildContext, String?)? numberTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Get Transfer Recipient Name)] action in NumberTF widget.
  ApiCallResponse? getTransferRecipientName;
  // State field(s) for RecipientNameTF widget.
  FocusNode? recipientNameTFFocusNode;
  TextEditingController? recipientNameTFTextController;
  String? Function(BuildContext, String?)?
      recipientNameTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Transfer SBPay)] action in Button widget.
  ApiCallResponse? transferResult;
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

    numberTFFocusNode?.dispose();
    numberTFTextController?.dispose();

    recipientNameTFFocusNode?.dispose();
    recipientNameTFTextController?.dispose();
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
