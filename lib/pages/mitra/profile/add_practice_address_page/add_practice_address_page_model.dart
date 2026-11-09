import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_practice_address_page_widget.dart'
    show AddPracticeAddressPageWidget;
import 'package:flutter/material.dart';

class AddPracticeAddressPageModel
    extends FlutterFlowModel<AddPracticeAddressPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for DefaultAddress widget.
  bool? defaultAddressValue;
  // State field(s) for StreetAddressTF widget.
  FocusNode? streetAddressTFFocusNode;
  TextEditingController? streetAddressTFTextController;
  String? Function(BuildContext, String?)?
      streetAddressTFTextControllerValidator;
  String? _streetAddressTFTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'grgd189e' /* Street name is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 128) {
      return 'Maximum 128 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for SubdistrictTF widget.
  FocusNode? subdistrictTFFocusNode;
  TextEditingController? subdistrictTFTextController;
  String? Function(BuildContext, String?)? subdistrictTFTextControllerValidator;
  String? _subdistrictTFTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8nwdfmaq' /* Subdistrict is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 64) {
      return 'Maximum 64 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for DistrictTF widget.
  FocusNode? districtTFFocusNode;
  TextEditingController? districtTFTextController;
  String? Function(BuildContext, String?)? districtTFTextControllerValidator;
  String? _districtTFTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hdw42j27' /* District is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 32) {
      return 'Maximum 32 characters allowed, currently ${val.length}.';
    }

    return null;
  }

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
  String? _zipCodeTFTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '16wjxj0h' /* Zip Code is required */,
      );
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 5) {
      return 'Maximum 5 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Add Practice Address)] action in Button widget.
  ApiCallResponse? addResult;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    streetAddressTFTextControllerValidator =
        _streetAddressTFTextControllerValidator;
    subdistrictTFTextControllerValidator =
        _subdistrictTFTextControllerValidator;
    districtTFTextControllerValidator = _districtTFTextControllerValidator;
    zipCodeTFTextControllerValidator = _zipCodeTFTextControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    streetAddressTFFocusNode?.dispose();
    streetAddressTFTextController?.dispose();

    subdistrictTFFocusNode?.dispose();
    subdistrictTFTextController?.dispose();

    districtTFFocusNode?.dispose();
    districtTFTextController?.dispose();

    zipCodeTFFocusNode?.dispose();
    zipCodeTFTextController?.dispose();
  }
}
