import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_practice_address_page_model.dart';
export 'edit_practice_address_page_model.dart';

class EditPracticeAddressPageWidget extends StatefulWidget {
  const EditPracticeAddressPageWidget({
    super.key,
    this.uuidUserAddress,
  });

  final String? uuidUserAddress;

  static String routeName = 'EditPracticeAddressPage';
  static String routePath = 'provider/profile/setting/address/edit';

  @override
  State<EditPracticeAddressPageWidget> createState() =>
      _EditPracticeAddressPageWidgetState();
}

class _EditPracticeAddressPageWidgetState
    extends State<EditPracticeAddressPageWidget> {
  late EditPracticeAddressPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPracticeAddressPageModel());

    _model.streetAddressTFFocusNode ??= FocusNode();

    _model.subdistrictTFFocusNode ??= FocusNode();

    _model.districtTFFocusNode ??= FocusNode();

    _model.zipCodeTFFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(GetAddressDetailsMitraCall.call(
              token: FFAppState().token,
              uuidUserAddress: widget.uuidUserAddress,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitDualRing(
                  color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final editPracticeAddressPageGetAddressDetailsMitraResponse =
            snapshot.data!;

        return Title(
            title: 'Edit Practice Address | SBCare - SmileBirth',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                appBar: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).sbcarePrimaryColor,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'b5snz5jj' /* Edit Practice Address */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: !FlutterFlowTheme.of(context)
                              .headlineMediumIsCustom,
                        ),
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 1.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: SingleChildScrollView(
                      controller: _model.columnController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Switch.adaptive(
                                        value: _model.defaultAddressValue ??=
                                            GetAddressDetailsMitraCall
                                                .isDefaultAddress(
                                          editPracticeAddressPageGetAddressDetailsMitraResponse
                                              .jsonBody,
                                        )!,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .defaultAddressValue = newValue);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .sbcarePrimaryColor,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .sbCareLightColor,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'gyx3rs9h' /* Set as Default Address */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'p6ah6gcm' /* Practice Address */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted();
                                                    },
                                                    child: Icon(
                                                      Icons.refresh_outlined,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .sbcarePrimaryColor,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                          .streetAddressTFTextController ??=
                                                      TextEditingController(
                                                    text:
                                                        GetAddressDetailsMitraCall
                                                            .streetName(
                                                      editPracticeAddressPageGetAddressDetailsMitraResponse
                                                          .jsonBody,
                                                    ),
                                                  ),
                                                  focusNode: _model
                                                      .streetAddressTFFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.streetAddressTFTextController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => safeSetState(() {}),
                                                  ),
                                                  autofocus: false,
                                                  autofillHints: [
                                                    AutofillHints
                                                        .streetAddressLine1
                                                  ],
                                                  textCapitalization:
                                                      TextCapitalization.words,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'yhykz1i1' /* Street Name */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFAFAFAF),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumIsCustom,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbCareLightColor,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFED3A61),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    suffixIcon: _model
                                                            .streetAddressTFTextController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .streetAddressTFTextController
                                                                  ?.clear();
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              size: 20.0,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: null,
                                                  keyboardType: TextInputType
                                                      .streetAddress,
                                                  enableInteractiveSelection:
                                                      true,
                                                  validator: _model
                                                      .streetAddressTFTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    if (!isAndroid && !isiOS)
                                                      TextInputFormatter
                                                          .withFunction(
                                                              (oldValue,
                                                                  newValue) {
                                                        return TextEditingValue(
                                                          selection: newValue
                                                              .selection,
                                                          text: newValue.text
                                                              .toCapitalization(
                                                                  TextCapitalization
                                                                      .words),
                                                        );
                                                      }),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                          .subdistrictTFTextController ??=
                                                      TextEditingController(
                                                    text:
                                                        GetAddressDetailsMitraCall
                                                            .subdistrict(
                                                      editPracticeAddressPageGetAddressDetailsMitraResponse
                                                          .jsonBody,
                                                    ),
                                                  ),
                                                  focusNode: _model
                                                      .subdistrictTFFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.subdistrictTFTextController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => safeSetState(() {}),
                                                  ),
                                                  autofocus: false,
                                                  autofillHints: [
                                                    AutofillHints
                                                        .streetAddressLine2
                                                  ],
                                                  textCapitalization:
                                                      TextCapitalization.words,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'w2fpinvr' /* Subdistrict */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFAFAFAF),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumIsCustom,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbCareLightColor,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFED3A61),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    suffixIcon: _model
                                                            .subdistrictTFTextController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .subdistrictTFTextController
                                                                  ?.clear();
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              size: 20.0,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: null,
                                                  enableInteractiveSelection:
                                                      true,
                                                  validator: _model
                                                      .subdistrictTFTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    if (!isAndroid && !isiOS)
                                                      TextInputFormatter
                                                          .withFunction(
                                                              (oldValue,
                                                                  newValue) {
                                                        return TextEditingValue(
                                                          selection: newValue
                                                              .selection,
                                                          text: newValue.text
                                                              .toCapitalization(
                                                                  TextCapitalization
                                                                      .words),
                                                        );
                                                      }),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                          .districtTFTextController ??=
                                                      TextEditingController(
                                                    text:
                                                        GetAddressDetailsMitraCall
                                                            .district(
                                                      editPracticeAddressPageGetAddressDetailsMitraResponse
                                                          .jsonBody,
                                                    ),
                                                  ),
                                                  focusNode: _model
                                                      .districtTFFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.districtTFTextController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => safeSetState(() {}),
                                                  ),
                                                  autofocus: false,
                                                  autofillHints: [
                                                    AutofillHints.addressCity
                                                  ],
                                                  textCapitalization:
                                                      TextCapitalization.words,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'lr6lyh3l' /* District */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFAFAFAF),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumIsCustom,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbCareLightColor,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFED3A61),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    suffixIcon: _model
                                                            .districtTFTextController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .districtTFTextController
                                                                  ?.clear();
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              size: 20.0,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: null,
                                                  enableInteractiveSelection:
                                                      true,
                                                  validator: _model
                                                      .districtTFTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    if (!isAndroid && !isiOS)
                                                      TextInputFormatter
                                                          .withFunction(
                                                              (oldValue,
                                                                  newValue) {
                                                        return TextEditingValue(
                                                          selection: newValue
                                                              .selection,
                                                          text: newValue.text
                                                              .toCapitalization(
                                                                  TextCapitalization
                                                                      .words),
                                                        );
                                                      }),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: GetCitiesCall.call(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitDualRing(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .sbcarePrimaryColor,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final cityDDGetCitiesResponse =
                                                        snapshot.data!;

                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .cityDDValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.cityDDValue ??=
                                                            GetAddressDetailsMitraCall
                                                                .city(
                                                          editPracticeAddressPageGetAddressDetailsMitraResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      options: GetCitiesCall
                                                          .nameCity(
                                                        cityDDGetCitiesResponse
                                                            .jsonBody,
                                                      )!,
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.cityDDValue =
                                                                  val),
                                                      searchHintTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      searchTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText:
                                                          GetAddressDetailsMitraCall
                                                              .city(
                                                        editPracticeAddressPageGetAddressDetailsMitraResponse
                                                            .jsonBody,
                                                      ),
                                                      searchHintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'agsrmchy' /* Search City */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbcarePrimaryColor,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 1.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .sbCareLightColor,
                                                      borderWidth: 1.0,
                                                      borderRadius: 10.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  4.0,
                                                                  10.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: true,
                                                      isMultiSelect: false,
                                                      labelText: '',
                                                      labelTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future:
                                                      GetProvincesCall.call(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitDualRing(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .sbcarePrimaryColor,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final provinceDDGetProvincesResponse =
                                                        snapshot.data!;

                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .provinceDDValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.provinceDDValue ??=
                                                            GetAddressDetailsMitraCall
                                                                .province(
                                                          editPracticeAddressPageGetAddressDetailsMitraResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                      options: GetProvincesCall
                                                          .nameProvince(
                                                        provinceDDGetProvincesResponse
                                                            .jsonBody,
                                                      )!,
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.provinceDDValue =
                                                                  val),
                                                      searchHintTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      searchTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText:
                                                          GetAddressDetailsMitraCall
                                                              .province(
                                                        editPracticeAddressPageGetAddressDetailsMitraResponse
                                                            .jsonBody,
                                                      ),
                                                      searchHintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'b2u4jxj9' /* Search Province */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbcarePrimaryColor,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 1.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .sbCareLightColor,
                                                      borderWidth: 1.0,
                                                      borderRadius: 10.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  4.0,
                                                                  10.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: true,
                                                      isMultiSelect: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 10.0),
                                                child: TextFormField(
                                                  controller: _model
                                                          .zipCodeTFTextController ??=
                                                      TextEditingController(
                                                    text:
                                                        GetAddressDetailsMitraCall
                                                            .zipCode(
                                                      editPracticeAddressPageGetAddressDetailsMitraResponse
                                                          .jsonBody,
                                                    ),
                                                  ),
                                                  focusNode:
                                                      _model.zipCodeTFFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.zipCodeTFTextController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => safeSetState(() {}),
                                                  ),
                                                  autofocus: false,
                                                  autofillHints: [
                                                    AutofillHints.postalCode
                                                  ],
                                                  textCapitalization:
                                                      TextCapitalization.none,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'amku3in9' /* Zip Code */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFAFAFAF),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumIsCustom,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbCareLightColor,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFED3A61),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    suffixIcon: _model
                                                            .zipCodeTFTextController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .zipCodeTFTextController
                                                                  ?.clear();
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              size: 20.0,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: null,
                                                  maxLength: 5,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  buildCounter: (context,
                                                          {required currentLength,
                                                          required isFocused,
                                                          maxLength}) =>
                                                      null,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  enableInteractiveSelection:
                                                      true,
                                                  validator: _model
                                                      .zipCodeTFTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    if (!isAndroid && !isiOS)
                                                      TextInputFormatter
                                                          .withFunction(
                                                              (oldValue,
                                                                  newValue) {
                                                        return TextEditingValue(
                                                          selection: newValue
                                                              .selection,
                                                          text: newValue.text
                                                              .toCapitalization(
                                                                  TextCapitalization
                                                                      .none),
                                                        );
                                                      }),
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp('[0-9]'))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.updateResult =
                                                    await UpdatePracticeAddressCall
                                                        .call(
                                                  token: FFAppState().token,
                                                  uuidUserAddress:
                                                      widget.uuidUserAddress,
                                                  streetAddress: _model
                                                      .streetAddressTFTextController
                                                      .text,
                                                  subdistrictAddress: _model
                                                      .subdistrictTFTextController
                                                      .text,
                                                  districtAddress: _model
                                                      .districtTFTextController
                                                      .text,
                                                  cityAddress:
                                                      _model.cityDDValue,
                                                  countryState:
                                                      _model.provinceDDValue,
                                                  zipPostalsCode: _model
                                                      .zipCodeTFTextController
                                                      .text,
                                                  isDefaultAddress: _model
                                                      .defaultAddressValue,
                                                );

                                                if ((_model.updateResult
                                                        ?.succeeded ??
                                                    true)) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          title: Text(
                                                              'Update Status'),
                                                          content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText:
                                                                'Your practice address has been updated.',
                                                            idText:
                                                                'Alamat praktik Anda sudah tersimpan.',
                                                          )),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  context.safePop();
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          title: Text(
                                                              'Update Status'),
                                                          content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText:
                                                                'Update failed!',
                                                            idText:
                                                                'Update gagal!',
                                                          )),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'b3pzevqv' /* Update Address */,
                                              ),
                                              icon: FaIcon(
                                                FaIconData(const IconData(
                                                    /* edit */ 0xf044,
                                                    fontFamily:
                                                        'FontAwesomeRegular',
                                                    fontPackage:
                                                        'font_awesome_flutter')),
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconAlignment:
                                                    IconAlignment.start,
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText:
                                                                        'WARNING!',
                                                                    idText:
                                                                        'PERINGATAN!',
                                                                  )),
                                                                  content: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                    enText:
                                                                        'Are you sure you want to continue deleting this address?',
                                                                    idText:
                                                                        'Apakah Anda yakin ingin menghapus alamat ini?',
                                                                  )),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                        enText:
                                                                            'Cancel',
                                                                        idText:
                                                                            'Batal',
                                                                      )),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                        enText:
                                                                            'Confirm',
                                                                        idText:
                                                                            'Konfirmasi',
                                                                      )),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    _model.deleteResult =
                                                        await DeletePracticeAddressCall
                                                            .call(
                                                      token: FFAppState().token,
                                                      uuidUserAddress:
                                                          GetAddressDetailsMitraCall
                                                              .uidUserAddress(
                                                        editPracticeAddressPageGetAddressDetailsMitraResponse
                                                            .jsonBody,
                                                      ),
                                                    );

                                                    if ((_model.deleteResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'Address Delete Status',
                                                                idText:
                                                                    'Status Penghapusan Alamat',
                                                              )),
                                                              content: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'Your practice address has been deleted.',
                                                                idText:
                                                                    'Alamat praktik Anda telah dihapus.',
                                                              )),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      context.safePop();
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'Address Delete Status',
                                                                idText:
                                                                    'Status Penghapusan Alamat',
                                                              )),
                                                              content: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'Delete failed!',
                                                                idText:
                                                                    'Penghapusan gagal!',
                                                              )),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ar7nuptd' /* Delete Address */,
                                                ),
                                                icon: Icon(
                                                  Icons.delete_outlined,
                                                  size: 20.0,
                                                ),
                                                options: FFButtonOptions(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .pureRed,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].addToEnd(SizedBox(height: 40.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
