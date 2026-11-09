import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/client/home/appointment/empty_list_appointment_component/empty_list_appointment_component_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'appointment_schedule_page_model.dart';
export 'appointment_schedule_page_model.dart';

class AppointmentSchedulePageWidget extends StatefulWidget {
  const AppointmentSchedulePageWidget({super.key});

  static String routeName = 'AppointmentSchedulePage';
  static String routePath = 'appointment/schedule';

  @override
  State<AppointmentSchedulePageWidget> createState() =>
      _AppointmentSchedulePageWidgetState();
}

class _AppointmentSchedulePageWidgetState
    extends State<AppointmentSchedulePageWidget> with TickerProviderStateMixin {
  late AppointmentSchedulePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentSchedulePageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
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

    return Title(
        title: 'Appointment Schedule | SBCare - SmileBirth',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).sbcarePrimaryColor,
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
                  'tl57o9nl' /* Appointment Schedule */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: (_model
                        .apiRequestCompleter ??= Completer<ApiCallResponse>()
                      ..complete(AppointmentGroup.getListAppointmentCall.call(
                        token: FFAppState().token,
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
                          color:
                              FlutterFlowTheme.of(context).sbcarePrimaryColor,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  final tabBarGetListAppointmentResponse = snapshot.data!;

                  return Column(
                    children: [
                      Align(
                        alignment: Alignment(-1.0, 0),
                        child: TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          labelColor:
                              FlutterFlowTheme.of(context).sbcarePrimaryColor,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).sbCareLightColor,
                          labelStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                          unselectedLabelStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                          indicatorColor:
                              FlutterFlowTheme.of(context).sbcarePrimaryColor,
                          padding: EdgeInsets.all(4.0),
                          tabs: [
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'imb3metd' /* Unverified */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'pzg9gi60' /* On Progress */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'a5qdd9xb' /* Done */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                '3w4rwcnw' /* Expired */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'b39y3k9n' /* All */,
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
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final unverifiedAppointment =
                                        (AppointmentGroup.getListAppointmentCall
                                                    .unverifiedList(
                                                      tabBarGetListAppointmentResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [])
                                            .take(5)
                                            .toList();
                                    if (unverifiedAppointment.isEmpty) {
                                      return Center(
                                        child:
                                            EmptyListAppointmentComponentWidget(),
                                      );
                                    }

                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        safeSetState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          20.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: unverifiedAppointment.length,
                                        itemBuilder: (context,
                                            unverifiedAppointmentIndex) {
                                          final unverifiedAppointmentItem =
                                              unverifiedAppointment[
                                                  unverifiedAppointmentIndex];
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
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
                                                    context.pushNamed(
                                                      AppointmentDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'uuidAppointment':
                                                            serializeParam(
                                                          getJsonField(
                                                            unverifiedAppointmentItem,
                                                            r'''$.uuid_appointment''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 90.0,
                                                            height: 90.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            45.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      getJsonField(
                                                                    unverifiedAppointmentItem,
                                                                    r'''$.provider.avatar''',
                                                                  ).toString(),
                                                                  width: 90.0,
                                                                  height: 90.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  unverifiedAppointmentItem,
                                                                  r'''$.appointment_title''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          32,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    unverifiedAppointmentItem,
                                                                    r'''$.provider.fullname''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0xFFAFAFAF),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbCareLightColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            unverifiedAppointmentItem,
                                                                            r'''$.appointment_days''',
                                                                          ).toString()}, ${getJsonField(
                                                                            unverifiedAppointmentItem,
                                                                            r'''$.appointment_date''',
                                                                          ).toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            unverifiedAppointmentItem,
                                                                            r'''$.appointment_started''',
                                                                          ).toString()} - ${getJsonField(
                                                                            unverifiedAppointmentItem,
                                                                            r'''$.appointment_end''',
                                                                          ).toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final onProgressAppointment =
                                        (AppointmentGroup.getListAppointmentCall
                                                    .onProgressList(
                                                      tabBarGetListAppointmentResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [])
                                            .take(5)
                                            .toList();
                                    if (onProgressAppointment.isEmpty) {
                                      return Center(
                                        child:
                                            EmptyListAppointmentComponentWidget(),
                                      );
                                    }

                                    return RefreshIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
                                      onRefresh: () async {
                                        safeSetState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          20.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: onProgressAppointment.length,
                                        itemBuilder: (context,
                                            onProgressAppointmentIndex) {
                                          final onProgressAppointmentItem =
                                              onProgressAppointment[
                                                  onProgressAppointmentIndex];
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
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
                                                    context.pushNamed(
                                                      AppointmentDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'uuidAppointment':
                                                            serializeParam(
                                                          getJsonField(
                                                            onProgressAppointmentItem,
                                                            r'''$.uuid_appointment''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 90.0,
                                                            height: 90.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            45.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      getJsonField(
                                                                    onProgressAppointmentItem,
                                                                    r'''$.provider.avatar''',
                                                                  ).toString(),
                                                                  width: 90.0,
                                                                  height: 90.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  onProgressAppointmentItem,
                                                                  r'''$.appointment_title''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          32,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    onProgressAppointmentItem,
                                                                    r'''$.provider.fullname''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0xFFAFAFAF),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbCareLightColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            onProgressAppointmentItem,
                                                                            r'''$.appointment_days''',
                                                                          ).toString()}, ${getJsonField(
                                                                            onProgressAppointmentItem,
                                                                            r'''$.appointment_date''',
                                                                          ).toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            onProgressAppointmentItem,
                                                                            r'''$.appointment_started''',
                                                                          ).toString()} - ${getJsonField(
                                                                            onProgressAppointmentItem,
                                                                            r'''$.appointment_end''',
                                                                          ).toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final doneAppointment =
                                        (AppointmentGroup.getListAppointmentCall
                                                    .doneList(
                                                      tabBarGetListAppointmentResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [])
                                            .take(20)
                                            .toList();
                                    if (doneAppointment.isEmpty) {
                                      return Center(
                                        child:
                                            EmptyListAppointmentComponentWidget(),
                                      );
                                    }

                                    return RefreshIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
                                      onRefresh: () async {
                                        safeSetState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          20.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: doneAppointment.length,
                                        itemBuilder:
                                            (context, doneAppointmentIndex) {
                                          final doneAppointmentItem =
                                              doneAppointment[
                                                  doneAppointmentIndex];
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
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
                                                    context.pushNamed(
                                                      AppointmentDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'uuidAppointment':
                                                            serializeParam(
                                                          getJsonField(
                                                            doneAppointmentItem,
                                                            r'''$.uuid_appointment''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 90.0,
                                                            height: 90.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            45.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      getJsonField(
                                                                    doneAppointmentItem,
                                                                    r'''$.provider.avatar''',
                                                                  ).toString(),
                                                                  width: 90.0,
                                                                  height: 90.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  doneAppointmentItem,
                                                                  r'''$.appointment_title''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          32,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    doneAppointmentItem,
                                                                    r'''$.provider.fullname''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0xFFAFAFAF),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbCareLightColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            doneAppointmentItem,
                                                                            r'''$.appointment_days''',
                                                                          ).toString()}, ${getJsonField(
                                                                            doneAppointmentItem,
                                                                            r'''$.appointment_date''',
                                                                          ).toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            doneAppointmentItem,
                                                                            r'''$.appointment_started''',
                                                                          ).toString()} - ${getJsonField(
                                                                            doneAppointmentItem,
                                                                            r'''$.appointment_end''',
                                                                          ).toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final expiredAppointment =
                                        (AppointmentGroup.getListAppointmentCall
                                                    .expiredList(
                                                      tabBarGetListAppointmentResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [])
                                            .take(10)
                                            .toList();
                                    if (expiredAppointment.isEmpty) {
                                      return Center(
                                        child:
                                            EmptyListAppointmentComponentWidget(),
                                      );
                                    }

                                    return RefreshIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
                                      onRefresh: () async {
                                        safeSetState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          20.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: expiredAppointment.length,
                                        itemBuilder:
                                            (context, expiredAppointmentIndex) {
                                          final expiredAppointmentItem =
                                              expiredAppointment[
                                                  expiredAppointmentIndex];
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
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
                                                    context.pushNamed(
                                                      AppointmentDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'uuidAppointment':
                                                            serializeParam(
                                                          getJsonField(
                                                            expiredAppointmentItem,
                                                            r'''$.uuid_appointment''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 90.0,
                                                            height: 90.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            45.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      getJsonField(
                                                                    expiredAppointmentItem,
                                                                    r'''$.provider.avatar''',
                                                                  ).toString(),
                                                                  width: 90.0,
                                                                  height: 90.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  expiredAppointmentItem,
                                                                  r'''$.appointment_title''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          32,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    expiredAppointmentItem,
                                                                    r'''$.provider.fullname''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0xFFAFAFAF),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbCareLightColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            expiredAppointmentItem,
                                                                            r'''$.appointment_days''',
                                                                          ).toString()}, ${getJsonField(
                                                                            expiredAppointmentItem,
                                                                            r'''$.appointment_date''',
                                                                          ).toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            expiredAppointmentItem,
                                                                            r'''$.appointment_started''',
                                                                          ).toString()} - ${getJsonField(
                                                                            expiredAppointmentItem,
                                                                            r'''$.appointment_end''',
                                                                          ).toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final allAppointment =
                                        (AppointmentGroup.getListAppointmentCall
                                                    .appointmentList(
                                                      tabBarGetListAppointmentResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [])
                                            .take(20)
                                            .toList();
                                    if (allAppointment.isEmpty) {
                                      return Center(
                                        child:
                                            EmptyListAppointmentComponentWidget(),
                                      );
                                    }

                                    return RefreshIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
                                      onRefresh: () async {
                                        safeSetState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          20.0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: allAppointment.length,
                                        itemBuilder:
                                            (context, allAppointmentIndex) {
                                          final allAppointmentItem =
                                              allAppointment[
                                                  allAppointmentIndex];
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
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
                                                    context.pushNamed(
                                                      AppointmentDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'uuidAppointment':
                                                            serializeParam(
                                                          getJsonField(
                                                            allAppointmentItem,
                                                            r'''$.uuid_appointment''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 90.0,
                                                            height: 90.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            45.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      getJsonField(
                                                                    allAppointmentItem,
                                                                    r'''$.provider.avatar''',
                                                                  ).toString(),
                                                                  width: 90.0,
                                                                  height: 90.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  allAppointmentItem,
                                                                  r'''$.appointment_title''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          32,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    allAppointmentItem,
                                                                    r'''$.provider.fullname''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0xFFAFAFAF),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbCareLightColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            allAppointmentItem,
                                                                            r'''$.appointment_days''',
                                                                          ).toString()}, ${getJsonField(
                                                                            allAppointmentItem,
                                                                            r'''$.appointment_date''',
                                                                          ).toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            2.0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            allAppointmentItem,
                                                                            r'''$.appointment_started''',
                                                                          ).toString()} - ${getJsonField(
                                                                            allAppointmentItem,
                                                                            r'''$.appointment_end''',
                                                                          ).toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
