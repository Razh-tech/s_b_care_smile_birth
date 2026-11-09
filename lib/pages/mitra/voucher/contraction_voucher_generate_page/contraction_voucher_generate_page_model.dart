import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'contraction_voucher_generate_page_widget.dart'
    show ContractionVoucherGeneratePageWidget;
import 'package:flutter/material.dart';

class ContractionVoucherGeneratePageModel
    extends FlutterFlowModel<ContractionVoucherGeneratePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ContractionDD widget.
  String? contractionDDValue;
  FormFieldController<String>? contractionDDValueController;
  // State field(s) for QuantityTF widget.
  FocusNode? quantityTFFocusNode;
  TextEditingController? quantityTFTextController;
  String? Function(BuildContext, String?)? quantityTFTextControllerValidator;
  // State field(s) for NotesTF widget.
  FocusNode? notesTFFocusNode;
  TextEditingController? notesTFTextController;
  String? Function(BuildContext, String?)? notesTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Generate Contraction Pro Code)] action in Button widget.
  ApiCallResponse? generateCodeResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    quantityTFFocusNode?.dispose();
    quantityTFTextController?.dispose();

    notesTFFocusNode?.dispose();
    notesTFTextController?.dispose();
  }
}
