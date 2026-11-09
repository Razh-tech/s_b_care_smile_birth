import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'manage_product_page_widget.dart' show ManageProductPageWidget;
import 'package:flutter/material.dart';

class ManageProductPageModel extends FlutterFlowModel<ManageProductPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
