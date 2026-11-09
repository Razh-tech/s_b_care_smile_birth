import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/client/home/provider/empty_list_provider_component/empty_list_provider_component_widget.dart';
import '/pages/client/home/provider/empty_search_provider_component/empty_search_provider_component_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'provider_list_page_model.dart';
export 'provider_list_page_model.dart';

class ProviderListPageWidget extends StatefulWidget {
  const ProviderListPageWidget({super.key});

  static String routeName = 'ProviderListPage';
  static String routePath = 'provider/list';

  @override
  State<ProviderListPageWidget> createState() => _ProviderListPageWidgetState();
}

class _ProviderListPageWidgetState extends State<ProviderListPageWidget> {
  late ProviderListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProviderListPageModel());

    _model.textFieldSearchTextController ??= TextEditingController();
    _model.textFieldSearchFocusNode ??= FocusNode();
    _model.textFieldSearchFocusNode!.addListener(() => safeSetState(() {}));
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
        title: 'Provider List | SBCare - SmileBirth',
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
                  '7hx2ms69' /* Available Provider */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).sbCareLightColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.textFieldSearchTextController,
                                  focusNode: _model.textFieldSearchFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldSearchTextController',
                                    Duration(milliseconds: 1000),
                                    () async {
                                      await Future.wait([
                                        Future(() async {
                                          safeSetState(() {
                                            _model
                                                .simpleSearchResults = TextSearch(
                                                    (FFAppState().searchState
                                                            as List)
                                                        .cast<String>()
                                                        .map((str) =>
                                                            TextSearchItem
                                                                .fromTerms(
                                                                    str, [str]))
                                                        .toList())
                                                .search(_model
                                                    .textFieldSearchTextController
                                                    .text)
                                                .map((r) => r.object)
                                                .toList();
                                            ;
                                          });
                                        }),
                                        Future(() async {
                                          _model.isProviderFullList = false;
                                          _model.searchKeyword = _model
                                              .textFieldSearchTextController
                                              .text;
                                        }),
                                      ]);
                                      safeSetState(() =>
                                          _model.apiRequestCompleter1 = null);
                                      await _model
                                          .waitForApiRequestCompleted1();
                                    },
                                  ),
                                  autofocus: false,
                                  autofillHints: [AutofillHints.name],
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.search,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'jkepp31b' /* Input provider name or locatio... */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .sbCareLightColor,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .sbCareLightColor,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                    prefixIcon: Icon(
                                      Icons.search_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
                                      size: 24.0,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  keyboardType: TextInputType.name,
                                  validator: _model
                                      .textFieldSearchTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    if (!isAndroid && !isiOS)
                                      TextInputFormatter.withFunction(
                                          (oldValue, newValue) {
                                        return TextEditingValue(
                                          selection: newValue.selection,
                                          text: newValue.text.toCapitalization(
                                              TextCapitalization.words),
                                        );
                                      }),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  safeSetState(() {
                                    _model.textFieldSearchTextController
                                        ?.clear();
                                  });
                                  _model.isProviderFullList = true;
                                  safeSetState(() {});
                                  safeSetState(
                                      () => _model.apiRequestCompleter1 = null);
                                  await _model.waitForApiRequestCompleted1();
                                },
                                child: Icon(
                                  Icons.close_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .sbcarePrimaryColor,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (_model.isProviderFullList) {
                            return FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter2 ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(GetListMitraCall.call(
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
                                final listMitraGVGetListMitraResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final listMitra = getJsonField(
                                      listMitraGVGetListMitraResponse.jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    if (listMitra.isEmpty) {
                                      return EmptyListProviderComponentWidget();
                                    }

                                    return RefreshIndicator(
                                      key: Key('RefreshIndicator_e46cwoe6'),
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
                                      onRefresh: () async {
                                        safeSetState(() =>
                                            _model.apiRequestCompleter2 = null);
                                        await _model
                                            .waitForApiRequestCompleted2();
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
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                390.0) {
                                              return 0.55;
                                            } else if ((MediaQuery.sizeOf(
                                                            context)
                                                        .width >=
                                                    390.0) &&
                                                (MediaQuery.sizeOf(context)
                                                        .width <
                                                    630.0)) {
                                              return 0.6;
                                            } else {
                                              return 1.0;
                                            }
                                          }(),
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listMitra.length,
                                        itemBuilder: (context, listMitraIndex) {
                                          final listMitraItem =
                                              listMitra[listMitraIndex];
                                          return Container(
                                            height: 300.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                                  BorderRadius.circular(20.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image:
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
                                                                      listMitraItem,
                                                                      r'''$.avatar''',
                                                                    ).toString(),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag:
                                                                      getJsonField(
                                                                    listMitraItem,
                                                                    r'''$.avatar''',
                                                                  ).toString(),
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: getJsonField(
                                                              listMitraItem,
                                                              r'''$.avatar''',
                                                            ).toString(),
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
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
                                                                  listMitraItem,
                                                                  r'''$.avatar''',
                                                                ).toString(),
                                                                height: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      390.0) {
                                                                    return 150.0;
                                                                  } else if ((MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          390.0) &&
                                                                      (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          630.0)) {
                                                                    return 155.0;
                                                                  } else {
                                                                    return 270.0;
                                                                  }
                                                                }(),
                                                                fit: BoxFit
                                                                    .scaleDown,
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
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              listMitraItem,
                                                              r'''$.fullname''',
                                                            ).toString(),
                                                            textAlign:
                                                                TextAlign.start,
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
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
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
                                                          child: Text(
                                                            getJsonField(
                                                              listMitraItem,
                                                              r'''$.address''',
                                                            ).toString(),
                                                            textAlign:
                                                                TextAlign.start,
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
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.setProviderResult =
                                                              await UpdateDefaultProviderCall
                                                                  .call(
                                                            token: FFAppState()
                                                                .token,
                                                            defaultProvider:
                                                                getJsonField(
                                                              listMitraItem,
                                                              r'''$.uuid_user''',
                                                            ).toString(),
                                                          );

                                                          if ((_model
                                                                  .setProviderResult
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'Update Status'),
                                                                    content: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Default provider has been set',
                                                                      idText:
                                                                          'Mitra default telah diatur',
                                                                    )),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            FFAppState()
                                                                    .defaultProvider =
                                                                getJsonField(
                                                              listMitraItem,
                                                              r'''$.uuid_user''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .emailProvider =
                                                                getJsonField(
                                                              listMitraItem,
                                                              r'''$.email''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .providerName =
                                                                getJsonField(
                                                              listMitraItem,
                                                              r'''$.fullname''',
                                                            ).toString();
                                                            FFAppState()
                                                                .update(() {});

                                                            context.pushNamed(
                                                              ProviderServicePageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'uuidUser':
                                                                    serializeParam(
                                                                  FFAppState()
                                                                      .defaultProvider,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'Update Status'),
                                                                    content: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Something\'s wrong!',
                                                                      idText:
                                                                          'Ada yang salah!',
                                                                    )),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'jrdmef38' /* Set as Default */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 30.0,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
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
                                                                        .info,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                          elevation: 1.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
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
                                );
                              },
                            );
                          } else {
                            return FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter1 ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(AdvanceSearchMitraCall.call(
                                          token: FFAppState().token,
                                          keyword: _model.searchKeyword,
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
                                final searchMitraGVAdvanceSearchMitraResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final searchMitraResult = getJsonField(
                                      searchMitraGVAdvanceSearchMitraResponse
                                          .jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    if (searchMitraResult.isEmpty) {
                                      return EmptySearchProviderComponentWidget();
                                    }

                                    return RefreshIndicator(
                                      key: Key('RefreshIndicator_4cvrc0lt'),
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
                                      onRefresh: () async {
                                        safeSetState(() =>
                                            _model.apiRequestCompleter1 = null);
                                        await _model
                                            .waitForApiRequestCompleted1();
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
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                390.0) {
                                              return 0.55;
                                            } else if ((MediaQuery.sizeOf(
                                                            context)
                                                        .width >=
                                                    390.0) &&
                                                (MediaQuery.sizeOf(context)
                                                        .width <
                                                    630.0)) {
                                              return 0.6;
                                            } else {
                                              return 1.0;
                                            }
                                          }(),
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: searchMitraResult.length,
                                        itemBuilder:
                                            (context, searchMitraResultIndex) {
                                          final searchMitraResultItem =
                                              searchMitraResult[
                                                  searchMitraResultIndex];
                                          return Container(
                                            height: 300.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image:
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
                                                                      searchMitraResultItem,
                                                                      r'''$.avatar''',
                                                                    ).toString(),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag:
                                                                      getJsonField(
                                                                    searchMitraResultItem,
                                                                    r'''$.avatar''',
                                                                  ).toString(),
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: getJsonField(
                                                              searchMitraResultItem,
                                                              r'''$.avatar''',
                                                            ).toString(),
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
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
                                                                  searchMitraResultItem,
                                                                  r'''$.avatar''',
                                                                ).toString(),
                                                                height: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      390.0) {
                                                                    return 150.0;
                                                                  } else if ((MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          390.0) &&
                                                                      (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          630.0)) {
                                                                    return 155.0;
                                                                  } else {
                                                                    return 270.0;
                                                                  }
                                                                }(),
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              searchMitraResultItem,
                                                              r'''$.fullname''',
                                                            ).toString(),
                                                            textAlign:
                                                                TextAlign.start,
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
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
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
                                                          child: Text(
                                                            getJsonField(
                                                              searchMitraResultItem,
                                                              r'''$.address''',
                                                            ).toString(),
                                                            textAlign:
                                                                TextAlign.start,
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
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  15.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.setDefaultResult =
                                                              await UpdateDefaultProviderCall
                                                                  .call(
                                                            token: FFAppState()
                                                                .token,
                                                            defaultProvider:
                                                                getJsonField(
                                                              searchMitraResultItem,
                                                              r'''$.uuid_user''',
                                                            ).toString(),
                                                          );

                                                          if ((_model
                                                                  .setDefaultResult
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'Update Status'),
                                                                    content: Text(
                                                                        'Default provider has been set'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            FFAppState()
                                                                    .defaultProvider =
                                                                getJsonField(
                                                              searchMitraResultItem,
                                                              r'''$.uuid_user''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .emailProvider =
                                                                getJsonField(
                                                              searchMitraResultItem,
                                                              r'''$.email''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .providerName =
                                                                getJsonField(
                                                              searchMitraResultItem,
                                                              r'''$.fullname''',
                                                            ).toString();
                                                            FFAppState()
                                                                .update(() {});

                                                            context.pushNamed(
                                                              ProviderServicePageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'uuidUser':
                                                                    serializeParam(
                                                                  FFAppState()
                                                                      .defaultProvider,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'Update Status'),
                                                                    content: Text(
                                                                        'Something\'s wrong!'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'd6xnejw5' /* Set as Default */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 30.0,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
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
                                                                        .info,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                          elevation: 1.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
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
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Reset Default Provider',
                                              idText:
                                                  'Setel Ulang Mitra Default',
                                            )),
                                            content: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText:
                                                  'Are you sure that you would like to reset your default provider?',
                                              idText:
                                                  'Apakah Anda yakin ingin mengatur ulang mitra default Anda?',
                                            )),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  enText: 'Cancel',
                                                  idText: 'Batal',
                                                )),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  enText: 'Confirm',
                                                  idText: 'Konfirmasi',
                                                )),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  _model.resetDefaultProvider =
                                      await UpdateDefaultProviderCall.call(
                                    token: FFAppState().token,
                                    defaultProvider:
                                        '019187a0-c684-7327-a36e-fe37d2d8535e',
                                  );

                                  if ((_model.resetDefaultProvider?.succeeded ??
                                      true)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('Update Status'),
                                            content: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText:
                                                  'Default provider has been reset to Default',
                                              idText:
                                                  'Mitra default telah diatur ulang ke Default',
                                            )),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    FFAppState().defaultProvider =
                                        '019187a0-c684-7327-a36e-fe37d2d8535e';
                                    FFAppState().update(() {});

                                    context
                                        .pushNamed(HomeNavbarWidget.routeName);
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('Update Status'),
                                            content: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Something\'s wrong!',
                                              idText: 'Ada yang salah!',
                                            )),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
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
                              text: FFLocalizations.of(context).getText(
                                'pv2e1nyj' /* Reset to Default */,
                              ),
                              icon: Icon(
                                Icons.restore_outlined,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                height: 35.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconAlignment: IconAlignment.start,
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconColor: FlutterFlowTheme.of(context)
                                    .sbcarePrimaryColor,
                                color: FlutterFlowTheme.of(context).warning,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color:
                                          FlutterFlowTheme.of(context).pureRed,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(20.0),
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
        ));
  }
}
