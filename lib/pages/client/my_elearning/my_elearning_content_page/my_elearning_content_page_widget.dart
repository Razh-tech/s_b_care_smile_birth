import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/empty_list_module_content_component/empty_list_module_content_component_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_elearning_content_page_model.dart';
export 'my_elearning_content_page_model.dart';

class MyElearningContentPageWidget extends StatefulWidget {
  const MyElearningContentPageWidget({
    super.key,
    this.uuidModule,
  });

  final String? uuidModule;

  static String routeName = 'MyElearningContentPage';
  static String routePath = 'my-elearning/:uuidModule';

  @override
  State<MyElearningContentPageWidget> createState() =>
      _MyElearningContentPageWidgetState();
}

class _MyElearningContentPageWidgetState
    extends State<MyElearningContentPageWidget> {
  late MyElearningContentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyElearningContentPageModel());

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
            ..complete(ModuleClientGroup.getClientModuleDetailsCall.call(
              token: FFAppState().token,
              uuidUserModule: widget.uuidModule,
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
        final myElearningContentPageGetClientModuleDetailsResponse =
            snapshot.data!;

        return Title(
            title: 'My E-Learning Content | SBCare - SmileBirth',
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
                      '8o1ndofa' /* My E-Learning Content */,
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
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: SingleChildScrollView(
                      controller: _model.columnController,
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
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      ModuleClientGroup
                                          .getClientModuleDetailsCall
                                          .modulTitle(
                                        myElearningContentPageGetClientModuleDetailsResponse
                                            .jsonBody,
                                      ),
                                      'SBCare Module',
                                    ),
                                    textAlign: TextAlign.center,
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color: FlutterFlowTheme.of(context)
                                        .sbcarePrimaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final listSubmodules = getJsonField(
                                  myElearningContentPageGetClientModuleDetailsResponse
                                      .jsonBody,
                                  r'''$.data''',
                                ).toList();
                                if (listSubmodules.isEmpty) {
                                  return EmptyListModuleContentComponentWidget();
                                }

                                return RefreshIndicator(
                                  color: FlutterFlowTheme.of(context)
                                      .sbcarePrimaryColor,
                                  onRefresh: () async {
                                    safeSetState(() =>
                                        _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleted();
                                  },
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listSubmodules.length,
                                    itemBuilder:
                                        (context, listSubmodulesIndex) {
                                      final listSubmodulesItem =
                                          listSubmodules[listSubmodulesIndex];
                                      return Container(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Container(
                                            color: Colors.white,
                                            child: ExpandableNotifier(
                                              initialExpanded: false,
                                              child: ExpandablePanel(
                                                header: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    getJsonField(
                                                      listSubmodulesItem,
                                                      r'''$.submodul_title''',
                                                    ).toString(),
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
                                                collapsed: Container(),
                                                expanded: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        getJsonField(
                                                          listSubmodulesItem,
                                                          r'''$.submodul_duration''',
                                                        ).toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: Color(
                                                                  0x8A000000),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                ContentViewerPageWidget
                                                                    .routeName,
                                                                pathParameters:
                                                                    {
                                                                  'contentUrl':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      listSubmodulesItem,
                                                                      r'''$.submodul_url''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'contentTitle':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      listSubmodulesItem,
                                                                      r'''$.submodul_title''',
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
                                                                            .bottomToTop,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'owz710f4' /* View Module */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 30.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
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
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 2.0,
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
                                                      ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                  expandIcon: Icons
                                                      .expand_circle_down_outlined,
                                                  collapseIcon: Icons.close,
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .sbcarePrimaryColor,
                                                ),
                                              ),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .sbCareLightColor,
                                  ),
                                ),
                                child: Visibility(
                                  visible: widget.uuidModule ==
                                      '01a11c8f-3d26-7174-ab97-6649345fdf31',
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 5.0),
                                    child: FlutterFlowWebView(
                                      content:
                                          'https://elearning.sbcare.co.id/active-birth/active-birth-interactive-guide.html',
                                      bypass: false,
                                      width: MediaQuery.sizeOf(context).width >=
                                              1280.0
                                          ? (MediaQuery.sizeOf(context).width *
                                              0.9)
                                          : MediaQuery.sizeOf(context).width,
                                      height: MediaQuery.sizeOf(context)
                                                  .width >=
                                              1280.0
                                          ? (MediaQuery.sizeOf(context).height *
                                              0.8)
                                          : (MediaQuery.sizeOf(context).height *
                                              0.7),
                                      verticalScroll: true,
                                      horizontalScroll: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].addToEnd(SizedBox(height: 40.0)),
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
