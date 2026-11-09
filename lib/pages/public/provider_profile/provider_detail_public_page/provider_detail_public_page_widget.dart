import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'provider_detail_public_page_model.dart';
export 'provider_detail_public_page_model.dart';

class ProviderDetailPublicPageWidget extends StatefulWidget {
  const ProviderDetailPublicPageWidget({
    super.key,
    required this.ref,
    required this.slug,
  });

  /// "ref" referred to uuidProvider
  final String? ref;

  /// SEO-friendly fullname
  final String? slug;

  static String routeName = 'ProviderDetailPublicPage';
  static String routePath = 'mitra/:slug';

  @override
  State<ProviderDetailPublicPageWidget> createState() =>
      _ProviderDetailPublicPageWidgetState();
}

class _ProviderDetailPublicPageWidgetState
    extends State<ProviderDetailPublicPageWidget> {
  late ProviderDetailPublicPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProviderDetailPublicPageModel());

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
      future: PublicAPIGroup.pubGetMitraDetailsCall.call(
        uuidProvider: widget.ref,
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
        final providerDetailPublicPagePubGetMitraDetailsResponse =
            snapshot.data!;

        return Title(
            title: 'Profil Mitra | SBCare - SmileBirth',
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
                          '4f1moli1' /* Provider Profile */,
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
                                '${FFDevEnvironmentValues().androidLinkDomain}mitra/${widget.slug}?ref=${widget.ref}',
                                sharePositionOrigin:
                                    getWidgetBoundingBox(context),
                              );
                            } else {
                              await Clipboard.setData(ClipboardData(
                                  text:
                                      '${FFDevEnvironmentValues().sbcareLinkDomain}mitra/${widget.slug}?ref=${widget.ref}'));
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
                                imageUrl: PublicAPIGroup.pubGetMitraDetailsCall
                                    .avatar(
                                  providerDetailPublicPagePubGetMitraDetailsResponse
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            PublicAPIGroup
                                                .pubGetMitraDetailsCall
                                                .fullname(
                                              providerDetailPublicPagePubGetMitraDetailsResponse
                                                  .jsonBody,
                                            ),
                                            'SBCare Mitra',
                                          ),
                                          minFontSize: 14.0,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmallIsCustom,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                          AutoSizeText(
                                            valueOrDefault<String>(
                                              PublicAPIGroup
                                                  .pubGetMitraDetailsCall
                                                  .location(
                                                providerDetailPublicPagePubGetMitraDetailsResponse
                                                    .jsonBody,
                                              ),
                                              'Cilacap, Jawa Tengah',
                                            ),
                                            minFontSize: 12.0,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0xFF25D366),
                                      icon: FaIcon(
                                        FaIconData(const IconData(
                                            /* whatsapp */ 0xf232,
                                            fontFamily: 'FontAwesomeBrands',
                                            fontPackage:
                                                'font_awesome_flutter')),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await launchURL(
                                            'https://api.whatsapp.com/send?phone=${PublicAPIGroup.pubGetMitraDetailsCall.phone(
                                          providerDetailPublicPagePubGetMitraDetailsResponse
                                              .jsonBody,
                                        )}');
                                      },
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchUrl(Uri(
                                          scheme: 'mailto',
                                          path: PublicAPIGroup
                                              .pubGetMitraDetailsCall
                                              .email(
                                            providerDetailPublicPagePubGetMitraDetailsResponse
                                                .jsonBody,
                                          )!,
                                        ));
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/gmail_new_logo_icon_159149.png',
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
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
                                0.0, 10.0, 0.0, 10.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData(FFLocalizations.of(context).getText(
                                  '6g4dlnt7' /* Digital Products */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  't4f8xbox' /* Services */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  '96h1ycz3' /* Articles */,
                                ))
                              ],
                              onChanged: (val) => safeSetState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .sbcarePrimaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).info,
                                iconSize: 16.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .sbCareLightColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 16.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [
                                  FFLocalizations.of(context).getText(
                                    'nwqzp58n' /* Digital Products */,
                                  )
                                ],
                              ),
                              wrapped: true,
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (_model.choiceChipsValue ==
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Digital Products',
                                    idText: 'Produk Digital',
                                  )) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 24.0),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                          imageUrl: random_data
                                                              .randomImageUrl(
                                                            0,
                                                            0,
                                                          ),
                                                          fit: BoxFit.contain,
                                                          errorWidget: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                        allowRotation: false,
                                                        tag: random_data
                                                            .randomImageUrl(
                                                          0,
                                                          0,
                                                        ),
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: random_data
                                                      .randomImageUrl(
                                                    0,
                                                    0,
                                                  ),
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: random_data
                                                          .randomImageUrl(
                                                        0,
                                                        0,
                                                      ),
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'y7mntxgr' /* Panduan Napas Anti-Mual Trimes... */,
                                                      ),
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
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallIsCustom,
                                                          ),
                                                    ),
                                                    AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'daie6ara' /* Rp 50.000,00 */,
                                                      ),
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
                                                                fontSize: 11.0,
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
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      ProductDetailPublicPageWidget
                                                          .routeName,
                                                      pathParameters: {
                                                        'slug': serializeParam(
                                                          widget.slug,
                                                          ParamType.String,
                                                        ),
                                                        'productSlug':
                                                            serializeParam(
                                                          'produk-digital',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
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
                                                    'jw8ytllv' /* Purchase */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
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
                                      ),
                                      Container(
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                          imageUrl: random_data
                                                              .randomImageUrl(
                                                            0,
                                                            0,
                                                          ),
                                                          fit: BoxFit.contain,
                                                          errorWidget: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                        allowRotation: false,
                                                        tag: random_data
                                                            .randomImageUrl(
                                                          0,
                                                          0,
                                                        ),
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: random_data
                                                      .randomImageUrl(
                                                    0,
                                                    0,
                                                  ),
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: random_data
                                                          .randomImageUrl(
                                                        0,
                                                        0,
                                                      ),
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'w8wpnttj' /* Ebook Posisi Nyaman Tidur Ibu ... */,
                                                      ),
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
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallIsCustom,
                                                          ),
                                                    ),
                                                    AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'r2j02eoj' /* Rp 30.000,00 */,
                                                      ),
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
                                                                fontSize: 11.0,
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
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      ProductDetailPublicPageWidget
                                                          .routeName,
                                                      pathParameters: {
                                                        'slug': serializeParam(
                                                          widget.slug,
                                                          ParamType.String,
                                                        ),
                                                        'productSlug':
                                                            serializeParam(
                                                          'produk-digital',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
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
                                                    '146nb1mr' /* Purchase */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
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
                                      ),
                                      Container(
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                          imageUrl: random_data
                                                              .randomImageUrl(
                                                            0,
                                                            0,
                                                          ),
                                                          fit: BoxFit.contain,
                                                          errorWidget: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                        allowRotation: false,
                                                        tag: random_data
                                                            .randomImageUrl(
                                                          0,
                                                          0,
                                                        ),
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: random_data
                                                      .randomImageUrl(
                                                    0,
                                                    0,
                                                  ),
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: random_data
                                                          .randomImageUrl(
                                                        0,
                                                        0,
                                                      ),
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'sjwd6mu6' /* Template Jadwal Latihan Prenat... */,
                                                      ),
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
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallIsCustom,
                                                          ),
                                                    ),
                                                    AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'bqepeqfm' /* Rp 70.000,00 */,
                                                      ),
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
                                                                fontSize: 11.0,
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
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      ProductDetailPublicPageWidget
                                                          .routeName,
                                                      pathParameters: {
                                                        'slug': serializeParam(
                                                          widget.slug,
                                                          ParamType.String,
                                                        ),
                                                        'productSlug':
                                                            serializeParam(
                                                          'produk-digital',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
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
                                                    '5afko6rq' /* Purchase */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
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
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                );
                              } else if (_model.choiceChipsValue ==
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Services',
                                    idText: 'Layanan',
                                  )) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 24.0),
                                  child: Builder(
                                    builder: (context) {
                                      final listServices =
                                          PublicAPIGroup.pubGetMitraDetailsCall
                                                  .allClasses(
                                                    providerDetailPublicPagePubGetMitraDetailsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listServices.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 8.0),
                                        itemBuilder:
                                            (context, listServicesIndex) {
                                          final listServicesItem =
                                              listServices[listServicesIndex];
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              getJsonField(
                                                                listServicesItem,
                                                                r'''$..image_program_class''',
                                                              ).toString(),
                                                              fit: BoxFit
                                                                  .contain,
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                'assets/images/error_image.jpg',
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: getJsonField(
                                                              listServicesItem,
                                                              r'''$..image_program_class''',
                                                            ).toString(),
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: getJsonField(
                                                        listServicesItem,
                                                        r'''$..image_program_class''',
                                                      ).toString(),
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        child: Image.network(
                                                          getJsonField(
                                                            listServicesItem,
                                                            r'''$..image_program_class''',
                                                          ).toString(),
                                                          width: 80.0,
                                                          height: 80.0,
                                                          fit: BoxFit.scaleDown,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            width: 80.0,
                                                            height: 80.0,
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
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            getJsonField(
                                                              listServicesItem,
                                                              r'''$..name_program_class''',
                                                            ).toString(),
                                                            maxLines: 3,
                                                            minFontSize: 12.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmallIsCustom,
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
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                );
                              }
                            },
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
