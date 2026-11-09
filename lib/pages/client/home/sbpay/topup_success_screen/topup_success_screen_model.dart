import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'topup_success_screen_widget.dart' show TopupSuccessScreenWidget;
import 'package:flutter/material.dart';

class TopupSuccessScreenModel
    extends FlutterFlowModel<TopupSuccessScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Recent Topup Details)] action in Button widget.
  ApiCallResponse? getRecentTopup;
  // Stores action output result for [Backend Call - API (Get Topup Details)] action in Button widget.
  ApiCallResponse? getTopupDetails;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
