import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'schedule_setting_page_model.dart';
export 'schedule_setting_page_model.dart';

class ScheduleSettingPageWidget extends StatefulWidget {
  const ScheduleSettingPageWidget({
    super.key,
    required this.uidCampaign,
    required this.nameProgramClass,
  });

  final String? uidCampaign;
  final String? nameProgramClass;

  static String routeName = 'ScheduleSettingPage';
  static String routePath = 'provider/service/schedule-setting';

  @override
  State<ScheduleSettingPageWidget> createState() =>
      _ScheduleSettingPageWidgetState();
}

class _ScheduleSettingPageWidgetState extends State<ScheduleSettingPageWidget>
    with TickerProviderStateMixin {
  late ScheduleSettingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleSettingPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 7,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
            ..complete(GetServiceDetailsMitraCall.call(
              token: FFAppState().token,
              uuidCampaign: widget.uidCampaign,
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
        final scheduleSettingPageGetServiceDetailsMitraResponse =
            snapshot.data!;

        return Title(
            title: 'Schedule Setting | SBCare - SmileBirth',
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
                      'f3qmjxt4' /* Schedule Setting */,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                isScrollable: true,
                                tabAlignment: TabAlignment.center,
                                labelColor: FlutterFlowTheme.of(context)
                                    .sbcarePrimaryColor,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context)
                                        .sbCareLightColor,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleMediumIsCustom,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                indicatorColor: FlutterFlowTheme.of(context)
                                    .sbcarePrimaryColor,
                                padding: EdgeInsets.all(4.0),
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'd91nvl8c' /* Sunday */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '0yt5ec8d' /* Monday */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'ij3fi7cy' /* Tuesday */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '43huqqpt' /* Wednesday */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '650scotm' /* Thursday */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'rpibvago' /* Friday */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'f5tqswm8' /* Saturday */,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [
                                    () async {},
                                    () async {},
                                    () async {},
                                    () async {},
                                    () async {},
                                    () async {},
                                    () async {}
                                  ][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => SingleChildScrollView(
                                      primary: false,
                                      controller: _model.columnController1,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 20.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.nameProgramClass,
                                                  '-',
                                                ),
                                                maxLines: 2,
                                                minFontSize: 12.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          fontSize: 16.0,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Switch.adaptive(
                                                        value: _model
                                                                .sundayStatusValue ??=
                                                            GetServiceDetailsMitraCall
                                                                    .scheduleStatus(
                                                          scheduleSettingPageGetServiceDetailsMitraResponse
                                                              .jsonBody,
                                                        )!
                                                                .firstOrNull!,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.sundayStatusValue =
                                                                  newValue);
                                                          if (newValue) {
                                                            _model.openSundaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .sundayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  true,
                                                            );

                                                            if ((_model
                                                                    .openSundaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Sunday Schedule is now Open'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted();
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          } else {
                                                            _model.closeSundaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .sundayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  false,
                                                            );

                                                            if ((_model
                                                                    .closeSundaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Sunday Schedule is now Closed'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbcarePrimaryColor,
                                                        activeTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbCareLightColor,
                                                        inactiveTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        inactiveThumbColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'snjil4l0' /* Open Schedule */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 48.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .sbCareLightColor,
                                                  icon: Icon(
                                                    Icons.refresh_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final sundaySchedules =
                                                  GetServiceDetailsMitraCall
                                                          .sundaySubSchedules(
                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];

                                              return RefreshIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                                onRefresh: () async {
                                                  safeSetState(() => _model
                                                          .apiRequestCompleter =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted();
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      sundaySchedules.length,
                                                  itemBuilder: (context,
                                                      sundaySchedulesIndex) {
                                                    final sundaySchedulesItem =
                                                        sundaySchedules[
                                                            sundaySchedulesIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    20.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${getJsonField(
                                                                      sundaySchedulesItem,
                                                                      r'''$..subschedule_time''',
                                                                    ).toString()} Session ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ScheduleSettingUpdatePageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'subscheduleTime':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        sundaySchedulesItem,
                                                                        r'''$..subschedule_time''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStart':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        sundaySchedulesItem,
                                                                        r'''$..subschedule_started''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleEnd':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        sundaySchedulesItem,
                                                                        r'''$..subschedule_end''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStatus':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        sundaySchedulesItem,
                                                                        r'''$..is_subschedule_opened''',
                                                                      ),
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'scheduleDays':
                                                                        serializeParam(
                                                                      'Sunday',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidCampaign':
                                                                        serializeParam(
                                                                      widget
                                                                          .uidCampaign,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidSchedule':
                                                                        serializeParam(
                                                                      GetServiceDetailsMitraCall
                                                                          .sundayUid(
                                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'idSubschedule':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        sundaySchedulesItem,
                                                                        r'''$..id_subschedule''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'pn7u7dgj' /* Current Schedule */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF6C6C6C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${getJsonField(
                                                                                    sundaySchedulesItem,
                                                                                    r'''$..subschedule_time''',
                                                                                  ).toString()} : ${getJsonField(
                                                                                    sundaySchedulesItem,
                                                                                    r'''$..subschedule_started''',
                                                                                  ).toString()} - ${getJsonField(
                                                                                    sundaySchedulesItem,
                                                                                    r'''$..subschedule_end''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Session Status : ${getJsonField(
                                                                            sundaySchedulesItem,
                                                                            r'''$..subschedule_status''',
                                                                          ).toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => SingleChildScrollView(
                                      primary: false,
                                      controller: _model.columnController2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 20.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.nameProgramClass,
                                                  '-',
                                                ),
                                                maxLines: 2,
                                                minFontSize: 12.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Switch.adaptive(
                                                        value: _model
                                                                .mondayStatusValue ??=
                                                            (GetServiceDetailsMitraCall
                                                                    .scheduleStatus(
                                                          scheduleSettingPageGetServiceDetailsMitraResponse
                                                              .jsonBody,
                                                        )!
                                                                .elementAtOrNull(
                                                                    1))!,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.mondayStatusValue =
                                                                  newValue);
                                                          if (newValue) {
                                                            _model.openMondaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .mondayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  true,
                                                            );

                                                            if ((_model
                                                                    .openMondaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Monday Schedule is now Open'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          } else {
                                                            _model.closeMondaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .mondayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  false,
                                                            );

                                                            if ((_model
                                                                    .closeMondaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Monday Schedule is now Closed'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbcarePrimaryColor,
                                                        activeTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbCareLightColor,
                                                        inactiveTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        inactiveThumbColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '64ibw51q' /* Open Schedule */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 48.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .sbCareLightColor,
                                                  icon: Icon(
                                                    Icons.refresh_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final mondaySchedules =
                                                  GetServiceDetailsMitraCall
                                                          .mondaySubSchedules(
                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];

                                              return RefreshIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                                onRefresh: () async {
                                                  safeSetState(() => _model
                                                          .apiRequestCompleter =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted();
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      mondaySchedules.length,
                                                  itemBuilder: (context,
                                                      mondaySchedulesIndex) {
                                                    final mondaySchedulesItem =
                                                        mondaySchedules[
                                                            mondaySchedulesIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    20.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${getJsonField(
                                                                      mondaySchedulesItem,
                                                                      r'''$..subschedule_time''',
                                                                    ).toString()} Session',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ScheduleSettingUpdatePageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'subscheduleTime':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        mondaySchedulesItem,
                                                                        r'''$..subschedule_time''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStart':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        mondaySchedulesItem,
                                                                        r'''$..subschedule_started''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleEnd':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        mondaySchedulesItem,
                                                                        r'''$..subschedule_end''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStatus':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        mondaySchedulesItem,
                                                                        r'''$..is_subschedule_opened''',
                                                                      ),
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'scheduleDays':
                                                                        serializeParam(
                                                                      'Monday',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidCampaign':
                                                                        serializeParam(
                                                                      widget
                                                                          .uidCampaign,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidSchedule':
                                                                        serializeParam(
                                                                      GetServiceDetailsMitraCall
                                                                          .mondayUid(
                                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'idSubschedule':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        mondaySchedulesItem,
                                                                        r'''$..id_subschedule''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '7yt72xid' /* Current Schedule */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF6C6C6C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${getJsonField(
                                                                                    mondaySchedulesItem,
                                                                                    r'''$..subschedule_time''',
                                                                                  ).toString()} : ${getJsonField(
                                                                                    mondaySchedulesItem,
                                                                                    r'''$..subschedule_started''',
                                                                                  ).toString()} - ${getJsonField(
                                                                                    mondaySchedulesItem,
                                                                                    r'''$..subschedule_end''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Session Status : ${getJsonField(
                                                                            mondaySchedulesItem,
                                                                            r'''$..subschedule_status''',
                                                                          ).toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => SingleChildScrollView(
                                      primary: false,
                                      controller: _model.columnController3,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 20.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.nameProgramClass,
                                                  '-',
                                                ),
                                                maxLines: 2,
                                                minFontSize: 12.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Switch.adaptive(
                                                        value: _model
                                                                .tuesdayStatusValue ??=
                                                            (GetServiceDetailsMitraCall
                                                                    .scheduleStatus(
                                                          scheduleSettingPageGetServiceDetailsMitraResponse
                                                              .jsonBody,
                                                        )!
                                                                .elementAtOrNull(
                                                                    2))!,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.tuesdayStatusValue =
                                                                  newValue);
                                                          if (newValue) {
                                                            _model.openTuesdaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .tuesdayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  true,
                                                            );

                                                            if ((_model
                                                                    .openTuesdaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Tuesday Schedule is now Open'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          } else {
                                                            _model.closeTuesdaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .tuesdayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  false,
                                                            );

                                                            if ((_model
                                                                    .closeTuesdaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Tuesday Schedule is now Closed'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbcarePrimaryColor,
                                                        activeTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbCareLightColor,
                                                        inactiveTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        inactiveThumbColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'gpftxuq6' /* Open Schedule */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 48.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .sbCareLightColor,
                                                  icon: Icon(
                                                    Icons.refresh_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final tuesdaySchedules =
                                                  GetServiceDetailsMitraCall
                                                          .tuesdaySubSchedules(
                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];

                                              return RefreshIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                                onRefresh: () async {
                                                  safeSetState(() => _model
                                                          .apiRequestCompleter =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted();
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      tuesdaySchedules.length,
                                                  itemBuilder: (context,
                                                      tuesdaySchedulesIndex) {
                                                    final tuesdaySchedulesItem =
                                                        tuesdaySchedules[
                                                            tuesdaySchedulesIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    20.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${getJsonField(
                                                                      tuesdaySchedulesItem,
                                                                      r'''$..subschedule_time''',
                                                                    ).toString()} Session',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ScheduleSettingUpdatePageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'subscheduleTime':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        tuesdaySchedulesItem,
                                                                        r'''$..subschedule_time''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStart':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        tuesdaySchedulesItem,
                                                                        r'''$..subschedule_started''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleEnd':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        tuesdaySchedulesItem,
                                                                        r'''$..subschedule_end''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStatus':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        tuesdaySchedulesItem,
                                                                        r'''$..is_subschedule_opened''',
                                                                      ),
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'scheduleDays':
                                                                        serializeParam(
                                                                      'Tuesday',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidCampaign':
                                                                        serializeParam(
                                                                      widget
                                                                          .uidCampaign,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidSchedule':
                                                                        serializeParam(
                                                                      GetServiceDetailsMitraCall
                                                                          .tuesdayUid(
                                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'idSubschedule':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        tuesdaySchedulesItem,
                                                                        r'''$..id_subschedule''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'enr3w523' /* Current Schedule */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF6C6C6C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${getJsonField(
                                                                                    tuesdaySchedulesItem,
                                                                                    r'''$..subschedule_time''',
                                                                                  ).toString()} : ${getJsonField(
                                                                                    tuesdaySchedulesItem,
                                                                                    r'''$..subschedule_started''',
                                                                                  ).toString()} - ${getJsonField(
                                                                                    tuesdaySchedulesItem,
                                                                                    r'''$..subschedule_end''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Session Status : ${getJsonField(
                                                                            tuesdaySchedulesItem,
                                                                            r'''$..subschedule_status''',
                                                                          ).toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => SingleChildScrollView(
                                      primary: false,
                                      controller: _model.columnController4,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 20.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.nameProgramClass,
                                                  '-',
                                                ),
                                                maxLines: 2,
                                                minFontSize: 12.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Switch.adaptive(
                                                        value: _model
                                                                .wednesdayStatusValue ??=
                                                            (GetServiceDetailsMitraCall
                                                                    .scheduleStatus(
                                                          scheduleSettingPageGetServiceDetailsMitraResponse
                                                              .jsonBody,
                                                        )!
                                                                .elementAtOrNull(
                                                                    3))!,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.wednesdayStatusValue =
                                                                  newValue);
                                                          if (newValue) {
                                                            _model.openWednesdaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .wednesdayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  true,
                                                            );

                                                            if ((_model
                                                                    .openWednesdaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Wednesday Schedule is now Open'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          } else {
                                                            _model.closeWednesdaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .wednesdayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  false,
                                                            );

                                                            if ((_model
                                                                    .closeWednesdaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Wednesday Schedule is now Closed'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbcarePrimaryColor,
                                                        activeTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbCareLightColor,
                                                        inactiveTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        inactiveThumbColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'klr72ivl' /* Open Schedule */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 48.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .sbCareLightColor,
                                                  icon: Icon(
                                                    Icons.refresh_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final wednesdaySchedules =
                                                  GetServiceDetailsMitraCall
                                                          .wednesdaySubSchedules(
                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];

                                              return RefreshIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                                onRefresh: () async {
                                                  safeSetState(() => _model
                                                          .apiRequestCompleter =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted();
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      wednesdaySchedules.length,
                                                  itemBuilder: (context,
                                                      wednesdaySchedulesIndex) {
                                                    final wednesdaySchedulesItem =
                                                        wednesdaySchedules[
                                                            wednesdaySchedulesIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    20.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${getJsonField(
                                                                      wednesdaySchedulesItem,
                                                                      r'''$..subschedule_time''',
                                                                    ).toString()} Session',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ScheduleSettingUpdatePageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'subscheduleTime':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        wednesdaySchedulesItem,
                                                                        r'''$..subschedule_time''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStart':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        wednesdaySchedulesItem,
                                                                        r'''$..subschedule_started''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleEnd':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        wednesdaySchedulesItem,
                                                                        r'''$..subschedule_end''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStatus':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        wednesdaySchedulesItem,
                                                                        r'''$..is_subschedule_opened''',
                                                                      ),
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'scheduleDays':
                                                                        serializeParam(
                                                                      'Wednesday',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidCampaign':
                                                                        serializeParam(
                                                                      widget
                                                                          .uidCampaign,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidSchedule':
                                                                        serializeParam(
                                                                      GetServiceDetailsMitraCall
                                                                          .wednesdayUid(
                                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'idSubschedule':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        wednesdaySchedulesItem,
                                                                        r'''$..id_subschedule''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'pbb5w16g' /* Current Schedule */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF6C6C6C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${getJsonField(
                                                                                    wednesdaySchedulesItem,
                                                                                    r'''$..subschedule_time''',
                                                                                  ).toString()} : ${getJsonField(
                                                                                    wednesdaySchedulesItem,
                                                                                    r'''$..subschedule_started''',
                                                                                  ).toString()} - ${getJsonField(
                                                                                    wednesdaySchedulesItem,
                                                                                    r'''$..subschedule_end''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Session Status : ${getJsonField(
                                                                            wednesdaySchedulesItem,
                                                                            r'''$..subschedule_status''',
                                                                          ).toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => SingleChildScrollView(
                                      primary: false,
                                      controller: _model.columnController5,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 20.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.nameProgramClass,
                                                  '-',
                                                ),
                                                maxLines: 2,
                                                minFontSize: 12.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Switch.adaptive(
                                                        value: _model
                                                                .thursdayStatusValue ??=
                                                            (GetServiceDetailsMitraCall
                                                                    .scheduleStatus(
                                                          scheduleSettingPageGetServiceDetailsMitraResponse
                                                              .jsonBody,
                                                        )!
                                                                .elementAtOrNull(
                                                                    4))!,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.thursdayStatusValue =
                                                                  newValue);
                                                          if (newValue) {
                                                            _model.openThursdaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .thursdayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  true,
                                                            );

                                                            if ((_model
                                                                    .openThursdaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Thursday Schedule is now Open'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          } else {
                                                            _model.closeThursdaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .thursdayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  false,
                                                            );

                                                            if ((_model
                                                                    .closeThursdaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Thursday Schedule is now Closed'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbcarePrimaryColor,
                                                        activeTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbCareLightColor,
                                                        inactiveTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        inactiveThumbColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '6nknj1u3' /* Open Schedule */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 48.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .sbCareLightColor,
                                                  icon: Icon(
                                                    Icons.refresh_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final thursdaySchedules =
                                                  GetServiceDetailsMitraCall
                                                          .thursdaySubSchedules(
                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];

                                              return RefreshIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                                onRefresh: () async {
                                                  safeSetState(() => _model
                                                          .apiRequestCompleter =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted();
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      thursdaySchedules.length,
                                                  itemBuilder: (context,
                                                      thursdaySchedulesIndex) {
                                                    final thursdaySchedulesItem =
                                                        thursdaySchedules[
                                                            thursdaySchedulesIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    20.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${getJsonField(
                                                                      thursdaySchedulesItem,
                                                                      r'''$..subschedule_time''',
                                                                    ).toString()} Session',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ScheduleSettingUpdatePageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'subscheduleTime':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        thursdaySchedulesItem,
                                                                        r'''$..subschedule_time''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStart':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        thursdaySchedulesItem,
                                                                        r'''$..subschedule_started''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleEnd':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        thursdaySchedulesItem,
                                                                        r'''$..subschedule_end''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStatus':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        thursdaySchedulesItem,
                                                                        r'''$..is_subschedule_opened''',
                                                                      ),
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'scheduleDays':
                                                                        serializeParam(
                                                                      'Thursday',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidCampaign':
                                                                        serializeParam(
                                                                      widget
                                                                          .uidCampaign,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidSchedule':
                                                                        serializeParam(
                                                                      GetServiceDetailsMitraCall
                                                                          .thursdayUid(
                                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'idSubschedule':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        thursdaySchedulesItem,
                                                                        r'''$..id_subschedule''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'cvg40lq5' /* Current Schedule */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF6C6C6C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${getJsonField(
                                                                                    thursdaySchedulesItem,
                                                                                    r'''$..subschedule_time''',
                                                                                  ).toString()} : ${getJsonField(
                                                                                    thursdaySchedulesItem,
                                                                                    r'''$..subschedule_started''',
                                                                                  ).toString()} - ${getJsonField(
                                                                                    thursdaySchedulesItem,
                                                                                    r'''$..subschedule_end''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Session Status : ${getJsonField(
                                                                            thursdaySchedulesItem,
                                                                            r'''$..subschedule_status''',
                                                                          ).toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => SingleChildScrollView(
                                      primary: false,
                                      controller: _model.columnController6,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 20.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.nameProgramClass,
                                                  '-',
                                                ),
                                                maxLines: 2,
                                                minFontSize: 12.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Switch.adaptive(
                                                        value: _model
                                                                .fridayStatusValue ??=
                                                            (GetServiceDetailsMitraCall
                                                                    .scheduleStatus(
                                                          scheduleSettingPageGetServiceDetailsMitraResponse
                                                              .jsonBody,
                                                        )!
                                                                .elementAtOrNull(
                                                                    5))!,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.fridayStatusValue =
                                                                  newValue);
                                                          if (newValue) {
                                                            _model.openFridaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .fridayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  true,
                                                            );

                                                            if ((_model
                                                                    .openFridaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Friday Schedule is now Open'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          } else {
                                                            _model.closeFridaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .fridayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  false,
                                                            );

                                                            if ((_model
                                                                    .closeFridaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Friday Schedule is now Closed'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbcarePrimaryColor,
                                                        activeTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbCareLightColor,
                                                        inactiveTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        inactiveThumbColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'y28wt09m' /* Open Schedule */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 48.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .sbCareLightColor,
                                                  icon: Icon(
                                                    Icons.refresh_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final fridaySchedules =
                                                  GetServiceDetailsMitraCall
                                                          .fridaySubSchedules(
                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];

                                              return RefreshIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                                onRefresh: () async {
                                                  safeSetState(() => _model
                                                          .apiRequestCompleter =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted();
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      fridaySchedules.length,
                                                  itemBuilder: (context,
                                                      fridaySchedulesIndex) {
                                                    final fridaySchedulesItem =
                                                        fridaySchedules[
                                                            fridaySchedulesIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    20.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${getJsonField(
                                                                      fridaySchedulesItem,
                                                                      r'''$..subschedule_time''',
                                                                    ).toString()} Session',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ScheduleSettingUpdatePageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'subscheduleTime':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        fridaySchedulesItem,
                                                                        r'''$..subschedule_time''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStart':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        fridaySchedulesItem,
                                                                        r'''$..subschedule_started''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleEnd':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        fridaySchedulesItem,
                                                                        r'''$..subschedule_end''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStatus':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        fridaySchedulesItem,
                                                                        r'''$..is_subschedule_opened''',
                                                                      ),
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'scheduleDays':
                                                                        serializeParam(
                                                                      'Friday',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidCampaign':
                                                                        serializeParam(
                                                                      widget
                                                                          .uidCampaign,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidSchedule':
                                                                        serializeParam(
                                                                      GetServiceDetailsMitraCall
                                                                          .fridayUid(
                                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'idSubschedule':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        fridaySchedulesItem,
                                                                        r'''$..id_subschedule''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '5mtq26s3' /* Current Schedule */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF6C6C6C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${getJsonField(
                                                                                    fridaySchedulesItem,
                                                                                    r'''$..subschedule_time''',
                                                                                  ).toString()} : ${getJsonField(
                                                                                    fridaySchedulesItem,
                                                                                    r'''$..subschedule_started''',
                                                                                  ).toString()} - ${getJsonField(
                                                                                    fridaySchedulesItem,
                                                                                    r'''$..subschedule_end''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Session Status : ${getJsonField(
                                                                            fridaySchedulesItem,
                                                                            r'''$..subschedule_status''',
                                                                          ).toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => SingleChildScrollView(
                                      primary: false,
                                      controller: _model.columnController7,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 20.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.nameProgramClass,
                                                  '-',
                                                ),
                                                maxLines: 2,
                                                minFontSize: 12.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Switch.adaptive(
                                                        value: _model
                                                                .saturdayStatusValue ??=
                                                            GetServiceDetailsMitraCall
                                                                    .scheduleStatus(
                                                          scheduleSettingPageGetServiceDetailsMitraResponse
                                                              .jsonBody,
                                                        )!
                                                                .lastOrNull!,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.saturdayStatusValue =
                                                                  newValue);
                                                          if (newValue) {
                                                            _model.openSaturdaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .saturdayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  true,
                                                            );

                                                            if ((_model
                                                                    .openSaturdaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Saturday Schedule is now Open'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          } else {
                                                            _model.closeSaturdaySchedule =
                                                                await UpdateScheduleDayStatusCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              uuidCampaign: widget
                                                                  .uidCampaign,
                                                              uuidSchedule:
                                                                  GetServiceDetailsMitraCall
                                                                      .saturdayUid(
                                                                scheduleSettingPageGetServiceDetailsMitraResponse
                                                                    .jsonBody,
                                                              ),
                                                              scheduleStatus:
                                                                  false,
                                                            );

                                                            if ((_model
                                                                    .closeSaturdaySchedule
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Saturday Schedule is now Closed'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          'Something\'s wrong! Try it again later'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbcarePrimaryColor,
                                                        activeTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .sbCareLightColor,
                                                        inactiveTrackColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        inactiveThumbColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1jy0jc14' /* Open Schedule */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 48.0,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .sbCareLightColor,
                                                  icon: Icon(
                                                    Icons.refresh_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final saturdaySchedules =
                                                  GetServiceDetailsMitraCall
                                                          .saturdaySubSchedules(
                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];

                                              return RefreshIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                                onRefresh: () async {
                                                  safeSetState(() => _model
                                                          .apiRequestCompleter =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted();
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      saturdaySchedules.length,
                                                  itemBuilder: (context,
                                                      saturdaySchedulesIndex) {
                                                    final saturdaySchedulesItem =
                                                        saturdaySchedules[
                                                            saturdaySchedulesIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    20.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${getJsonField(
                                                                      saturdaySchedulesItem,
                                                                      r'''$..subschedule_time''',
                                                                    ).toString()} Session',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ScheduleSettingUpdatePageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'subscheduleTime':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        saturdaySchedulesItem,
                                                                        r'''$..subschedule_time''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStart':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        saturdaySchedulesItem,
                                                                        r'''$..subschedule_started''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleEnd':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        saturdaySchedulesItem,
                                                                        r'''$..subschedule_end''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'subscheduleStatus':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        saturdaySchedulesItem,
                                                                        r'''$..is_subschedule_opened''',
                                                                      ),
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'scheduleDays':
                                                                        serializeParam(
                                                                      'Saturday',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidCampaign':
                                                                        serializeParam(
                                                                      widget
                                                                          .uidCampaign,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'uidSchedule':
                                                                        serializeParam(
                                                                      GetServiceDetailsMitraCall
                                                                          .saturdayUid(
                                                                        scheduleSettingPageGetServiceDetailsMitraResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'idSubschedule':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        saturdaySchedulesItem,
                                                                        r'''$..id_subschedule''',
                                                                      ),
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'k6ywzr9z' /* Current Schedule */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF6C6C6C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${getJsonField(
                                                                                    saturdaySchedulesItem,
                                                                                    r'''$..subschedule_time''',
                                                                                  ).toString()} : ${getJsonField(
                                                                                    saturdaySchedulesItem,
                                                                                    r'''$..subschedule_started''',
                                                                                  ).toString()} - ${getJsonField(
                                                                                    saturdaySchedulesItem,
                                                                                    r'''$..subschedule_end''',
                                                                                  ).toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Session Status : ${getJsonField(
                                                                            saturdaySchedulesItem,
                                                                            r'''$..subschedule_status''',
                                                                          ).toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
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
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
