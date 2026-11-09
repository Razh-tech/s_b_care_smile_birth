import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'ebook_detail_page_model.dart';
export 'ebook_detail_page_model.dart';

class EbookDetailPageWidget extends StatefulWidget {
  const EbookDetailPageWidget({
    super.key,
    required this.uuidEbook,
  });

  final String? uuidEbook;

  static String routeName = 'EbookDetailPage';
  static String routePath = 'ebook/:uuidEbook';

  @override
  State<EbookDetailPageWidget> createState() => _EbookDetailPageWidgetState();
}

class _EbookDetailPageWidgetState extends State<EbookDetailPageWidget> {
  late EbookDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EbookDetailPageModel());

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
            ..complete(EbookGroup.getEbookShopDetailsCall.call(
              token: FFAppState().token,
              uuidEbook: widget.uuidEbook,
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
        final ebookDetailPageGetEbookShopDetailsResponse = snapshot.data!;

        return Title(
            title: 'Program Details | SBCare - SmileBirth',
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
                  automaticallyImplyLeading: true,
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
                      '9ealf4gn' /* Program Details */,
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
                  child: RefreshIndicator(
                    color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                    onRefresh: () async {
                      safeSetState(() => _model.apiRequestCompleter = null);
                      await _model.waitForApiRequestCompleted();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: _model.columnController,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: EbookGroup
                                                .getEbookShopDetailsCall
                                                .cover(
                                              ebookDetailPageGetEbookShopDetailsResponse
                                                  .jsonBody,
                                            )!,
                                            fit: BoxFit.scaleDown,
                                            errorWidget:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.jpg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: AutoSizeText(
                                            valueOrDefault<String>(
                                              EbookGroup.getEbookShopDetailsCall
                                                  .title(
                                                ebookDetailPageGetEbookShopDetailsResponse
                                                    .jsonBody,
                                              ),
                                              '-',
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 3,
                                            minFontSize: 12.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: AutoSizeText(
                                            valueOrDefault<String>(
                                              EbookGroup.getEbookShopDetailsCall
                                                  .description(
                                                ebookDetailPageGetEbookShopDetailsResponse
                                                    .jsonBody,
                                              ),
                                              '-',
                                            ),
                                            textAlign: TextAlign.start,
                                            minFontSize: 12.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .sbcarePrimaryColor,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0u6gowj3' /* Program Content */,
                                              ),
                                              textAlign: TextAlign.center,
                                              minFontSize: 12.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final listCatalogues =
                                            EbookGroup.getEbookShopDetailsCall
                                                    .allCatalogue(
                                                      ebookDetailPageGetEbookShopDetailsResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];

                                        return RefreshIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .sbcarePrimaryColor,
                                          onRefresh: () async {
                                            safeSetState(() => _model
                                                .apiRequestCompleter = null);
                                            await _model
                                                .waitForApiRequestCompleted();
                                          },
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listCatalogues.length,
                                            itemBuilder:
                                                (context, listCataloguesIndex) {
                                              final listCataloguesItem =
                                                  listCatalogues[
                                                      listCataloguesIndex];
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '- ${getJsonField(
                                                      listCataloguesItem,
                                                      r'''$.catalogue_title''',
                                                    ).toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmallFamily,
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmallIsCustom,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 30.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.balanceResult =
                                                await UserGroup
                                                    .getUserWalletCall
                                                    .call(
                                              token: FFAppState().token,
                                            );

                                            FFAppState().sbpayBalance =
                                                UserGroup.getUserWalletCall
                                                    .walletBalance(
                                              (_model.balanceResult?.jsonBody ??
                                                  ''),
                                            )!;
                                            FFAppState().update(() {});
                                            if (FFAppState().sbpayBalance >=
                                                EbookGroup
                                                    .getEbookShopDetailsCall
                                                    .price(
                                                  ebookDetailPageGetEbookShopDetailsResponse
                                                      .jsonBody,
                                                )!) {
                                              context.pushNamed(
                                                EbookCheckoutPageWidget
                                                    .routeName,
                                                pathParameters: {
                                                  'uuidEbook': serializeParam(
                                                    EbookGroup
                                                        .getEbookShopDetailsCall
                                                        .uidEbook(
                                                      ebookDetailPageGetEbookShopDetailsResponse
                                                          .jsonBody,
                                                    ),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                  ),
                                                },
                                              );
                                            } else {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'SBPay Status',
                                                                idText:
                                                                    'Status SBPay',
                                                              )),
                                                              content: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'Your balance is insufficient',
                                                                idText:
                                                                    'Saldo Anda tidak mencukupi',
                                                              )),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText:
                                                                        'Cancel',
                                                                    idText:
                                                                        'Batalkan',
                                                                  )),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Top up'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                context.pushNamed(
                                                  TopupPageWidget.routeName,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                    ),
                                                  },
                                                );
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'lifku2dl' /* Purchase Program */,
                                          ),
                                          icon: Icon(
                                            Icons
                                                .shopping_cart_checkout_outlined,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            color: FlutterFlowTheme.of(context)
                                                .sbcarePrimaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].addToEnd(SizedBox(height: 60.0)),
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
