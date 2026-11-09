import '/flutter_flow/flutter_flow_util.dart';
import 'language_selector_page_widget.dart' show LanguageSelectorPageWidget;
import 'package:flutter/material.dart';

class LanguageSelectorPageModel
    extends FlutterFlowModel<LanguageSelectorPageWidget> {
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
