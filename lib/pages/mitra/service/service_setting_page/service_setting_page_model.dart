import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'service_setting_page_widget.dart' show ServiceSettingPageWidget;
import 'package:flutter/material.dart';

class ServiceSettingPageModel
    extends FlutterFlowModel<ServiceSettingPageWidget> {
  ///  Local state fields for this page.

  int? currency;

  int? clientLimit;

  String? uidAddress;

  String? campaignAddress;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Service Details Mitra)] action in ServiceSettingPage widget.
  ApiCallResponse? serviceDetailsResult;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for CampaignStatus widget.
  bool? campaignStatusValue;
  // State field(s) for TitleTF widget.
  FocusNode? titleTFFocusNode;
  TextEditingController? titleTFTextController;
  String? Function(BuildContext, String?)? titleTFTextControllerValidator;
  String? _titleTFTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u4fw7v51' /* Field is required */,
      );
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }
    if (val.length > 64) {
      return 'Maximum 64 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for LimitTF widget.
  FocusNode? limitTFFocusNode;
  TextEditingController? limitTFTextController;
  String? Function(BuildContext, String?)? limitTFTextControllerValidator;
  // State field(s) for PriceTF widget.
  FocusNode? priceTFFocusNode;
  TextEditingController? priceTFTextController;
  String? Function(BuildContext, String?)? priceTFTextControllerValidator;
  // State field(s) for TimeZoneDD widget.
  String? timeZoneDDValue;
  FormFieldController<String>? timeZoneDDValueController;
  // State field(s) for CurrentAddressTF widget.
  FocusNode? currentAddressTFFocusNode;
  TextEditingController? currentAddressTFTextController;
  String? Function(BuildContext, String?)?
      currentAddressTFTextControllerValidator;
  // State field(s) for AddressDD widget.
  String? addressDDValue;
  FormFieldController<String>? addressDDValueController;
  // State field(s) for StoryTF widget.
  FocusNode? storyTFFocusNode;
  TextEditingController? storyTFTextController;
  String? Function(BuildContext, String?)? storyTFTextControllerValidator;
  // Stores action output result for [Backend Call - API (Update Service Setting)] action in Button widget.
  ApiCallResponse? updateServiceDetails;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    titleTFTextControllerValidator = _titleTFTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    columnController?.dispose();
    titleTFFocusNode?.dispose();
    titleTFTextController?.dispose();

    limitTFFocusNode?.dispose();
    limitTFTextController?.dispose();

    priceTFFocusNode?.dispose();
    priceTFTextController?.dispose();

    currentAddressTFFocusNode?.dispose();
    currentAddressTFTextController?.dispose();

    storyTFFocusNode?.dispose();
    storyTFTextController?.dispose();
  }
}
