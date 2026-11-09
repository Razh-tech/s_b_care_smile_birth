import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'product_detail_public_page_widget.dart'
    show ProductDetailPublicPageWidget;
import 'package:flutter/material.dart';

class ProductDetailPublicPageModel
    extends FlutterFlowModel<ProductDetailPublicPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column-Container widget.
  ScrollController? columnContainerScrollController;

  @override
  void initState(BuildContext context) {
    columnContainerScrollController = ScrollController();
  }

  @override
  void dispose() {
    columnContainerScrollController?.dispose();
  }
}
