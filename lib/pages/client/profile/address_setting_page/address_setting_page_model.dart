import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'address_setting_page_widget.dart' show AddressSettingPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AddressSettingPageModel
    extends FlutterFlowModel<AddressSettingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for StreetAddressTF widget.
  FocusNode? streetAddressTFFocusNode;
  TextEditingController? streetAddressTFTextController;
  String? Function(BuildContext, String?)?
      streetAddressTFTextControllerValidator;
  // State field(s) for SubdistrictTF widget.
  FocusNode? subdistrictTFFocusNode;
  TextEditingController? subdistrictTFTextController;
  String? Function(BuildContext, String?)? subdistrictTFTextControllerValidator;
  // State field(s) for DistrictTF widget.
  FocusNode? districtTFFocusNode;
  TextEditingController? districtTFTextController;
  String? Function(BuildContext, String?)? districtTFTextControllerValidator;
  // State field(s) for CityDD widget.
  String? cityDDValue;
  FormFieldController<String>? cityDDValueController;
  // State field(s) for ProvinceDD widget.
  String? provinceDDValue;
  FormFieldController<String>? provinceDDValueController;
  // State field(s) for ZipCodeTF widget.
  FocusNode? zipCodeTFFocusNode;
  TextEditingController? zipCodeTFTextController;
  String? Function(BuildContext, String?)? zipCodeTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Update Home Address)] action in Button widget.
  ApiCallResponse? updateResult;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    streetAddressTFFocusNode?.dispose();
    streetAddressTFTextController?.dispose();

    subdistrictTFFocusNode?.dispose();
    subdistrictTFTextController?.dispose();

    districtTFFocusNode?.dispose();
    districtTFTextController?.dispose();

    zipCodeTFFocusNode?.dispose();
    zipCodeTFTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
