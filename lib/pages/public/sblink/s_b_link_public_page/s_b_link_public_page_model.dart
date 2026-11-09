import '/flutter_flow/flutter_flow_util.dart';
import 's_b_link_public_page_widget.dart' show SBLinkPublicPageWidget;
import 'package:flutter/material.dart';

class SBLinkPublicPageModel extends FlutterFlowModel<SBLinkPublicPageWidget> {
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
