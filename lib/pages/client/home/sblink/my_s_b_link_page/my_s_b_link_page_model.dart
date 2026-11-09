import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_s_b_link_page_widget.dart' show MySBLinkPageWidget;
import 'package:flutter/material.dart';

class MySBLinkPageModel extends FlutterFlowModel<MySBLinkPageWidget> {
  ///  State fields for stateful widgets in this page.

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
