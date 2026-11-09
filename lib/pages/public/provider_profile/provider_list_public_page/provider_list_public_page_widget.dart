import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'provider_list_public_page_model.dart';
export 'provider_list_public_page_model.dart';

class ProviderListPublicPageWidget extends StatefulWidget {
  const ProviderListPublicPageWidget({super.key});

  static String routeName = 'ProviderListPublicPage';
  static String routePath = 'mitra';

  @override
  State<ProviderListPublicPageWidget> createState() =>
      _ProviderListPublicPageWidgetState();
}

class _ProviderListPublicPageWidgetState
    extends State<ProviderListPublicPageWidget> {
  late ProviderListPublicPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProviderListPublicPageModel());

    _model.searchProviderTFTextController ??= TextEditingController();
    _model.searchProviderTFFocusNode ??= FocusNode();
    _model.searchProviderTFFocusNode!.addListener(() => safeSetState(() {}));
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
        title: 'SB Mitra | SBCare - SmileBirth',
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
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'kvajgtr7' /* Provider List */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.lexendDeca(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontStyle,
                          ),
                          color:
                              FlutterFlowTheme.of(context).sbcarePrimaryColor,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.share_outlined,
                      color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                                    _model.searchProviderTFTextController,
                                focusNode: _model.searchProviderTFFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.searchProviderTFTextController',
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
                                                  .searchProviderTFTextController
                                                  .text)
                                              .map((r) => r.object)
                                              .toList();
                                          ;
                                        });
                                      }),
                                      Future(() async {
                                        _model.isProviderFullList = false;
                                        _model.searchKeyword = _model
                                            .searchProviderTFTextController
                                            .text;
                                      }),
                                    ]);
                                    safeSetState(() =>
                                        _model.apiRequestCompleter1 = null);
                                    await _model.waitForApiRequestCompleted1();
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '7vgvado3' /* Input Provider name or locatio... */,
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
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
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
                                    .searchProviderTFTextControllerValidator
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
                                  _model.searchProviderTFTextController
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
                    if (_model.isProviderFullList == true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '705i2hce' /* Showing the top 10 providers. ... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Builder(
                          builder: (context) {
                            if (_model.isProviderFullList) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: (_model.apiRequestCompleter2 ??=
                                          Completer<ApiCallResponse>()
                                            ..complete(PublicAPIGroup
                                                .pubTopMitraCall
                                                .call()))
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
                                    final topProvidersLVPubTopMitraResponse =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        final topMitra = getJsonField(
                                          topProvidersLVPubTopMitraResponse
                                              .jsonBody,
                                          r'''$.data''',
                                        ).toList().take(20).toList();
                                        if (topMitra.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/404.jpg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                          );
                                        }

                                        return RefreshIndicator(
                                          key: Key('RefreshIndicator_cynkdeu7'),
                                          color: FlutterFlowTheme.of(context)
                                              .sbcarePrimaryColor,
                                          onRefresh: () async {
                                            safeSetState(() => _model
                                                .apiRequestCompleter2 = null);
                                            await _model
                                                .waitForApiRequestCompleted2();
                                          },
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: topMitra.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 10.0),
                                            itemBuilder:
                                                (context, topMitraIndex) {
                                              final topMitraItem =
                                                  topMitra[topMitraIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 1.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 0.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          offset: Offset(
                                                            0.0,
                                                            1.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
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
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          getJsonField(
                                                                        topMitraItem,
                                                                        r'''$.user.avatar''',
                                                                      ).toString(),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      errorWidget: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.jpg',
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag:
                                                                        getJsonField(
                                                                      topMitraItem,
                                                                      r'''$.user.avatar''',
                                                                    ).toString(),
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag: getJsonField(
                                                                topMitraItem,
                                                                r'''$.user.avatar''',
                                                              ).toString(),
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
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
                                                                    topMitraItem,
                                                                    r'''$.user.avatar''',
                                                                  ).toString(),
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  fit: BoxFit
                                                                      .scaleDown,
                                                                  errorWidget: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.jpg',
                                                                    width: 60.0,
                                                                    height:
                                                                        60.0,
                                                                    fit: BoxFit
                                                                        .scaleDown,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    getJsonField(
                                                                      topMitraItem,
                                                                      r'''$.user.fullname''',
                                                                    ).toString(),
                                                                    minFontSize:
                                                                        12.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              topMitraItem,
                                                                              r'''$.user.location''',
                                                                            ).toString(),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              2.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).sbCareLightColor,
                                                                        ),
                                                                      ),
                                                                      RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: getJsonField(
                                                                                topMitraItem,
                                                                                r'''$.user.total_services''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '5bndt2xn' /*  services */,
                                                                              ),
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: InkWell(
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
                                                                  ProviderDetailPublicPageWidget
                                                                      .routeName,
                                                                  pathParameters:
                                                                      {
                                                                    'slug':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        topMitraItem,
                                                                        r'''$.user.slug_mitra''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  queryParameters:
                                                                      {
                                                                    'ref':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        topMitraItem,
                                                                        r'''$.user.uuid_provider''',
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
                                                                              .leftToRight,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              500),
                                                                    ),
                                                                  },
                                                                );
                                                              },
                                                              child: Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .sbCareLightColor,
                                                                elevation: 1.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbcarePrimaryColor,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
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
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: (_model.apiRequestCompleter1 ??=
                                          Completer<ApiCallResponse>()
                                            ..complete(PublicAPIGroup
                                                .pubMitraSearchCall
                                                .call(
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
                                    final searchProvidersLVPubMitraSearchResponse =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        final searchMitra = getJsonField(
                                          searchProvidersLVPubMitraSearchResponse
                                              .jsonBody,
                                          r'''$.data''',
                                        ).toList().take(20).toList();
                                        if (searchMitra.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/404.jpg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                          );
                                        }

                                        return RefreshIndicator(
                                          key: Key('RefreshIndicator_pp0cbqvn'),
                                          color: FlutterFlowTheme.of(context)
                                              .sbcarePrimaryColor,
                                          onRefresh: () async {
                                            safeSetState(() => _model
                                                .apiRequestCompleter1 = null);
                                            await _model
                                                .waitForApiRequestCompleted1();
                                          },
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: searchMitra.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 10.0),
                                            itemBuilder:
                                                (context, searchMitraIndex) {
                                              final searchMitraItem =
                                                  searchMitra[searchMitraIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 1.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 0.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          offset: Offset(
                                                            0.0,
                                                            1.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
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
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          getJsonField(
                                                                        searchMitraItem,
                                                                        r'''$.avatar''',
                                                                      ).toString(),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      errorWidget: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.jpg',
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag:
                                                                        getJsonField(
                                                                      searchMitraItem,
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
                                                                searchMitraItem,
                                                                r'''$.avatar''',
                                                              ).toString(),
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
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
                                                                    searchMitraItem,
                                                                    r'''$.avatar''',
                                                                  ).toString(),
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorWidget: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.jpg',
                                                                    width: 60.0,
                                                                    height:
                                                                        60.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      searchMitraItem,
                                                                      r'''$.fullname_mitra''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              searchMitraItem,
                                                                              r'''$.location''',
                                                                            ).toString(),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              2.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).sbCareLightColor,
                                                                        ),
                                                                      ),
                                                                      RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: getJsonField(
                                                                                searchMitraItem,
                                                                                r'''$.total_services''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: FFLocalizations.of(context).getVariableText(
                                                                                enText: ' service',
                                                                                idText: ' layanan',
                                                                              ),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: InkWell(
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
                                                                  ProviderDetailPublicPageWidget
                                                                      .routeName,
                                                                  pathParameters:
                                                                      {
                                                                    'slug':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        searchMitraItem,
                                                                        r'''$.slug_mitra''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  queryParameters:
                                                                      {
                                                                    'ref':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        searchMitraItem,
                                                                        r'''$.uuid_provider''',
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
                                                                              .leftToRight,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              500),
                                                                    ),
                                                                  },
                                                                );
                                                              },
                                                              child: Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .sbCareLightColor,
                                                                elevation: 1.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbcarePrimaryColor,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
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
                              );
                            }
                          },
                        ),
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
