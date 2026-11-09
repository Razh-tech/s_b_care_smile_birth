import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'curriculum_vitae_page_widget.dart' show CurriculumVitaePageWidget;
import 'package:flutter/material.dart';

class CurriculumVitaePageModel
    extends FlutterFlowModel<CurriculumVitaePageWidget> {
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
