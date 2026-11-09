import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mitra_navbar_widget.dart' show MitraNavbarWidget;
import 'package:flutter/material.dart';

class MitraNavbarModel extends FlutterFlowModel<MitraNavbarWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get User Profile)] action in MitraNavbar widget.
  ApiCallResponse? isMitra;
  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
