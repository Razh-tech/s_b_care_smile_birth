import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/mitra/module/empty_list_module_mitra_component/empty_list_module_mitra_component_widget.dart';
import '/pages/mitra/module/empty_search_module_component/empty_search_module_component_widget.dart';
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
import 'regular_module_list_page_model.dart';
export 'regular_module_list_page_model.dart';

class RegularModuleListPageWidget extends StatefulWidget {
  const RegularModuleListPageWidget({super.key});

  static String routeName = 'RegularModuleListPage';
  static String routePath = 'provider/module/regular';

  @override
  State<RegularModuleListPageWidget> createState() =>
      _RegularModuleListPageWidgetState();
}

class _RegularModuleListPageWidgetState
    extends State<RegularModuleListPageWidget> {
  late RegularModuleListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegularModuleListPageModel());

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
        title: 'Regular Modules | SBCare - SmileBirth',
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
                  'cmpqnuwc' /* Regular Modules */,
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
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
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
                                          _model.isModuleFullList = false;
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
                                      '3s32ntq3' /* Input Module title */,
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
                                  _model.isModuleFullList = true;
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
                    Flexible(
                      child: Builder(
                        builder: (context) {
                          if (_model.isModuleFullList) {
                            return FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter2 ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(
                                            GetListModuleRegularCall.call(
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
                                final listModuleGVGetListModuleRegularResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final listModuleRegular = getJsonField(
                                      listModuleGVGetListModuleRegularResponse
                                          .jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    if (listModuleRegular.isEmpty) {
                                      return EmptyListModuleMitraComponentWidget();
                                    }

                                    return RefreshIndicator(
                                      key: Key('RefreshIndicator_n99bznzk'),
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
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                390.0) {
                                              return 0.85;
                                            } else if ((MediaQuery.sizeOf(
                                                            context)
                                                        .width >=
                                                    390.0) &&
                                                (MediaQuery.sizeOf(context)
                                                        .width <=
                                                    430.0)) {
                                              return 0.9;
                                            } else {
                                              return 1.0;
                                            }
                                          }(),
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listModuleRegular.length,
                                        itemBuilder:
                                            (context, listModuleRegularIndex) {
                                          final listModuleRegularItem =
                                              listModuleRegular[
                                                  listModuleRegularIndex];
                                          return Container(
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
                                                                    15.0,
                                                                    15.0,
                                                                    15.0,
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
                                                                      listModuleRegularItem,
                                                                      r'''$.modul_image''',
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
                                                                    listModuleRegularItem,
                                                                    r'''$.modul_image''',
                                                                  ).toString(),
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: getJsonField(
                                                              listModuleRegularItem,
                                                              r'''$.modul_image''',
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
                                                                  listModuleRegularItem,
                                                                  r'''$.modul_image''',
                                                                ).toString(),
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                                errorWidget: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.jpg',
                                                                  fit: BoxFit
                                                                      .scaleDown,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              getJsonField(
                                                                listModuleRegularItem,
                                                                r'''$.modul_title''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 2,
                                                              minFontSize: 12.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
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
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            controller: _model
                                                                .columnController1,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    listModuleRegularItem,
                                                                    r'''$.modul_description''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 3,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          '1o6meht2' /* EXP        :  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            getJsonField(
                                                                          listModuleRegularItem,
                                                                          r'''$.user_modul_end''',
                                                                        ).toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontWeight:
                                                                              FontWeight.w600,
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
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if ((GetListModuleRegularCall
                                                                            .userModulStatus(
                                                                          listModuleGVGetListModuleRegularResponse
                                                                              .jsonBody,
                                                                        )?.elementAtOrNull(
                                                                            listModuleRegularIndex)) ==
                                                                        'ACTIVED') {
                                                                      return RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'qzdszwjy' /* STATUS :  */,
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
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'o22mlufz' /* ACTIVE */,
                                                                              ),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 13.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '40t7ql6h' /* STATUS :  */,
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
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '3y3ufeb1' /* EXPIRED */,
                                                                              ),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).pureRed,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 13.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
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
                                                      .fromSTEB(10.0, 0.0, 10.0,
                                                          10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      if ((GetListModuleRegularCall
                                                              .userModulStatus(
                                                            listModuleGVGetListModuleRegularResponse
                                                                .jsonBody,
                                                          )?.elementAtOrNull(
                                                              listModuleRegularIndex)) ==
                                                          'ACTIVED')
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              RegularModuleContentPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'uuidModul':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    listModuleRegularItem,
                                                                    r'''$.uuid_modul''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'modulTitle':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    listModuleRegularItem,
                                                                    r'''$.modul_title''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'modulDesc':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    listModuleRegularItem,
                                                                    r'''$.modul_description''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'iqesp7yw' /* View Module */,
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .view_compact_rounded,
                                                            size: 15.0,
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
                                                                .sbCareLightColor,
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
                                                                          .primaryText,
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
                                                    ],
                                                  ),
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
                                        ..complete(SearchModuleRegularCall.call(
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
                                final searchModuleGVSearchModuleRegularResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final searchModuleRegular = getJsonField(
                                      searchModuleGVSearchModuleRegularResponse
                                          .jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    if (searchModuleRegular.isEmpty) {
                                      return EmptySearchModuleComponentWidget();
                                    }

                                    return RefreshIndicator(
                                      key: Key('RefreshIndicator_3ioeetu6'),
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
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                390.0) {
                                              return 0.85;
                                            } else if ((MediaQuery.sizeOf(
                                                            context)
                                                        .width >=
                                                    390.0) &&
                                                (MediaQuery.sizeOf(context)
                                                        .width <=
                                                    430.0)) {
                                              return 0.9;
                                            } else {
                                              return 1.0;
                                            }
                                          }(),
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: searchModuleRegular.length,
                                        itemBuilder: (context,
                                            searchModuleRegularIndex) {
                                          final searchModuleRegularItem =
                                              searchModuleRegular[
                                                  searchModuleRegularIndex];
                                          return Container(
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
                                                                    15.0,
                                                                    15.0,
                                                                    15.0,
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
                                                                      searchModuleRegularItem,
                                                                      r'''$.modul_image''',
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
                                                                    searchModuleRegularItem,
                                                                    r'''$.modul_image''',
                                                                  ).toString(),
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: getJsonField(
                                                              searchModuleRegularItem,
                                                              r'''$.modul_image''',
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
                                                                  searchModuleRegularItem,
                                                                  r'''$.modul_image''',
                                                                ).toString(),
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                                errorWidget: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.jpg',
                                                                  fit: BoxFit
                                                                      .scaleDown,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              getJsonField(
                                                                searchModuleRegularItem,
                                                                r'''$.modul_title''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 2,
                                                              minFontSize: 12.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
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
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            controller: _model
                                                                .columnController2,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                AutoSizeText(
                                                                  getJsonField(
                                                                    searchModuleRegularItem,
                                                                    r'''$.modul_description''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 3,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'kw5mppd0' /* EXP        :  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            getJsonField(
                                                                          searchModuleRegularItem,
                                                                          r'''$.user_modul_end''',
                                                                        ).toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontWeight:
                                                                              FontWeight.w600,
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
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if ((SearchModuleRegularCall
                                                                            .userModulStatus(
                                                                          searchModuleGVSearchModuleRegularResponse
                                                                              .jsonBody,
                                                                        )?.elementAtOrNull(
                                                                            searchModuleRegularIndex)) ==
                                                                        'ACTIVED') {
                                                                      return RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'k45buol6' /* STATUS :  */,
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
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'nb89b3ba' /* ACTIVE */,
                                                                              ),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 13.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'apmhqedx' /* STATUS :  */,
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
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'k4klxvqm' /* EXPIRED */,
                                                                              ),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).pureRed,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 13.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
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
                                                      .fromSTEB(10.0, 0.0, 10.0,
                                                          10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      if ((SearchModuleRegularCall
                                                              .userModulStatus(
                                                            searchModuleGVSearchModuleRegularResponse
                                                                .jsonBody,
                                                          )?.elementAtOrNull(
                                                              searchModuleRegularIndex)) ==
                                                          'ACTIVED')
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              RegularModuleContentPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'uuidModul':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    searchModuleRegularItem,
                                                                    r'''$.uuid_modul''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'modulTitle':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    searchModuleRegularItem,
                                                                    r'''$.modul_title''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'modulDesc':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    searchModuleRegularItem,
                                                                    r'''$.modul_description''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '7y68o36n' /* View Module */,
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .view_compact_rounded,
                                                            size: 20.0,
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
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .sbCareLightColor,
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
                                                                          .primaryText,
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
                                                    ],
                                                  ),
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
