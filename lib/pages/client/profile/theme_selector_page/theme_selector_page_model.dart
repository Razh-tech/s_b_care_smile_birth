import '/flutter_flow/flutter_flow_util.dart';
import 'theme_selector_page_widget.dart' show ThemeSelectorPageWidget;
import 'package:flutter/material.dart';

class ThemeSelectorPageModel extends FlutterFlowModel<ThemeSelectorPageWidget> {
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
