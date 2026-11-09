import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'send_appointment_module_page_widget.dart'
    show SendAppointmentModulePageWidget;
import 'package:flutter/material.dart';

class SendAppointmentModulePageModel
    extends FlutterFlowModel<SendAppointmentModulePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ModulesDD widget.
  String? modulesDDValue;
  FormFieldController<String>? modulesDDValueController;
  // Stores action output result for [Backend Call - API (Send Module Appointment)] action in Button widget.
  ApiCallResponse? sendModuleResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
