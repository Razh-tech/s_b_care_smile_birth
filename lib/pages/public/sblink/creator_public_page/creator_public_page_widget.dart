import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'creator_public_page_model.dart';
export 'creator_public_page_model.dart';

class CreatorPublicPageWidget extends StatefulWidget {
  const CreatorPublicPageWidget({
    super.key,
    required this.slug,
  });

  /// SEO-friendly fullname
  final String? slug;

  static String routeName = 'CreatorPublicPage';
  static String routePath = 'sblink/:slug';

  @override
  State<CreatorPublicPageWidget> createState() =>
      _CreatorPublicPageWidgetState();
}

class _CreatorPublicPageWidgetState extends State<CreatorPublicPageWidget> {
  late CreatorPublicPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorPublicPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: SBLinkGroup.sBLinkCreatorProfileCall.call(
        slug: widget.slug,
      ),
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
        final creatorPublicPageSBLinkCreatorProfileResponse = snapshot.data!;

        return Title(
            title: 'SBLink | SBCare - SmileBirth',
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
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 8.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color:
                              FlutterFlowTheme.of(context).sbcarePrimaryColor,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '4q0xn6jd' /* SBLink */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.lexendDeca(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .sbcarePrimaryColor,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Builder(
                        builder: (context) => FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.share_outlined,
                            color:
                                FlutterFlowTheme.of(context).sbcarePrimaryColor,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            if (isAndroid) {
                              await Share.share(
                                '${FFDevEnvironmentValues().androidLinkDomain}sblink/${widget.slug}',
                                sharePositionOrigin:
                                    getWidgetBoundingBox(context),
                              );
                            } else {
                              await Clipboard.setData(ClipboardData(
                                  text:
                                      '${FFDevEnvironmentValues().sbcareLinkDomain}sblink/${widget.slug}'));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 1.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      controller: _model.columnController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl:
                                    SBLinkGroup.sBLinkCreatorProfileCall.avatar(
                                  creatorPublicPageSBLinkCreatorProfileResponse
                                      .jsonBody,
                                )!,
                                width: double.infinity,
                                height: () {
                                  if (MediaQuery.sizeOf(context).width <=
                                      400.0) {
                                    return 200.0;
                                  } else if (MediaQuery.sizeOf(context).width <=
                                      480.0) {
                                    return 240.0;
                                  } else if (MediaQuery.sizeOf(context).width <=
                                      768.0) {
                                    return 384.0;
                                  } else if (MediaQuery.sizeOf(context).width <=
                                      1024.0) {
                                    return 512.0;
                                  } else if (MediaQuery.sizeOf(context).width <=
                                      1440.0) {
                                    return 720.0;
                                  } else {
                                    return 980.0;
                                  }
                                }(),
                                fit: BoxFit.scaleDown,
                                errorWidget: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.jpg',
                                  width: double.infinity,
                                  height: () {
                                    if (MediaQuery.sizeOf(context).width <=
                                        400.0) {
                                      return 200.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <=
                                        480.0) {
                                      return 240.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <=
                                        768.0) {
                                      return 384.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <=
                                        1024.0) {
                                      return 512.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <=
                                        1440.0) {
                                      return 720.0;
                                    } else {
                                      return 980.0;
                                    }
                                  }(),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  valueOrDefault<String>(
                                    SBLinkGroup.sBLinkCreatorProfileCall
                                        .fullname(
                                      creatorPublicPageSBLinkCreatorProfileResponse
                                          .jsonBody,
                                    ),
                                    'SBLink Creator',
                                  ),
                                  minFontSize: 14.0,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .headlineSmallIsCustom,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color:
                                FlutterFlowTheme.of(context).sbCareLightColor,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 24.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: SBLinkGroup.listProductsCall.call(
                                mitraSlug: widget.slug,
                              ),
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
                                final listViewListProductsResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final listProduct = getJsonField(
                                      listViewListProductsResponse.jsonBody,
                                      r'''$.data''',
                                    ).toList().take(20).toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listProduct.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 8.0),
                                      itemBuilder: (context, listProductIndex) {
                                        final listProductItem =
                                            listProduct[listProductIndex];
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
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
                                                              listProductItem,
                                                              r'''$.image''',
                                                            ).toString(),
                                                            fit: BoxFit.contain,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpg',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                          allowRotation: false,
                                                          tag: getJsonField(
                                                            listProductItem,
                                                            r'''$.image''',
                                                          ).toString(),
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: getJsonField(
                                                      listProductItem,
                                                      r'''$.image''',
                                                    ).toString(),
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
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
                                                          listProductItem,
                                                          r'''$.image''',
                                                        ).toString(),
                                                        width: 80.0,
                                                        height: 80.0,
                                                        fit: BoxFit.scaleDown,
                                                        errorWidget: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          width: 80.0,
                                                          height: 80.0,
                                                          fit: BoxFit.scaleDown,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AutoSizeText(
                                                        getJsonField(
                                                          listProductItem,
                                                          r'''$.title''',
                                                        ).toString(),
                                                        maxLines: 3,
                                                        minFontSize: 12.0,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallIsCustom,
                                                            ),
                                                      ),
                                                      AutoSizeText(
                                                        getJsonField(
                                                          listProductItem,
                                                          r'''$.formatted_price''',
                                                        ).toString(),
                                                        maxLines: 3,
                                                        minFontSize: 12.0,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .sbcarePrimaryColor,
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmallIsCustom,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        ProductDetailPublicPageWidget
                                                            .routeName,
                                                        pathParameters: {
                                                          'slug':
                                                              serializeParam(
                                                            widget.slug,
                                                            ParamType.String,
                                                          ),
                                                          'productSlug':
                                                              serializeParam(
                                                            getJsonField(
                                                              listProductItem,
                                                              r'''$.uuid_product''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .topToBottom,
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
                                                      'c5xwqn56' /* Purchase */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
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
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ].addToEnd(SizedBox(height: 20.0)),
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
