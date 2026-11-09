import '/flutter_flow/flutter_flow_util.dart';
import 'content_viewer_page_widget.dart' show ContentViewerPageWidget;
import 'package:flutter/material.dart';

class ContentViewerPageModel extends FlutterFlowModel<ContentViewerPageWidget> {
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
