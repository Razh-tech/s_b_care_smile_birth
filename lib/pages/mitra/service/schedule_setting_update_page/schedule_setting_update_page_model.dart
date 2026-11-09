import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'schedule_setting_update_page_widget.dart'
    show ScheduleSettingUpdatePageWidget;
import 'package:flutter/material.dart';

class ScheduleSettingUpdatePageModel
    extends FlutterFlowModel<ScheduleSettingUpdatePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SessionStatus widget.
  bool? sessionStatusValue;
  DateTime? datePicked1;
  // State field(s) for StartTF widget.
  FocusNode? startTFFocusNode;
  TextEditingController? startTFTextController;
  String? Function(BuildContext, String?)? startTFTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for EndTF widget.
  FocusNode? endTFFocusNode;
  TextEditingController? endTFTextController;
  String? Function(BuildContext, String?)? endTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Update Schedule Sessions)] action in Button widget.
  ApiCallResponse? updateScheduleSession;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    startTFFocusNode?.dispose();
    startTFTextController?.dispose();

    endTFFocusNode?.dispose();
    endTFTextController?.dispose();
  }
}
