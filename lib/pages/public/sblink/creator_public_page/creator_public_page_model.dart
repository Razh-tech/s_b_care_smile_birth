import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creator_public_page_widget.dart' show CreatorPublicPageWidget;
import 'package:flutter/material.dart';

class CreatorPublicPageModel extends FlutterFlowModel<CreatorPublicPageWidget> {
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
