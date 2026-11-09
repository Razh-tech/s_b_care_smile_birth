import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/mitra/service/empty_list_filtered_owned_service_component/empty_list_filtered_owned_service_component_widget.dart';
import '/pages/mitra/service/empty_list_owned_service_component/empty_list_owned_service_component_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'service_list_page_model.dart';
export 'service_list_page_model.dart';

class ServiceListPageWidget extends StatefulWidget {
  const ServiceListPageWidget({super.key});

  static String routeName = 'ServiceListPage';
  static String routePath = 'provider/service';

  @override
  State<ServiceListPageWidget> createState() => _ServiceListPageWidgetState();
}

class _ServiceListPageWidgetState extends State<ServiceListPageWidget>
    with TickerProviderStateMixin {
  late ServiceListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceListPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
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
        title: 'My Services | SBCare - SmileBirth',
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
                  'wrlqg172' /* My Services */,
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
                future:
                    (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                          ..complete(GetListServicesMitraCall.call(
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
                  final tabBarGetListServicesMitraResponse = snapshot.data!;

                  return Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
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
                                'mcpmasov' /* Open */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'qdjf9s8l' /* Closed */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                '6hnerrdb' /* Expired */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'tb6ayu68' /* All */,
                              ),
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [
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
                                    final listOpenServices =
                                        GetListServicesMitraCall.openService(
                                              tabBarGetListServicesMitraResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];
                                    if (listOpenServices.isEmpty) {
                                      return Center(
                                        child:
                                            EmptyListFilteredOwnedServiceComponentWidget(),
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
                                      child: ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listOpenServices.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 10.0),
                                        itemBuilder:
                                            (context, listOpenServicesIndex) {
                                          final listOpenServicesItem =
                                              listOpenServices[
                                                  listOpenServicesIndex];
                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 5.0, 0.0, 5.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  width: 0.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                getJsonField(
                                                                              listOpenServicesItem,
                                                                              r'''$.campaign_image''',
                                                                            ).toString(),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorWidget: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpg',
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag:
                                                                              getJsonField(
                                                                            listOpenServicesItem,
                                                                            r'''$.campaign_image''',
                                                                          ).toString(),
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag:
                                                                        getJsonField(
                                                                      listOpenServicesItem,
                                                                      r'''$.campaign_image''',
                                                                    ).toString(),
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            getJsonField(
                                                                          listOpenServicesItem,
                                                                          r'''$.campaign_image''',
                                                                        ).toString(),
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            80.0,
                                                                        fit: BoxFit
                                                                            .scaleDown,
                                                                        errorWidget: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.jpg',
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              80.0,
                                                                          fit: BoxFit
                                                                              .scaleDown,
                                                                        ),
                                                                      ),
                                                                    ),
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
                                                                        10.0,
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
                                                                      .start,
                                                              children: [
                                                                AutoSizeText(
                                                                  getJsonField(
                                                                    listOpenServicesItem,
                                                                    r'''$.campaign_title''',
                                                                  ).toString(),
                                                                  maxLines: 4,
                                                                  minFontSize:
                                                                      12.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          2.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          2.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    0.0,
                                                                buttonSize:
                                                                    48.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .settings_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 30.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model.getPracticeAddress1 =
                                                                      await GetAddressMitraCall
                                                                          .call(
                                                                    token: FFAppState()
                                                                        .token,
                                                                  );

                                                                  if (GetAddressMitraCall
                                                                              .allAddress(
                                                                            (_model.getPracticeAddress1?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          null &&
                                                                      (GetAddressMitraCall
                                                                              .allAddress(
                                                                        (_model.getPracticeAddress1?.jsonBody ??
                                                                            ''),
                                                                      ))!
                                                                          .isNotEmpty) {
                                                                    context
                                                                        .pushNamed(
                                                                      ServiceSettingPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'uuidCampaign':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            listOpenServicesItem,
                                                                            r'''$.uuid_campaign''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'nameProgramClass':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            listOpenServicesItem,
                                                                            r'''$.name_program_class''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
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
                                                                            title:
                                                                                Text('Warning'),
                                                                            content:
                                                                                Text('You have not add any practice address yet. In order to use your services, you have to add it first!'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Add practice address'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                    if (Navigator.of(
                                                                            context)
                                                                        .canPop()) {
                                                                      context
                                                                          .pop();
                                                                    }
                                                                    context.pushNamed(
                                                                        AddPracticeAddressPageWidget
                                                                            .routeName);
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    0.0,
                                                                buttonSize:
                                                                    48.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .schedule_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .sbcarePrimaryColor,
                                                                  size: 30.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    ScheduleSettingPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'uidCampaign':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listOpenServicesItem,
                                                                          r'''$.uuid_campaign''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'nameProgramClass':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listOpenServicesItem,
                                                                          r'''$.name_program_class''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                                    final listClosedServices =
                                        GetListServicesMitraCall.closedService(
                                              tabBarGetListServicesMitraResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];
                                    if (listClosedServices.isEmpty) {
                                      return Center(
                                        child:
                                            EmptyListFilteredOwnedServiceComponentWidget(),
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
                                      child: ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listClosedServices.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 10.0),
                                        itemBuilder:
                                            (context, listClosedServicesIndex) {
                                          final listClosedServicesItem =
                                              listClosedServices[
                                                  listClosedServicesIndex];
                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 5.0, 0.0, 5.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                  width: 0.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                getJsonField(
                                                                              listClosedServicesItem,
                                                                              r'''$.campaign_image''',
                                                                            ).toString(),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorWidget: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpg',
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag:
                                                                              getJsonField(
                                                                            listClosedServicesItem,
                                                                            r'''$.campaign_image''',
                                                                          ).toString(),
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag:
                                                                        getJsonField(
                                                                      listClosedServicesItem,
                                                                      r'''$.campaign_image''',
                                                                    ).toString(),
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            getJsonField(
                                                                          listClosedServicesItem,
                                                                          r'''$.campaign_image''',
                                                                        ).toString(),
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            80.0,
                                                                        fit: BoxFit
                                                                            .scaleDown,
                                                                        errorWidget: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.jpg',
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              80.0,
                                                                          fit: BoxFit
                                                                              .scaleDown,
                                                                        ),
                                                                      ),
                                                                    ),
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
                                                                        10.0,
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
                                                                      .start,
                                                              children: [
                                                                AutoSizeText(
                                                                  getJsonField(
                                                                    listClosedServicesItem,
                                                                    r'''$.campaign_title''',
                                                                  ).toString(),
                                                                  maxLines: 4,
                                                                  minFontSize:
                                                                      12.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          2.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          2.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    0.0,
                                                                buttonSize:
                                                                    48.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .settings_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 30.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model.getPracticeAddress2 =
                                                                      await GetAddressMitraCall
                                                                          .call(
                                                                    token: FFAppState()
                                                                        .token,
                                                                  );

                                                                  if (GetAddressMitraCall
                                                                              .allAddress(
                                                                            (_model.getPracticeAddress2?.jsonBody ??
                                                                                ''),
                                                                          ) !=
                                                                          null &&
                                                                      (GetAddressMitraCall
                                                                              .allAddress(
                                                                        (_model.getPracticeAddress2?.jsonBody ??
                                                                            ''),
                                                                      ))!
                                                                          .isNotEmpty) {
                                                                    context
                                                                        .pushNamed(
                                                                      ServiceSettingPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'uuidCampaign':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            listClosedServicesItem,
                                                                            r'''$.uuid_campaign''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'nameProgramClass':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            listClosedServicesItem,
                                                                            r'''$.name_program_class''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
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
                                                                            title:
                                                                                Text('Warning'),
                                                                            content:
                                                                                Text('You have not add any practice address yet. In order to use your services, you have to add it first!'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Add practice address'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                    if (Navigator.of(
                                                                            context)
                                                                        .canPop()) {
                                                                      context
                                                                          .pop();
                                                                    }
                                                                    context.pushNamed(
                                                                        AddPracticeAddressPageWidget
                                                                            .routeName);
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    0.0,
                                                                buttonSize:
                                                                    48.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .schedule_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .sbcarePrimaryColor,
                                                                  size: 30.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    ScheduleSettingPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'uidCampaign':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listClosedServicesItem,
                                                                          r'''$.uuid_campaign''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'nameProgramClass':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listClosedServicesItem,
                                                                          r'''$.name_program_class''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                                    final listExpiredServices =
                                        GetListServicesMitraCall.expiredService(
                                              tabBarGetListServicesMitraResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];
                                    if (listExpiredServices.isEmpty) {
                                      return Center(
                                        child:
                                            EmptyListFilteredOwnedServiceComponentWidget(),
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
                                      child: ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listExpiredServices.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 10.0),
                                        itemBuilder: (context,
                                            listExpiredServicesIndex) {
                                          final listExpiredServicesItem =
                                              listExpiredServices[
                                                  listExpiredServicesIndex];
                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                getJsonField(
                                                                              listExpiredServicesItem,
                                                                              r'''$.campaign_image''',
                                                                            ).toString(),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorWidget: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpg',
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag:
                                                                              getJsonField(
                                                                            listExpiredServicesItem,
                                                                            r'''$.campaign_image''',
                                                                          ).toString(),
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag:
                                                                        getJsonField(
                                                                      listExpiredServicesItem,
                                                                      r'''$.campaign_image''',
                                                                    ).toString(),
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            getJsonField(
                                                                          listExpiredServicesItem,
                                                                          r'''$.campaign_image''',
                                                                        ).toString(),
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            80.0,
                                                                        fit: BoxFit
                                                                            .scaleDown,
                                                                        errorWidget: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.jpg',
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              80.0,
                                                                          fit: BoxFit
                                                                              .scaleDown,
                                                                        ),
                                                                      ),
                                                                    ),
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
                                                                        10.0,
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
                                                                      .start,
                                                              children: [
                                                                AutoSizeText(
                                                                  getJsonField(
                                                                    listExpiredServicesItem,
                                                                    r'''$.campaign_title''',
                                                                  ).toString(),
                                                                  maxLines: 4,
                                                                  minFontSize:
                                                                      12.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          2.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          2.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                                    final listAllServices =
                                        GetListServicesMitraCall
                                                .allListServices(
                                              tabBarGetListServicesMitraResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];
                                    if (listAllServices.isEmpty) {
                                      return Center(
                                        child:
                                            EmptyListOwnedServiceComponentWidget(),
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
                                      child: ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listAllServices.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 10.0),
                                        itemBuilder:
                                            (context, listAllServicesIndex) {
                                          final listAllServicesItem =
                                              listAllServices[
                                                  listAllServicesIndex];
                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 5.0, 0.0, 5.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  width: 0.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                getJsonField(
                                                                              listAllServicesItem,
                                                                              r'''$.campaign_image''',
                                                                            ).toString(),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorWidget: (context, error, stackTrace) =>
                                                                                Image.asset(
                                                                              'assets/images/error_image.jpg',
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag:
                                                                              getJsonField(
                                                                            listAllServicesItem,
                                                                            r'''$.campaign_image''',
                                                                          ).toString(),
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag:
                                                                        getJsonField(
                                                                      listAllServicesItem,
                                                                      r'''$.campaign_image''',
                                                                    ).toString(),
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            getJsonField(
                                                                          listAllServicesItem,
                                                                          r'''$.campaign_image''',
                                                                        ).toString(),
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            80.0,
                                                                        fit: BoxFit
                                                                            .scaleDown,
                                                                        errorWidget: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.jpg',
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              80.0,
                                                                          fit: BoxFit
                                                                              .scaleDown,
                                                                        ),
                                                                      ),
                                                                    ),
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
                                                                        10.0,
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
                                                                      .start,
                                                              children: [
                                                                AutoSizeText(
                                                                  getJsonField(
                                                                    listAllServicesItem,
                                                                    r'''$.campaign_title''',
                                                                  ).toString(),
                                                                  maxLines: 3,
                                                                  minFontSize:
                                                                      12.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if ((GetListServicesMitraCall
                                                                            .campaignStatus(
                                                                          tabBarGetListServicesMitraResponse
                                                                              .jsonBody,
                                                                        )?.elementAtOrNull(
                                                                            listAllServicesIndex)) ==
                                                                        'actived') {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'yokq40k3' /* STATUS :  */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                  enText: 'OPEN',
                                                                                  idText: 'BUKA',
                                                                                ),
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontSize: 13.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else if ((GetListServicesMitraCall
                                                                            .campaignStatus(
                                                                          tabBarGetListServicesMitraResponse
                                                                              .jsonBody,
                                                                        )?.elementAtOrNull(
                                                                            listAllServicesIndex)) ==
                                                                        'disabled') {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'jz9ppp20' /* STATUS :  */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                  enText: 'CLOSED',
                                                                                  idText: 'TUTUP',
                                                                                ),
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontSize: 13.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'zbofn5ik' /* STATUS :  */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getVariableText(
                                                                                  enText: 'EXPIRED',
                                                                                  idText: 'KEDALUWARSA',
                                                                                ),
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).pureRed,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontSize: 13.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          2.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          2.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        if ((GetListServicesMitraCall
                                                                .userClassStatus(
                                                              tabBarGetListServicesMitraResponse
                                                                  .jsonBody,
                                                            )?.elementAtOrNull(
                                                                listAllServicesIndex)) !=
                                                            'expired')
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      0.0,
                                                                  buttonSize:
                                                                      48.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .settings_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 30.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    _model.getPracticeAddress =
                                                                        await GetAddressMitraCall
                                                                            .call(
                                                                      token: FFAppState()
                                                                          .token,
                                                                    );

                                                                    if (GetAddressMitraCall.allAddress(
                                                                              (_model.getPracticeAddress?.jsonBody ?? ''),
                                                                            ) !=
                                                                            null &&
                                                                        (GetAddressMitraCall.allAddress(
                                                                          (_model.getPracticeAddress?.jsonBody ??
                                                                              ''),
                                                                        ))!
                                                                            .isNotEmpty) {
                                                                      context
                                                                          .pushNamed(
                                                                        ServiceSettingPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'uuidCampaign':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              listAllServicesItem,
                                                                              r'''$.uuid_campaign''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'nameProgramClass':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              listAllServicesItem,
                                                                              r'''$.name_program_class''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
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
                                                                              title: Text('Warning'),
                                                                              content: Text('You have not add any practice address yet. In order to use your services, you have to add it first!'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Add practice address'),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                      if (Navigator.of(
                                                                              context)
                                                                          .canPop()) {
                                                                        context
                                                                            .pop();
                                                                      }
                                                                      context.pushNamed(
                                                                          AddPracticeAddressPageWidget
                                                                              .routeName);
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      0.0,
                                                                  buttonSize:
                                                                      48.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .schedule_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbcarePrimaryColor,
                                                                    size: 30.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      ScheduleSettingPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'uidCampaign':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            listAllServicesItem,
                                                                            r'''$.uuid_campaign''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'nameProgramClass':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            listAllServicesItem,
                                                                            r'''$.name_program_class''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
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
