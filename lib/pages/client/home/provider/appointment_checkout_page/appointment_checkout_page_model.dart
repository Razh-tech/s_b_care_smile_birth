import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'appointment_checkout_page_widget.dart'
    show AppointmentCheckoutPageWidget;
import 'package:flutter/material.dart';

class AppointmentCheckoutPageModel
    extends FlutterFlowModel<AppointmentCheckoutPageWidget> {
  ///  Local state fields for this page.
  /// For notification to Supabase & OneSignal
  String? appointmentTimeNotif;

  /// For notification to Supabase & OneSignal
  String? appointmentDateNotif;

  /// For notification to Supabase & OneSignal
  String? appointmentLocationNotif;

  /// For notification to Supabase & OneSignal
  String? serviceNameNotif;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Service Details)] action in AppointmentCheckoutPage widget.
  ApiCallResponse? serviceResult;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Backend Call - API (Create Appointment)] action in Button widget.
  ApiCallResponse? purchaseResult;
  // Stores action output result for [Backend Call - API (Insert Appointment Notification)] action in Button widget.
  ApiCallResponse? notifResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
