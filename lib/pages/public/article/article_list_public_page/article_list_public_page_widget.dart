import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
import 'package:share_plus/share_plus.dart';
import 'package:text_search/text_search.dart';
import 'article_list_public_page_model.dart';
export 'article_list_public_page_model.dart';

class ArticleListPublicPageWidget extends StatefulWidget {
  const ArticleListPublicPageWidget({super.key});

  static String routeName = 'ArticleListPublicPage';
  static String routePath = 'article';

  @override
  State<ArticleListPublicPageWidget> createState() =>
      _ArticleListPublicPageWidgetState();
}

class _ArticleListPublicPageWidgetState
    extends State<ArticleListPublicPageWidget> {
  late ArticleListPublicPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticleListPublicPageModel());

    _model.searchArticleTFTextController ??= TextEditingController();
    _model.searchArticleTFFocusNode ??= FocusNode();
    _model.searchArticleTFFocusNode!.addListener(() => safeSetState(() {}));
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
        title: 'SB Articles | SBCare - SmileBirth',
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
                  '5bscykvi' /* SB Articles */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: FlutterFlowTheme.of(context).info,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  controller: _model.columnController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'hfj4car7' /* Stay up to date with the lates... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelMediumIsCustom,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).sbCareLightColor,
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
                                        _model.searchArticleTFTextController,
                                    focusNode: _model.searchArticleTFFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.searchArticleTFTextController',
                                      Duration(milliseconds: 1000),
                                      () async {
                                        await Future.wait([
                                          Future(() async {
                                            safeSetState(() {
                                              _model.simpleSearchResults =
                                                  TextSearch((FFAppState()
                                                                  .searchState
                                                              as List)
                                                          .cast<String>()
                                                          .map((str) =>
                                                              TextSearchItem
                                                                  .fromTerms(
                                                                      str,
                                                                      [str]))
                                                          .toList())
                                                      .search(_model
                                                          .searchArticleTFTextController
                                                          .text)
                                                      .map((r) => r.object)
                                                      .toList();
                                              ;
                                            });
                                          }),
                                          Future(() async {
                                            _model.isArticleFullList = false;
                                            _model.searchKeyword = _model
                                                .searchArticleTFTextController
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
                                    textCapitalization:
                                        TextCapitalization.words,
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
                                        'jqantq59' /* Input title or author */,
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .sbCareLightColor,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                                        .searchArticleTFTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
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
                                      _model.searchArticleTFTextController
                                          ?.clear();
                                    });
                                    _model.isArticleFullList = true;
                                    safeSetState(() {});
                                    safeSetState(() =>
                                        _model.apiRequestCompleter2 = null);
                                    await _model.waitForApiRequestCompleted2();
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
                      Builder(
                        builder: (context) {
                          if (_model.isArticleFullList == true) {
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter1 ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(PublicAPIGroup
                                              .pubGetListArticleCall
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
                                  final articleLVPubGetListArticleResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final listArticle = getJsonField(
                                        articleLVPubGetListArticleResponse
                                            .jsonBody,
                                        r'''$.data''',
                                      ).toList().take(20).toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          40.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listArticle.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 16.0),
                                        itemBuilder:
                                            (context, listArticleIndex) {
                                          final listArticleItem =
                                              listArticle[listArticleIndex];
                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 8.0,
                                                  color: Color(0x1A000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
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
                                                        context.pushNamed(
                                                          ArticleDetailPublicPageWidget
                                                              .routeName,
                                                          pathParameters: {
                                                            'slug':
                                                                serializeParam(
                                                              getJsonField(
                                                                listArticleItem,
                                                                r'''$.slug''',
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
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                            listArticleItem,
                                                            r'''$.cover_image_url''',
                                                          ).toString(),
                                                          fit: BoxFit.scaleDown,
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
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          2.0,
                                                                          8.0,
                                                                          2.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  listArticleItem,
                                                                  r'''$.category_name''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              listArticleItem,
                                                              r'''$.published_at''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmallIsCustom,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      AutoSizeText(
                                                        getJsonField(
                                                          listArticleItem,
                                                          r'''$.title''',
                                                        ).toString(),
                                                        maxLines: 3,
                                                        minFontSize: 12.0,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              lineHeight: 1.3,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumIsCustom,
                                                            ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'khrl72s9' /* By  */,
                                                              ),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 11.0,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                height: 1.4,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  getJsonField(
                                                                listArticleItem,
                                                                r'''$.author_name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        11.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                    lineHeight:
                                                                        1.4,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 11.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.4,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmallIsCustom,
                                                              ),
                                                        ),
                                                        maxLines: 2,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      ArticleDetailPublicPageWidget
                                                                          .routeName,
                                                                      pathParameters:
                                                                          {
                                                                        'slug':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            listArticleItem,
                                                                            r'''$.slug''',
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
                                                                              PageTransitionType.bottomToTop,
                                                                          duration:
                                                                              Duration(milliseconds: 500),
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'bxb3nktp' /* Read more */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbcarePrimaryColor,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 4.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (isAndroid) {
                                                                        await Share
                                                                            .share(
                                                                          '${FFDevEnvironmentValues().androidLinkDomain}article/${getJsonField(
                                                                            listArticleItem,
                                                                            r'''$.slug''',
                                                                          ).toString()}?ref=${getJsonField(
                                                                            listArticleItem,
                                                                            r'''$.uuid_article''',
                                                                          ).toString()}',
                                                                          sharePositionOrigin:
                                                                              getWidgetBoundingBox(context),
                                                                        );
                                                                      } else {
                                                                        await Clipboard.setData(ClipboardData(
                                                                            text: '${FFDevEnvironmentValues().sbcareLinkDomain}article/${getJsonField(
                                                                          listArticleItem,
                                                                          r'''$.slug''',
                                                                        ).toString()}?ref=${getJsonField(
                                                                          listArticleItem,
                                                                          r'''$.uuid_article''',
                                                                        ).toString()}'));
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .share_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sbcarePrimaryColor,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 16.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 6.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter2 ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(PublicAPIGroup
                                              .pubGetListArticleCall
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
                                  final searchArticleLVPubGetListArticleResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final listArticle = getJsonField(
                                        searchArticleLVPubGetListArticleResponse
                                            .jsonBody,
                                        r'''$.data''',
                                      ).toList().take(20).toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          40.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listArticle.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 16.0),
                                        itemBuilder:
                                            (context, listArticleIndex) {
                                          final listArticleItem =
                                              listArticle[listArticleIndex];
                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 8.0,
                                                  color: Color(0x1A000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
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
                                                        context.pushNamed(
                                                          ArticleDetailPublicPageWidget
                                                              .routeName,
                                                          pathParameters: {
                                                            'slug':
                                                                serializeParam(
                                                              getJsonField(
                                                                listArticleItem,
                                                                r'''$.slug''',
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
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                            listArticleItem,
                                                            r'''$.cover_image_url''',
                                                          ).toString(),
                                                          fit: BoxFit.scaleDown,
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
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          2.0,
                                                                          8.0,
                                                                          2.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  listArticleItem,
                                                                  r'''$.category_name''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              listArticleItem,
                                                              r'''$.published_at''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmallIsCustom,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      AutoSizeText(
                                                        getJsonField(
                                                          listArticleItem,
                                                          r'''$.title''',
                                                        ).toString(),
                                                        maxLines: 3,
                                                        minFontSize: 12.0,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              lineHeight: 1.3,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumIsCustom,
                                                            ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'fwmlnyp5' /* By  */,
                                                              ),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 11.0,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                height: 1.4,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  getJsonField(
                                                                listArticleItem,
                                                                r'''$.author_name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        11.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                    lineHeight:
                                                                        1.4,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodySmallIsCustom,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 11.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.4,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmallIsCustom,
                                                              ),
                                                        ),
                                                        maxLines: 2,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      ArticleDetailPublicPageWidget
                                                                          .routeName,
                                                                      pathParameters:
                                                                          {
                                                                        'slug':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            listArticleItem,
                                                                            r'''$.slug''',
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
                                                                              PageTransitionType.bottomToTop,
                                                                          duration:
                                                                              Duration(milliseconds: 500),
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'pac9ig4d' /* Read more */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbcarePrimaryColor,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 4.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (isAndroid) {
                                                                        await Share
                                                                            .share(
                                                                          '${FFDevEnvironmentValues().androidLinkDomain}article/${getJsonField(
                                                                            listArticleItem,
                                                                            r'''$.slug''',
                                                                          ).toString()}?ref=${getJsonField(
                                                                            listArticleItem,
                                                                            r'''$.uuid_article''',
                                                                          ).toString()}',
                                                                          sharePositionOrigin:
                                                                              getWidgetBoundingBox(context),
                                                                        );
                                                                      } else {
                                                                        await Clipboard.setData(ClipboardData(
                                                                            text: '${FFDevEnvironmentValues().sbcareLinkDomain}article/${getJsonField(
                                                                          listArticleItem,
                                                                          r'''$.slug''',
                                                                        ).toString()}?ref=${getJsonField(
                                                                          listArticleItem,
                                                                          r'''$.uuid_article''',
                                                                        ).toString()}'));
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .share_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sbcarePrimaryColor,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 16.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 6.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
