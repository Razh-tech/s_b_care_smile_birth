import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
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
import 'e_learning_detail_sheet_public_model.dart';
export 'e_learning_detail_sheet_public_model.dart';

class ELearningDetailSheetPublicWidget extends StatefulWidget {
  const ELearningDetailSheetPublicWidget({
    super.key,
    this.uuidModule,
  });

  final String? uuidModule;

  @override
  State<ELearningDetailSheetPublicWidget> createState() =>
      _ELearningDetailSheetPublicWidgetState();
}

class _ELearningDetailSheetPublicWidgetState
    extends State<ELearningDetailSheetPublicWidget> {
  late ELearningDetailSheetPublicModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ELearningDetailSheetPublicModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(PublicAPIGroup.pubGetElearningShopDetailsCall.call(
              uuidModul: widget.uuidModule,
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
                color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                size: 50.0,
              ),
            ),
          );
        }
        final columnPubGetElearningShopDetailsResponse = snapshot.data!;

        return RefreshIndicator(
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
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl: PublicAPIGroup
                                              .pubGetElearningShopDetailsCall
                                              .moduleImage(
                                            columnPubGetElearningShopDetailsResponse
                                                .jsonBody,
                                          )!,
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: PublicAPIGroup
                                            .pubGetElearningShopDetailsCall
                                            .moduleImage(
                                          columnPubGetElearningShopDetailsResponse
                                              .jsonBody,
                                        )!,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: PublicAPIGroup
                                      .pubGetElearningShopDetailsCall
                                      .moduleImage(
                                    columnPubGetElearningShopDetailsResponse
                                        .jsonBody,
                                  )!,
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: PublicAPIGroup
                                          .pubGetElearningShopDetailsCall
                                          .moduleImage(
                                        columnPubGetElearningShopDetailsResponse
                                            .jsonBody,
                                      )!,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    PublicAPIGroup
                                        .pubGetElearningShopDetailsCall
                                        .moduleTitle(
                                      columnPubGetElearningShopDetailsResponse
                                          .jsonBody,
                                    ),
                                    '-',
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 3,
                                  minFontSize: 12.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .sbcarePrimaryColor,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    PublicAPIGroup
                                        .pubGetElearningShopDetailsCall
                                        .moduleDescription(
                                      columnPubGetElearningShopDetailsResponse
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
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      '36m3nshk' /* Module Content */,
                                    ),
                                    textAlign: TextAlign.center,
                                    minFontSize: 12.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          color: FlutterFlowTheme.of(context)
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
                              final listSubmodules =
                                  PublicAPIGroup.pubGetElearningShopDetailsCall
                                          .allSubModule(
                                            columnPubGetElearningShopDetailsResponse
                                                .jsonBody,
                                          )
                                          ?.toList() ??
                                      [];

                              return RefreshIndicator(
                                color: FlutterFlowTheme.of(context)
                                    .sbcarePrimaryColor,
                                onRefresh: () async {
                                  safeSetState(
                                      () => _model.apiRequestCompleter = null);
                                  await _model.waitForApiRequestCompleted();
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listSubmodules.length,
                                  itemBuilder: (context, listSubmodulesIndex) {
                                    final listSubmodulesItem =
                                        listSubmodules[listSubmodulesIndex];
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '- ${getJsonField(
                                            listSubmodulesItem,
                                            r'''$.submodul_title''',
                                          ).toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmallFamily,
                                                color: Colors.black,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 30.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      ELearningCheckoutPageWidget.routeName,
                                      pathParameters: {
                                        'uuidModule': serializeParam(
                                          widget.uuidModule,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'x4ztcwhj' /* Purchase E-Learning */,
                                  ),
                                  icon: Icon(
                                    Icons.shopping_cart_checkout_outlined,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 35.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor:
                                        FlutterFlowTheme.of(context).info,
                                    color: FlutterFlowTheme.of(context)
                                        .sbcarePrimaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
  }
}
