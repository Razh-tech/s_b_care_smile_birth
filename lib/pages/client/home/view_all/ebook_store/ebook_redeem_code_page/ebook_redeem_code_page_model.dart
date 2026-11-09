import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ebook_redeem_code_page_widget.dart' show EbookRedeemCodePageWidget;
import 'package:flutter/material.dart';

class EbookRedeemCodePageModel
    extends FlutterFlowModel<EbookRedeemCodePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CodeTF widget.
  FocusNode? codeTFFocusNode;
  TextEditingController? codeTFTextController;
  String? Function(BuildContext, String?)? codeTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Redeem Ebook)] action in Button widget.
  ApiCallResponse? redeemCode;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    codeTFFocusNode?.dispose();
    codeTFTextController?.dispose();
  }
}
