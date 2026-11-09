import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'article_list_public_page_widget.dart' show ArticleListPublicPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class ArticleListPublicPageModel
    extends FlutterFlowModel<ArticleListPublicPageWidget> {
  ///  Local state fields for this page.

  bool isArticleFullList = true;

  String? searchKeyword;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for SearchArticleTF widget.
  FocusNode? searchArticleTFFocusNode;
  TextEditingController? searchArticleTFTextController;
  String? Function(BuildContext, String?)?
      searchArticleTFTextControllerValidator;
  List<String> simpleSearchResults = [];
  Completer<ApiCallResponse>? apiRequestCompleter1;
  Completer<ApiCallResponse>? apiRequestCompleter2;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    searchArticleTFFocusNode?.dispose();
    searchArticleTFTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
