import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 's_b_pay_voucher_generate_page_widget.dart'
    show SBPayVoucherGeneratePageWidget;
import 'package:flutter/material.dart';

class SBPayVoucherGeneratePageModel
    extends FlutterFlowModel<SBPayVoucherGeneratePageWidget> {
  ///  Local state fields for this page.

  int? currency;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for AmountTF widget.
  FocusNode? amountTFFocusNode;
  TextEditingController? amountTFTextController;
  String? Function(BuildContext, String?)? amountTFTextControllerValidator;
  // State field(s) for QuantityTF widget.
  FocusNode? quantityTFFocusNode;
  TextEditingController? quantityTFTextController;
  String? Function(BuildContext, String?)? quantityTFTextControllerValidator;
  // State field(s) for NotesTF widget.
  FocusNode? notesTFFocusNode;
  TextEditingController? notesTFTextController;
  String? Function(BuildContext, String?)? notesTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Generate SBPay Code)] action in Button widget.
  ApiCallResponse? generateCodeResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    amountTFFocusNode?.dispose();
    amountTFTextController?.dispose();

    quantityTFFocusNode?.dispose();
    quantityTFTextController?.dispose();

    notesTFFocusNode?.dispose();
    notesTFTextController?.dispose();
  }
}
