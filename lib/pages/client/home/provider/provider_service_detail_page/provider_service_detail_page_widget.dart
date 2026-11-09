import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'provider_service_detail_page_model.dart';
export 'provider_service_detail_page_model.dart';

class ProviderServiceDetailPageWidget extends StatefulWidget {
  const ProviderServiceDetailPageWidget({
    super.key,
    this.uuidCampaign,
  });

  final String? uuidCampaign;

  static String routeName = 'ProviderServiceDetailPage';
  static String routePath = 'provider/service-details';

  @override
  State<ProviderServiceDetailPageWidget> createState() =>
      _ProviderServiceDetailPageWidgetState();
}

class _ProviderServiceDetailPageWidgetState
    extends State<ProviderServiceDetailPageWidget> {
  late ProviderServiceDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProviderServiceDetailPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      future: (_model.apiRequestCompleter2 ??= Completer<ApiCallResponse>()
            ..complete(GetServiceDetailsCall.call(
              token: FFAppState().token,
              uuidCampaign: widget.uuidCampaign,
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
        final providerServiceDetailPageGetServiceDetailsResponse =
            snapshot.data!;

        return Title(
            title: 'Provider Service Details | SBCare - SmileBirth',
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
                      '4k6b6ue4' /* Service Details */,
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
                  child: RefreshIndicator(
                    color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                    onRefresh: () async {
                      await Future.wait([
                        Future(() async {
                          safeSetState(
                              () => _model.apiRequestCompleter2 = null);
                          await _model.waitForApiRequestCompleted2();
                        }),
                        Future(() async {
                          safeSetState(
                              () => _model.apiRequestCompleter1 = null);
                          await _model.waitForApiRequestCompleted1();
                        }),
                      ]);
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: _model.columnController1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SingleChildScrollView(
                            primary: false,
                            controller: _model.columnController2,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: GetServiceDetailsCall
                                                .campaignImage(
                                              providerServiceDetailPageGetServiceDetailsResponse
                                                  .jsonBody,
                                            )!,
                                            fit: BoxFit.scaleDown,
                                            errorWidget:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.jpg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            GetServiceDetailsCall.campaignTitle(
                                              providerServiceDetailPageGetServiceDetailsResponse
                                                  .jsonBody,
                                            ),
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .sbcarePrimaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 20.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'qv2agqxd' /* Description */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  GetServiceDetailsCall
                                                      .infoProgramClass(
                                                    providerServiceDetailPageGetServiceDetailsResponse
                                                        .jsonBody,
                                                  ),
                                                  '-',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]
                                        .divide(SizedBox(height: 2.0))
                                        .around(SizedBox(height: 2.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 20.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'v57e3axm' /* Class Price */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            GetServiceDetailsCall
                                                .formattedPrice(
                                              providerServiceDetailPageGetServiceDetailsResponse
                                                  .jsonBody,
                                            ),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 20.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '06oc9p72' /* Pick Appointment Date */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: InkWell(
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
                                                                .apiRequestCompleter1 =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted1(
                                                                minWait: 500);
                                                        final _datePickedDate =
                                                            await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              getCurrentTimestamp,
                                                          firstDate:
                                                              (getCurrentTimestamp ??
                                                                  DateTime(
                                                                      1900)),
                                                          lastDate: (functions
                                                                  .maxDateRange() ??
                                                              DateTime(2050)),
                                                        );

                                                        if (_datePickedDate !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked =
                                                                DateTime(
                                                              _datePickedDate
                                                                  .year,
                                                              _datePickedDate
                                                                  .month,
                                                              _datePickedDate
                                                                  .day,
                                                            );
                                                          });
                                                        } else if (_model
                                                                .datePicked !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked =
                                                                getCurrentTimestamp;
                                                          });
                                                        }
                                                        await Future.wait([
                                                          Future(() async {
                                                            FFAppState()
                                                                .pickedDate = '';
                                                            FFAppState()
                                                                .idSubschedule = 0;
                                                            FFAppState()
                                                                .pickedDateFunc = '';
                                                            safeSetState(() {});
                                                          }),
                                                          Future(() async {
                                                            safeSetState(() {
                                                              _model
                                                                  .dropDown1ValueController
                                                                  ?.reset();
                                                              _model.dropDown1Value =
                                                                  null;
                                                              _model
                                                                  .dropDown2ValueController
                                                                  ?.reset();
                                                              _model.dropDown2Value =
                                                                  null;
                                                              _model
                                                                  .dropDown3ValueController
                                                                  ?.reset();
                                                              _model.dropDown3Value =
                                                                  null;
                                                              _model
                                                                  .dropDown4ValueController
                                                                  ?.reset();
                                                              _model.dropDown4Value =
                                                                  null;
                                                              _model
                                                                  .dropDown5ValueController
                                                                  ?.reset();
                                                              _model.dropDown5Value =
                                                                  null;
                                                              _model
                                                                  .dropDown6ValueController
                                                                  ?.reset();
                                                              _model.dropDown6Value =
                                                                  null;
                                                              _model
                                                                  .dropDown7ValueController
                                                                  ?.reset();
                                                              _model.dropDown7Value =
                                                                  null;
                                                            });
                                                          }),
                                                          Future(() async {
                                                            safeSetState(() {
                                                              _model
                                                                  .textController
                                                                  ?.clear();
                                                            });
                                                          }),
                                                        ]);
                                                        safeSetState(() {
                                                          _model.textController
                                                                  ?.text =
                                                              '${dateTimeFormat(
                                                            "EEEE",
                                                            _model.datePicked,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )} ${dateTimeFormat(
                                                            "d/M/yyyy",
                                                            _model.datePicked,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}';
                                                        });
                                                        FFAppState()
                                                                .pickedDate =
                                                            dateTimeFormat(
                                                          "y-M-d",
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
                                                        FFAppState()
                                                                .pickedDateFunc =
                                                            dateTimeFormat(
                                                          "dd MM yyyy",
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: 50.0,
                                                        height: 48.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .sbCareLightColor,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .calendar_month_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .sbcarePrimaryColor,
                                                                size: 26.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .none,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    color: Color(
                                                                        0xFFAFAFAF),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelMediumIsCustom,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbCareLightColor,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          if (!isAndroid &&
                                                              !isiOS)
                                                            TextInputFormatter
                                                                .withFunction(
                                                                    (oldValue,
                                                                        newValue) {
                                                              return TextEditingValue(
                                                                selection: newValue
                                                                    .selection,
                                                                text: newValue
                                                                    .text
                                                                    .toCapitalization(
                                                                        TextCapitalization
                                                                            .none),
                                                              );
                                                            }),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter1 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(
                                                      GetAvailableSchedulesCall
                                                          .call(
                                                    token: FFAppState().token,
                                                    uuidCampaign:
                                                        widget.uuidCampaign,
                                                  )))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitDualRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final conditionalBuilderGetAvailableSchedulesResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              if ((_model.textController.text ==
                                                      '${FFLocalizations.of(context).getVariableText(
                                                        enText: 'Sunday',
                                                        idText: 'Minggu',
                                                      )} ${dateTimeFormat(
                                                        "d/M/y",
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}') &&
                                                  ((GetAvailableSchedulesCall
                                                                  .sunday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (GetAvailableSchedulesCall
                                                                  .sunday(
                                                            conditionalBuilderGetAvailableSchedulesResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty) ==
                                                      true)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    int>(
                                                              controller: _model
                                                                      .dropDown1ValueController ??=
                                                                  FormFieldController<
                                                                          int>(
                                                                      null),
                                                              options: List<
                                                                      int>.from(
                                                                  GetAvailableSchedulesCall
                                                                      .idSunday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!),
                                                              optionLabels:
                                                                  GetAvailableSchedulesCall
                                                                          .sunday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!
                                                                      .map((e) =>
                                                                          e.toString())
                                                                      .toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDown1Value =
                                                                        val);
                                                                FFAppState()
                                                                        .idSubschedule =
                                                                    _model
                                                                        .dropDown1Value!;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.8,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'jqb3wnn3' /* Pick schedule */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else if ((_model.textController
                                                          .text ==
                                                      '${FFLocalizations.of(context).getVariableText(
                                                        enText: 'Monday',
                                                        idText: 'Senin',
                                                      )} ${dateTimeFormat(
                                                        "d/M/y",
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}') &&
                                                  ((GetAvailableSchedulesCall
                                                                  .monday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (GetAvailableSchedulesCall
                                                                  .monday(
                                                            conditionalBuilderGetAvailableSchedulesResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty) ==
                                                      true)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          FlutterFlowDropDown<
                                                              int>(
                                                            controller: _model
                                                                    .dropDown2ValueController ??=
                                                                FormFieldController<
                                                                    int>(
                                                              _model.dropDown2Value ??=
                                                                  0,
                                                            ),
                                                            options: List<
                                                                    int>.from(
                                                                GetAvailableSchedulesCall
                                                                    .idMonday(
                                                              conditionalBuilderGetAvailableSchedulesResponse
                                                                  .jsonBody,
                                                            )!),
                                                            optionLabels:
                                                                GetAvailableSchedulesCall
                                                                    .monday(
                                                              conditionalBuilderGetAvailableSchedulesResponse
                                                                  .jsonBody,
                                                            )!,
                                                            onChanged:
                                                                (val) async {
                                                              safeSetState(() =>
                                                                  _model.dropDown2Value =
                                                                      val);
                                                              FFAppState()
                                                                      .idSubschedule =
                                                                  _model
                                                                      .dropDown2Value!;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: 50.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'zhq6iu1r' /* Pick schedule */,
                                                            ),
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            borderWidth: 2.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: true,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else if ((_model.textController
                                                          .text ==
                                                      '${FFLocalizations.of(context).getVariableText(
                                                        enText: 'Tuesday',
                                                        idText: 'Selasa',
                                                      )} ${dateTimeFormat(
                                                        "d/M/y",
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}') &&
                                                  ((GetAvailableSchedulesCall
                                                                  .tuesday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (GetAvailableSchedulesCall
                                                                  .tuesday(
                                                            conditionalBuilderGetAvailableSchedulesResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty) ==
                                                      true)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    int>(
                                                              controller: _model
                                                                      .dropDown3ValueController ??=
                                                                  FormFieldController<
                                                                      int>(
                                                                _model.dropDown3Value ??=
                                                                    0,
                                                              ),
                                                              options: List<
                                                                      int>.from(
                                                                  GetAvailableSchedulesCall
                                                                      .idTuesday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!),
                                                              optionLabels:
                                                                  GetAvailableSchedulesCall
                                                                      .tuesday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!,
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDown3Value =
                                                                        val);
                                                                FFAppState()
                                                                        .idSubschedule =
                                                                    _model
                                                                        .dropDown3Value!;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              width: 90.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '7o8odxjd' /* Pick schedule */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else if ((_model.textController
                                                          .text ==
                                                      '${FFLocalizations.of(context).getVariableText(
                                                        enText: 'Wednesday',
                                                        idText: 'Rabu',
                                                      )} ${dateTimeFormat(
                                                        "d/M/y",
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}') &&
                                                  ((GetAvailableSchedulesCall
                                                                  .wednesday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (GetAvailableSchedulesCall
                                                                  .wednesday(
                                                            conditionalBuilderGetAvailableSchedulesResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty) ==
                                                      true)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    int>(
                                                              controller: _model
                                                                      .dropDown4ValueController ??=
                                                                  FormFieldController<
                                                                      int>(
                                                                _model.dropDown4Value ??=
                                                                    0,
                                                              ),
                                                              options: List<
                                                                      int>.from(
                                                                  GetAvailableSchedulesCall
                                                                      .idWednesday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!),
                                                              optionLabels:
                                                                  GetAvailableSchedulesCall
                                                                      .wednesday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!,
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDown4Value =
                                                                        val);
                                                                FFAppState()
                                                                        .idSubschedule =
                                                                    _model
                                                                        .dropDown4Value!;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              width: 90.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'aoh5916r' /* Pick schedule */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .sbCareLightColor,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else if ((_model.textController
                                                          .text ==
                                                      '${FFLocalizations.of(context).getVariableText(
                                                        enText: 'Thursday',
                                                        idText: 'Kamis',
                                                      )} ${dateTimeFormat(
                                                        "d/M/y",
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}') &&
                                                  ((GetAvailableSchedulesCall
                                                                  .thursday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (GetAvailableSchedulesCall
                                                                  .thursday(
                                                            conditionalBuilderGetAvailableSchedulesResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty) ==
                                                      true)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    int>(
                                                              controller: _model
                                                                      .dropDown5ValueController ??=
                                                                  FormFieldController<
                                                                      int>(
                                                                _model.dropDown5Value ??=
                                                                    0,
                                                              ),
                                                              options: List<
                                                                      int>.from(
                                                                  GetAvailableSchedulesCall
                                                                      .idThursday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!),
                                                              optionLabels:
                                                                  GetAvailableSchedulesCall
                                                                      .thursday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!,
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDown5Value =
                                                                        val);
                                                                FFAppState()
                                                                        .idSubschedule =
                                                                    _model
                                                                        .dropDown5Value!;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              width: 90.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'sqlzu431' /* Pick schedule */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else if ((_model.textController
                                                          .text ==
                                                      '${FFLocalizations.of(context).getVariableText(
                                                        enText: 'Friday',
                                                        idText: 'Jumat',
                                                      )} ${dateTimeFormat(
                                                        "d/M/y",
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}') &&
                                                  ((GetAvailableSchedulesCall
                                                                  .friday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (GetAvailableSchedulesCall
                                                                  .friday(
                                                            conditionalBuilderGetAvailableSchedulesResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty) ==
                                                      true)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    int>(
                                                              controller: _model
                                                                      .dropDown6ValueController ??=
                                                                  FormFieldController<
                                                                      int>(
                                                                _model.dropDown6Value ??=
                                                                    0,
                                                              ),
                                                              options: List<
                                                                      int>.from(
                                                                  GetAvailableSchedulesCall
                                                                      .idFriday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!),
                                                              optionLabels:
                                                                  GetAvailableSchedulesCall
                                                                      .friday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!,
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDown6Value =
                                                                        val);
                                                                FFAppState()
                                                                        .idSubschedule =
                                                                    _model
                                                                        .dropDown6Value!;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              width: 90.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '8rrcyzfc' /* Pick schedule */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else if ((_model.textController
                                                          .text ==
                                                      '${FFLocalizations.of(context).getVariableText(
                                                        enText: 'Saturday',
                                                        idText: 'Sabtu',
                                                      )} ${dateTimeFormat(
                                                        "d/M/y",
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}') &&
                                                  ((GetAvailableSchedulesCall
                                                                  .saturday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (GetAvailableSchedulesCall
                                                                  .saturday(
                                                            conditionalBuilderGetAvailableSchedulesResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty) ==
                                                      true)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    int>(
                                                              controller: _model
                                                                      .dropDown7ValueController ??=
                                                                  FormFieldController<
                                                                      int>(
                                                                _model.dropDown7Value ??=
                                                                    0,
                                                              ),
                                                              options: List<
                                                                      int>.from(
                                                                  GetAvailableSchedulesCall
                                                                      .idSaturday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!),
                                                              optionLabels:
                                                                  GetAvailableSchedulesCall
                                                                      .saturday(
                                                                conditionalBuilderGetAvailableSchedulesResponse
                                                                    .jsonBody,
                                                              )!,
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDown7Value =
                                                                        val);
                                                                FFAppState()
                                                                        .idSubschedule =
                                                                    _model
                                                                        .dropDown7Value!;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              width: 90.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'sn94vc66' /* Pick schedule */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'blqnhanu' /* * Schedule unavailable! Please... */,
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .sbcarePrimaryColor,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 40.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: ((_model.textController
                                                                .text ==
                                                            '') ||
                                                    ((FFAppState()
                                                                .idSubschedule ==
                                                            null) ||
                                                        (FFAppState()
                                                                .idSubschedule ==
                                                            0)))
                                                ? null
                                                : () async {
                                                    _model.balanceResult =
                                                        await UserGroup
                                                            .getUserWalletCall
                                                            .call(
                                                      token: FFAppState().token,
                                                    );

                                                    FFAppState().sbpayBalance =
                                                        UserGroup
                                                            .getUserWalletCall
                                                            .walletBalance(
                                                      (_model.balanceResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().update(() {});
                                                    if (FFAppState()
                                                            .sbpayBalance >=
                                                        GetServiceDetailsCall
                                                            .userClassPrice(
                                                          providerServiceDetailPageGetServiceDetailsResponse
                                                              .jsonBody,
                                                        )!) {
                                                      context.pushNamed(
                                                        AppointmentCheckoutPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'classTitle':
                                                              serializeParam(
                                                            GetServiceDetailsCall
                                                                .campaignTitle(
                                                              providerServiceDetailPageGetServiceDetailsResponse
                                                                  .jsonBody,
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                          'classPrice':
                                                              serializeParam(
                                                            GetServiceDetailsCall
                                                                .formattedPrice(
                                                              providerServiceDetailPageGetServiceDetailsResponse
                                                                  .jsonBody,
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                          'priceInt':
                                                              serializeParam(
                                                            GetServiceDetailsCall
                                                                .userClassPrice(
                                                              providerServiceDetailPageGetServiceDetailsResponse
                                                                  .jsonBody,
                                                            ),
                                                            ParamType.int,
                                                          ),
                                                          'appointmentDate':
                                                              serializeParam(
                                                            FFAppState()
                                                                .pickedDate,
                                                            ParamType.String,
                                                          ),
                                                          'idSubschedule':
                                                              serializeParam(
                                                            FFAppState()
                                                                .idSubschedule,
                                                            ParamType.int,
                                                          ),
                                                          'campaignImage':
                                                              serializeParam(
                                                            GetServiceDetailsCall
                                                                .campaignImage(
                                                              providerServiceDetailPageGetServiceDetailsResponse
                                                                  .jsonBody,
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                          'uidCampaign':
                                                              serializeParam(
                                                            widget
                                                                .uuidCampaign,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                        enText:
                                                                            'SBPay Status',
                                                                        idText:
                                                                            'Status SBPay',
                                                                      )),
                                                                      content: Text(
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                        enText:
                                                                            'Your balance is insufficient',
                                                                        idText:
                                                                            'Saldo Anda tidak mencukupi',
                                                                      )),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text(FFLocalizations.of(context).getVariableText(
                                                                            enText:
                                                                                'Cancel',
                                                                            idText:
                                                                                'Batalkan',
                                                                          )),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Top up'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        context.pushNamed(
                                                          TopupPageWidget
                                                              .routeName,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                            ),
                                                          },
                                                        );
                                                      }
                                                    }

                                                    safeSetState(() {});
                                                  },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '9acovvs4' /* Book an Appointment */,
                                            ),
                                            icon: Icon(
                                              Icons.book_online_outlined,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .sbcarePrimaryColor,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallIsCustom,
                                                  ),
                                              elevation: 1.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .sbCareLightColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
