import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/client/home/contraction_timer/contraction_timer_pro_full_description_component/contraction_timer_pro_full_description_component_widget.dart';
import '/pages/client/home/contraction_timer/empty_list_contraction_timer_pro_component/empty_list_contraction_timer_pro_component_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'contraction_timer_pro_list_page_model.dart';
export 'contraction_timer_pro_list_page_model.dart';

class ContractionTimerProListPageWidget extends StatefulWidget {
  const ContractionTimerProListPageWidget({super.key});

  static String routeName = 'ContractionTimerProListPage';
  static String routePath = 'premium/contraction-timer-pro';

  @override
  State<ContractionTimerProListPageWidget> createState() =>
      _ContractionTimerProListPageWidgetState();
}

class _ContractionTimerProListPageWidgetState
    extends State<ContractionTimerProListPageWidget> {
  late ContractionTimerProListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContractionTimerProListPageModel());

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
        title: 'ContractionTimerProListPage',
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
                  color: FlutterFlowTheme.of(context).info,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'em4d6ijz' /* Contraction Timer Pro */,
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter ??=
                                Completer<ApiCallResponse>()
                                  ..complete(ProFeatureGroup
                                      .getListContractionProCall
                                      .call(
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
                                  color: FlutterFlowTheme.of(context)
                                      .sbcarePrimaryColor,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          final listContractionProGVGetListContractionProResponse =
                              snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final contractionProList =
                                  ProFeatureGroup.getListContractionProCall
                                          .allData(
                                            listContractionProGVGetListContractionProResponse
                                                .jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                              if (contractionProList.isEmpty) {
                                return EmptyListContractionTimerProComponentWidget();
                              }

                              return RefreshIndicator(
                                color: FlutterFlowTheme.of(context)
                                    .sbcarePrimaryColor,
                                onRefresh: () async {
                                  safeSetState(
                                      () => _model.apiRequestCompleter = null);
                                  await _model.waitForApiRequestCompleted();
                                },
                                child: GridView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    20.0,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          405.0) {
                                        return 0.55;
                                      } else if ((MediaQuery.sizeOf(context)
                                                  .width >=
                                              405.0) &&
                                          (MediaQuery.sizeOf(context).width <
                                              720.0)) {
                                        return 0.6;
                                      } else {
                                        return 1.0;
                                      }
                                    }(),
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: contractionProList.length,
                                  itemBuilder:
                                      (context, contractionProListIndex) {
                                    final contractionProListItem =
                                        contractionProList[
                                            contractionProListIndex];
                                    return SafeArea(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              offset: Offset(
                                                0.0,
                                                4.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .sbCareLightColor,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl: getJsonField(
                                                          contractionProListItem,
                                                          r'''$.image''',
                                                        ).toString(),
                                                        fit: BoxFit.scaleDown,
                                                        errorWidget: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          fit: BoxFit.scaleDown,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        contractionProListItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                            contractionProListItem,
                                                            r'''$.description''',
                                                          ).toString(),
                                                          textAlign:
                                                              TextAlign.start,
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
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          ContractionTimerProFullDescriptionComponentWidget(
                                                                        title:
                                                                            getJsonField(
                                                                          contractionProListItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        description:
                                                                            getJsonField(
                                                                          contractionProListItem,
                                                                          r'''$.description''',
                                                                        ).toString(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'cjyrgo49' /* View Full Description */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sbcarePrimaryColor,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'vrm56bi9' /* Price        :  */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getJsonField(
                                                                      contractionProListItem,
                                                                      r'''$.formatted_price''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'nb0qveni' /* Duration :  */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getJsonField(
                                                                      contractionProListItem,
                                                                      r'''$.duration_text''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      fontSize:
                                                                          12.0,
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
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 5.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.balanceResult =
                                                            await UserGroup
                                                                .getUserWalletCall
                                                                .call(
                                                          token: FFAppState()
                                                              .token,
                                                        );

                                                        FFAppState()
                                                                .sbpayBalance =
                                                            UserGroup
                                                                .getUserWalletCall
                                                                .walletBalance(
                                                          (_model.balanceResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!;
                                                        FFAppState()
                                                            .update(() {});
                                                        if (FFAppState()
                                                                .sbpayBalance >=
                                                            getJsonField(
                                                              contractionProListItem,
                                                              r'''$.price''',
                                                            )) {
                                                          context.pushNamed(
                                                            ContractionTimerProCheckoutPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'uuidProFeature':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  contractionProListItem,
                                                                  r'''$.uuid_pro_feature''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              '__transition_info__':
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .rightToLeft,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                              ),
                                                            },
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
                                                                          title:
                                                                              Text(FFLocalizations.of(context).getVariableText(
                                                                            enText:
                                                                                'SBPay Status',
                                                                            idText:
                                                                                'Status SBPay',
                                                                          )),
                                                                          content:
                                                                              Text(FFLocalizations.of(context).getVariableText(
                                                                            enText:
                                                                                'Your balance is insufficient',
                                                                            idText:
                                                                                'Saldo Anda tidak mencukupi',
                                                                          )),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text(FFLocalizations.of(context).getVariableText(
                                                                                enText: 'Cancel',
                                                                                idText: 'Batalkan',
                                                                              )),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Top up'),
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
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '93gtmqe1' /* Purchase Contraction Pro */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .shopping_cart_checkout_outlined,
                                                        size: 24.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconColor: FlutterFlowTheme
                                                                .of(context)
                                                            .sbcarePrimaryColor,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbCareLightColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .sbcarePrimaryColor,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                        elevation: 1.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 5.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          ContractionTimerProRedeemCodePageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'uuidProFeature':
                                                                serializeParam(
                                                              getJsonField(
                                                                contractionProListItem,
                                                                r'''$.uuid_pro_feature''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'voqw1lor' /* Redeem Code */,
                                                      ),
                                                      icon: Icon(
                                                        Icons.redeem_outlined,
                                                        size: 24.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                        elevation: 1.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
