import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/client/home/contraction_timer/contraction_timer_pro_full_description_component/contraction_timer_pro_full_description_component_widget.dart';
import '/pages/client/home/contraction_timer/empty_list_contraction_timer_pro_component/empty_list_contraction_timer_pro_component_widget.dart';
import '/pages/client/my_ebook/empty_list_my_ebook_component/empty_list_my_ebook_component_widget.dart';
import '/pages/client/my_ebook/empty_search_my_ebook_component/empty_search_my_ebook_component_widget.dart';
import '/pages/client/my_elearning/empty_list_my_e_learning_component/empty_list_my_e_learning_component_widget.dart';
import '/pages/navbar/components/empty_search_my_module_component/empty_search_my_module_component_widget.dart';
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
import 'module_navbar_model.dart';
export 'module_navbar_model.dart';

class ModuleNavbarWidget extends StatefulWidget {
  const ModuleNavbarWidget({super.key});

  static String routeName = 'ModuleNavbar';
  static String routePath = 'module';

  @override
  State<ModuleNavbarWidget> createState() => _ModuleNavbarWidgetState();
}

class _ModuleNavbarWidgetState extends State<ModuleNavbarWidget>
    with TickerProviderStateMixin {
  late ModuleNavbarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModuleNavbarModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.searchElearningTFTextController ??= TextEditingController();
    _model.searchElearningTFFocusNode ??= FocusNode();
    _model.searchElearningTFFocusNode!.addListener(() => safeSetState(() {}));
    _model.searchEbookTFTextController ??= TextEditingController();
    _model.searchEbookTFFocusNode ??= FocusNode();
    _model.searchEbookTFFocusNode!.addListener(() => safeSetState(() {}));
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
        title: 'My Module | SBCare - SmileBirth',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).sbcarePrimaryColor,
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getText(
                  'd4u8leki' /* My Module */,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              isScrollable: true,
                              tabAlignment: TabAlignment.center,
                              labelColor: FlutterFlowTheme.of(context)
                                  .sbcarePrimaryColor,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).sbCareLightColor,
                              labelPadding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleMediumIsCustom,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleMediumIsCustom,
                                  ),
                              indicatorColor: FlutterFlowTheme.of(context)
                                  .sbcarePrimaryColor,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'm537n1hm' /* E-Learning */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '9ds3y469' /* Program */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'gshh06m1' /* Contraction */,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .sbCareLightColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .searchElearningTFTextController,
                                                    focusNode: _model
                                                        .searchElearningTFFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.searchElearningTFTextController',
                                                      Duration(
                                                          milliseconds: 1000),
                                                      () async {
                                                        await Future.wait([
                                                          Future(() async {
                                                            safeSetState(() {
                                                              _model.simpleSearchResults1 = TextSearch((FFAppState()
                                                                              .searchState
                                                                          as List)
                                                                      .cast<
                                                                          String>()
                                                                      .map((str) =>
                                                                          TextSearchItem.fromTerms(
                                                                              str,
                                                                              [
                                                                                str
                                                                              ]))
                                                                      .toList())
                                                                  .search(_model
                                                                      .searchElearningTFTextController
                                                                      .text)
                                                                  .map((r) =>
                                                                      r.object)
                                                                  .toList();
                                                              ;
                                                            });
                                                          }),
                                                          Future(() async {
                                                            _model.isModuleFullList =
                                                                false;
                                                            _model.searchKeyword =
                                                                _model
                                                                    .searchElearningTFTextController
                                                                    .text;
                                                          }),
                                                        ]);
                                                        safeSetState(() => _model
                                                                .apiRequestCompleter3 =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted3();
                                                      },
                                                    ),
                                                    autofocus: false,
                                                    autofillHints: [
                                                      AutofillHints.name
                                                    ],
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .words,
                                                    textInputAction:
                                                        TextInputAction.search,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'w6ef39v4' /* Input E-Learning title */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbCareLightColor,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbCareLightColor,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      prefixIcon: Icon(
                                                        Icons.search_outlined,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbcarePrimaryColor,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.name,
                                                    validator: _model
                                                        .searchElearningTFTextControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      if (!isAndroid && !isiOS)
                                                        TextInputFormatter
                                                            .withFunction(
                                                                (oldValue,
                                                                    newValue) {
                                                          return TextEditingValue(
                                                            selection: newValue
                                                                .selection,
                                                            text: newValue.text
                                                                .toCapitalization(
                                                                    TextCapitalization
                                                                        .words),
                                                          );
                                                        }),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
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
                                                    safeSetState(() {
                                                      _model
                                                          .searchElearningTFTextController
                                                          ?.clear();
                                                    });
                                                    _model.isModuleFullList =
                                                        true;
                                                    safeSetState(() {});
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter3 =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted3();
                                                  },
                                                  child: Icon(
                                                    Icons.close_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              if (_model.isModuleFullList) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: (_model
                                                                .apiRequestCompleter5 ??=
                                                            Completer<
                                                                ApiCallResponse>()
                                                              ..complete(
                                                                  GetListModuleClientCall
                                                                      .call(
                                                                token:
                                                                    FFAppState()
                                                                        .token,
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitDualRing(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final listModulesGVGetListModuleClientResponse =
                                                          snapshot.data!;

                                                      return Builder(
                                                        builder: (context) {
                                                          final listModuleClient =
                                                              getJsonField(
                                                            listModulesGVGetListModuleClientResponse
                                                                .jsonBody,
                                                            r'''$.data''',
                                                          ).toList();
                                                          if (listModuleClient
                                                              .isEmpty) {
                                                            return EmptyListMyELearningComponentWidget();
                                                          }

                                                          return RefreshIndicator(
                                                            key: Key(
                                                                'RefreshIndicator_l0ff5tjq'),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .sbcarePrimaryColor,
                                                            onRefresh:
                                                                () async {
                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter5 =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted5();
                                                            },
                                                            child: GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                0,
                                                                0,
                                                                110.0,
                                                              ),
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      479.0) {
                                                                    return 1;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <=
                                                                      991.0) {
                                                                    return 2;
                                                                  } else {
                                                                    return 3;
                                                                  }
                                                                }(),
                                                                crossAxisSpacing:
                                                                    10.0,
                                                                mainAxisSpacing:
                                                                    16.0,
                                                                childAspectRatio:
                                                                    0.65,
                                                              ),
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listModuleClient
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listModuleClientIndex) {
                                                                final listModuleClientItem =
                                                                    listModuleClient[
                                                                        listModuleClientIndex];
                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          4.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sbCareLightColor,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                                                                              child: InkWell(
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
                                                                                          fadeInDuration: Duration(milliseconds: 500),
                                                                                          fadeOutDuration: Duration(milliseconds: 500),
                                                                                          imageUrl: getJsonField(
                                                                                            listModuleClientItem,
                                                                                            r'''$.modul_image''',
                                                                                          ).toString(),
                                                                                          fit: BoxFit.contain,
                                                                                          errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                            'assets/images/error_image.jpg',
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                        allowRotation: false,
                                                                                        tag: getJsonField(
                                                                                          listModuleClientItem,
                                                                                          r'''$.modul_image''',
                                                                                        ).toString(),
                                                                                        useHeroAnimation: true,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Hero(
                                                                                  tag: getJsonField(
                                                                                    listModuleClientItem,
                                                                                    r'''$.modul_image''',
                                                                                  ).toString(),
                                                                                  transitionOnUserGestures: true,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                      imageUrl: getJsonField(
                                                                                        listModuleClientItem,
                                                                                        r'''$.modul_image''',
                                                                                      ).toString(),
                                                                                      fit: BoxFit.scaleDown,
                                                                                      errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.jpg',
                                                                                        fit: BoxFit.scaleDown,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  listModuleClientItem,
                                                                                  r'''$.modul_title''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  listModuleClientItem,
                                                                                  r'''$.modul_description''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
                                                                                maxLines: 3,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FontStyle.italic,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'zjne3f7q' /* PRICE     :  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: getJsonField(
                                                                                                listModuleClientItem,
                                                                                                r'''$.formatted_modul_price''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'jo4ujsxm' /* EXP         :  */,
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
                                                                                              text: getJsonField(
                                                                                                listModuleClientItem,
                                                                                                r'''$.user_modul_end''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          if ((GetListModuleClientCall.userModulStatus(
                                                                                                listModulesGVGetListModuleClientResponse.jsonBody,
                                                                                              )?.elementAtOrNull(listModuleClientIndex)) ==
                                                                                              'ACTIVED') {
                                                                                            return RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'mirpi1md' /* STATUS  :  */,
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
                                                                                                      'wolyv7r6' /* ACTIVE */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontSize: 13.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      '3z9a64hm' /* STATUS :  */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'o3z09346' /* EXPIRED */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).pureRed,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if ((GetListModuleClientCall.userModulStatus(
                                                                                listModulesGVGetListModuleClientResponse.jsonBody,
                                                                              )?.elementAtOrNull(listModuleClientIndex)) ==
                                                                              'ACTIVED') {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 15.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      context.pushNamed(
                                                                                        MyElearningContentPageWidget.routeName,
                                                                                        pathParameters: {
                                                                                          'uuidModule': serializeParam(
                                                                                            getJsonField(
                                                                                              listModuleClientItem,
                                                                                              r'''$.uuid_modul''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          '__transition_info__': TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.bottomToTop,
                                                                                            duration: Duration(milliseconds: 500),
                                                                                          ),
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'ctecmbqa' /* View E-Learning */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.view_compact_rounded,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 30.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      color: FlutterFlowTheme.of(context).sbCareLightColor,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                          ),
                                                                                      elevation: 1.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 15.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        _model.balanceResult = await UserGroup.getUserWalletCall.call(
                                                                                          token: FFAppState().token,
                                                                                        );

                                                                                        FFAppState().sbpayBalance = UserGroup.getUserWalletCall.walletBalance(
                                                                                          (_model.balanceResult?.jsonBody ?? ''),
                                                                                        )!;
                                                                                        FFAppState().update(() {});
                                                                                        if (FFAppState().sbpayBalance >=
                                                                                            getJsonField(
                                                                                              listModuleClientItem,
                                                                                              r'''$.modul_price''',
                                                                                            )) {
                                                                                          context.pushNamed(
                                                                                            MyELearningRenewalPageWidget.routeName,
                                                                                            pathParameters: {
                                                                                              'uuidModule': serializeParam(
                                                                                                getJsonField(
                                                                                                  listModuleClientItem,
                                                                                                  r'''$.uuid_modul''',
                                                                                                ).toString(),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            queryParameters: {
                                                                                              'uuidUserModule': serializeParam(
                                                                                                getJsonField(
                                                                                                  listModuleClientItem,
                                                                                                  r'''$.uuid_user_modul''',
                                                                                                ).toString(),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              '__transition_info__': TransitionInfo(
                                                                                                hasTransition: true,
                                                                                                transitionType: PageTransitionType.bottomToTop,
                                                                                                duration: Duration(milliseconds: 500),
                                                                                              ),
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return WebViewAware(
                                                                                                    child: AlertDialog(
                                                                                                      title: Text(FFLocalizations.of(context).getVariableText(
                                                                                                        enText: 'SBPay Status',
                                                                                                        idText: 'Status SBPay',
                                                                                                      )),
                                                                                                      content: Text(FFLocalizations.of(context).getVariableText(
                                                                                                        enText: 'Your balance is insufficient',
                                                                                                        idText: 'Saldo Anda tidak mencukupi',
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
                                                                                              TopupPageWidget.routeName,
                                                                                              extra: <String, dynamic>{
                                                                                                '__transition_info__': TransitionInfo(
                                                                                                  hasTransition: true,
                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                  duration: Duration(milliseconds: 500),
                                                                                                ),
                                                                                              },
                                                                                            );
                                                                                          }
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'tjzk13lh' /* Renew E-Learning */,
                                                                                      ),
                                                                                      icon: Icon(
                                                                                        Icons.add_shopping_cart_outlined,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconColor: Colors.black,
                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: Colors.black,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                            ),
                                                                                        elevation: 1.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      context.pushNamed(
                                                                                        ELearningRedeemCodePageWidget.routeName,
                                                                                        pathParameters: {
                                                                                          'uuidModule': serializeParam(
                                                                                            getJsonField(
                                                                                              listModuleClientItem,
                                                                                              r'''$.uuid_modul''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          '__transition_info__': TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.bottomToTop,
                                                                                            duration: Duration(milliseconds: 500),
                                                                                          ),
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '0fv8ytyq' /* Redeem Code */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.redeem_outlined,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: Colors.black,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                          ),
                                                                                      elevation: 1.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
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
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: (_model
                                                                .apiRequestCompleter3 ??=
                                                            Completer<
                                                                ApiCallResponse>()
                                                              ..complete(
                                                                  SearchModuleClientCall
                                                                      .call(
                                                                token:
                                                                    FFAppState()
                                                                        .token,
                                                                keyword: _model
                                                                    .searchKeyword,
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitDualRing(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final searchModulesGVSearchModuleClientResponse =
                                                          snapshot.data!;

                                                      return Builder(
                                                        builder: (context) {
                                                          final searchModuleClient =
                                                              getJsonField(
                                                            searchModulesGVSearchModuleClientResponse
                                                                .jsonBody,
                                                            r'''$.data''',
                                                          ).toList();
                                                          if (searchModuleClient
                                                              .isEmpty) {
                                                            return EmptySearchMyModuleComponentWidget();
                                                          }

                                                          return RefreshIndicator(
                                                            key: Key(
                                                                'RefreshIndicator_2se971kt'),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .sbcarePrimaryColor,
                                                            onRefresh:
                                                                () async {
                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter3 =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted3();
                                                            },
                                                            child: GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                0,
                                                                0,
                                                                110.0,
                                                              ),
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      479.0) {
                                                                    return 1;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <=
                                                                      991.0) {
                                                                    return 2;
                                                                  } else {
                                                                    return 3;
                                                                  }
                                                                }(),
                                                                crossAxisSpacing:
                                                                    10.0,
                                                                mainAxisSpacing:
                                                                    16.0,
                                                                childAspectRatio:
                                                                    0.65,
                                                              ),
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  searchModuleClient
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  searchModuleClientIndex) {
                                                                final searchModuleClientItem =
                                                                    searchModuleClient[
                                                                        searchModuleClientIndex];
                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          4.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sbCareLightColor,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                                                                              child: InkWell(
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
                                                                                          fadeInDuration: Duration(milliseconds: 500),
                                                                                          fadeOutDuration: Duration(milliseconds: 500),
                                                                                          imageUrl: getJsonField(
                                                                                            searchModuleClientItem,
                                                                                            r'''$.modul_image''',
                                                                                          ).toString(),
                                                                                          fit: BoxFit.contain,
                                                                                          errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                            'assets/images/error_image.jpg',
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                        allowRotation: false,
                                                                                        tag: getJsonField(
                                                                                          searchModuleClientItem,
                                                                                          r'''$.modul_image''',
                                                                                        ).toString(),
                                                                                        useHeroAnimation: true,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Hero(
                                                                                  tag: getJsonField(
                                                                                    searchModuleClientItem,
                                                                                    r'''$.modul_image''',
                                                                                  ).toString(),
                                                                                  transitionOnUserGestures: true,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                      imageUrl: getJsonField(
                                                                                        searchModuleClientItem,
                                                                                        r'''$.modul_image''',
                                                                                      ).toString(),
                                                                                      fit: BoxFit.scaleDown,
                                                                                      errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.jpg',
                                                                                        fit: BoxFit.scaleDown,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  searchModuleClientItem,
                                                                                  r'''$.modul_title''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  searchModuleClientItem,
                                                                                  r'''$.modul_description''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                '0nypo0yy' /* PRICE     :  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: getJsonField(
                                                                                                searchModuleClientItem,
                                                                                                r'''$.formatted_modul_price''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'bhmubvex' /* EXP         :  */,
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
                                                                                              text: getJsonField(
                                                                                                searchModuleClientItem,
                                                                                                r'''$.user_modul_end''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          if ((SearchModuleClientCall.userModulStatus(
                                                                                                searchModulesGVSearchModuleClientResponse.jsonBody,
                                                                                              )?.elementAtOrNull(searchModuleClientIndex)) ==
                                                                                              'ACTIVED') {
                                                                                            return RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'k0qgycnv' /* STATUS  :  */,
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
                                                                                                      'wgm0tmpe' /* ACTIVE */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontSize: 13.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      '3u80jsfi' /* STATUS :  */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'avqvxw1h' /* EXPIRED */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).pureRed,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if ((SearchModuleClientCall.userModulStatus(
                                                                                searchModulesGVSearchModuleClientResponse.jsonBody,
                                                                              )?.elementAtOrNull(searchModuleClientIndex)) ==
                                                                              'ACTIVED') {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 15.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      context.pushNamed(
                                                                                        MyElearningContentPageWidget.routeName,
                                                                                        pathParameters: {
                                                                                          'uuidModule': serializeParam(
                                                                                            getJsonField(
                                                                                              searchModuleClientItem,
                                                                                              r'''$.uuid_modul''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          '__transition_info__': TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.bottomToTop,
                                                                                            duration: Duration(milliseconds: 500),
                                                                                          ),
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '2h4q4zyr' /* View E-Learning */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.view_compact_rounded,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 30.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      color: FlutterFlowTheme.of(context).sbCareLightColor,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                          ),
                                                                                      elevation: 1.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 15.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        _model.balanceResult2 = await UserGroup.getUserWalletCall.call(
                                                                                          token: FFAppState().token,
                                                                                        );

                                                                                        FFAppState().sbpayBalance = UserGroup.getUserWalletCall.walletBalance(
                                                                                          (_model.balanceResult2?.jsonBody ?? ''),
                                                                                        )!;
                                                                                        FFAppState().update(() {});
                                                                                        if (FFAppState().sbpayBalance >=
                                                                                            getJsonField(
                                                                                              searchModuleClientItem,
                                                                                              r'''$.modul_price''',
                                                                                            )) {
                                                                                          context.pushNamed(
                                                                                            MyELearningRenewalPageWidget.routeName,
                                                                                            pathParameters: {
                                                                                              'uuidModule': serializeParam(
                                                                                                getJsonField(
                                                                                                  searchModuleClientItem,
                                                                                                  r'''$.uuid_modul''',
                                                                                                ).toString(),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            queryParameters: {
                                                                                              'uuidUserModule': serializeParam(
                                                                                                getJsonField(
                                                                                                  searchModuleClientItem,
                                                                                                  r'''$.uuid_user_modul''',
                                                                                                ).toString(),
                                                                                                ParamType.String,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              '__transition_info__': TransitionInfo(
                                                                                                hasTransition: true,
                                                                                                transitionType: PageTransitionType.bottomToTop,
                                                                                                duration: Duration(milliseconds: 500),
                                                                                              ),
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return WebViewAware(
                                                                                                    child: AlertDialog(
                                                                                                      title: Text(FFLocalizations.of(context).getVariableText(
                                                                                                        enText: 'SBPay Status',
                                                                                                        idText: 'Status SBPay',
                                                                                                      )),
                                                                                                      content: Text(FFLocalizations.of(context).getVariableText(
                                                                                                        enText: 'Your balance is insufficient',
                                                                                                        idText: 'Saldo Anda tidak mencukupi',
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
                                                                                              TopupPageWidget.routeName,
                                                                                              extra: <String, dynamic>{
                                                                                                '__transition_info__': TransitionInfo(
                                                                                                  hasTransition: true,
                                                                                                  transitionType: PageTransitionType.fade,
                                                                                                  duration: Duration(milliseconds: 500),
                                                                                                ),
                                                                                              },
                                                                                            );
                                                                                          }
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'xm3r0fw6' /* Renew E-Learning */,
                                                                                      ),
                                                                                      icon: Icon(
                                                                                        Icons.add_shopping_cart_outlined,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconColor: Colors.black,
                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: Colors.black,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                            ),
                                                                                        elevation: 1.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      context.pushNamed(
                                                                                        ELearningRedeemCodePageWidget.routeName,
                                                                                        pathParameters: {
                                                                                          'uuidModule': serializeParam(
                                                                                            getJsonField(
                                                                                              searchModuleClientItem,
                                                                                              r'''$.uuid_modul''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          '__transition_info__': TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.bottomToTop,
                                                                                            duration: Duration(milliseconds: 500),
                                                                                          ),
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'orwdojrq' /* Redeem Code */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.redeem_outlined,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: Colors.black,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: Colors.black,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                          ),
                                                                                      elevation: 1.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
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
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 15.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .sbCareLightColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .searchEbookTFTextController,
                                                    focusNode: _model
                                                        .searchEbookTFFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.searchEbookTFTextController',
                                                      Duration(
                                                          milliseconds: 1000),
                                                      () async {
                                                        await Future.wait([
                                                          Future(() async {
                                                            safeSetState(() {
                                                              _model.simpleSearchResults2 = TextSearch((FFAppState()
                                                                              .searchState
                                                                          as List)
                                                                      .cast<
                                                                          String>()
                                                                      .map((str) =>
                                                                          TextSearchItem.fromTerms(
                                                                              str,
                                                                              [
                                                                                str
                                                                              ]))
                                                                      .toList())
                                                                  .search(_model
                                                                      .searchEbookTFTextController
                                                                      .text)
                                                                  .map((r) =>
                                                                      r.object)
                                                                  .toList();
                                                              ;
                                                            });
                                                          }),
                                                          Future(() async {
                                                            _model.isModuleFullList =
                                                                false;
                                                            _model.searchKeyword =
                                                                _model
                                                                    .searchEbookTFTextController
                                                                    .text;
                                                          }),
                                                        ]);
                                                        safeSetState(() => _model
                                                                .apiRequestCompleter2 =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted2();
                                                      },
                                                    ),
                                                    autofocus: false,
                                                    autofillHints: [
                                                      AutofillHints.name
                                                    ],
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .words,
                                                    textInputAction:
                                                        TextInputAction.search,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'rjm4n36t' /* Input Program title */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbCareLightColor,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbCareLightColor,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      prefixIcon: Icon(
                                                        Icons.search_outlined,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbcarePrimaryColor,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.name,
                                                    validator: _model
                                                        .searchEbookTFTextControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      if (!isAndroid && !isiOS)
                                                        TextInputFormatter
                                                            .withFunction(
                                                                (oldValue,
                                                                    newValue) {
                                                          return TextEditingValue(
                                                            selection: newValue
                                                                .selection,
                                                            text: newValue.text
                                                                .toCapitalization(
                                                                    TextCapitalization
                                                                        .words),
                                                          );
                                                        }),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
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
                                                    safeSetState(() {
                                                      _model
                                                          .searchEbookTFTextController
                                                          ?.clear();
                                                    });
                                                    _model.isModuleFullList =
                                                        true;
                                                    safeSetState(() {});
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter2 =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted2();
                                                  },
                                                  child: Icon(
                                                    Icons.close_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              if (_model.isModuleFullList) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: (_model
                                                                .apiRequestCompleter4 ??=
                                                            Completer<
                                                                ApiCallResponse>()
                                                              ..complete(
                                                                  GetOwnedEbookListCall
                                                                      .call(
                                                                token:
                                                                    FFAppState()
                                                                        .token,
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitDualRing(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final listEbookGVGetOwnedEbookListResponse =
                                                          snapshot.data!;

                                                      return Builder(
                                                        builder: (context) {
                                                          final listOwnedEbook =
                                                              getJsonField(
                                                            listEbookGVGetOwnedEbookListResponse
                                                                .jsonBody,
                                                            r'''$.data''',
                                                          ).toList();
                                                          if (listOwnedEbook
                                                              .isEmpty) {
                                                            return EmptyListMyEbookComponentWidget();
                                                          }

                                                          return RefreshIndicator(
                                                            key: Key(
                                                                'RefreshIndicator_4e0io50e'),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .sbcarePrimaryColor,
                                                            onRefresh:
                                                                () async {
                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter4 =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted4();
                                                            },
                                                            child: GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                0,
                                                                0,
                                                                110.0,
                                                              ),
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      479.0) {
                                                                    return 1;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <=
                                                                      991.0) {
                                                                    return 2;
                                                                  } else {
                                                                    return 3;
                                                                  }
                                                                }(),
                                                                crossAxisSpacing:
                                                                    10.0,
                                                                mainAxisSpacing:
                                                                    16.0,
                                                                childAspectRatio:
                                                                    0.5,
                                                              ),
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listOwnedEbook
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listOwnedEbookIndex) {
                                                                final listOwnedEbookItem =
                                                                    listOwnedEbook[
                                                                        listOwnedEbookIndex];
                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          4.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sbCareLightColor,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                                                                              child: InkWell(
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
                                                                                          fadeInDuration: Duration(milliseconds: 500),
                                                                                          fadeOutDuration: Duration(milliseconds: 500),
                                                                                          imageUrl: getJsonField(
                                                                                            listOwnedEbookItem,
                                                                                            r'''$.ebook.cover''',
                                                                                          ).toString(),
                                                                                          fit: BoxFit.contain,
                                                                                          errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                            'assets/images/error_image.jpg',
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                        allowRotation: false,
                                                                                        tag: getJsonField(
                                                                                          listOwnedEbookItem,
                                                                                          r'''$.ebook.cover''',
                                                                                        ).toString(),
                                                                                        useHeroAnimation: true,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Hero(
                                                                                  tag: getJsonField(
                                                                                    listOwnedEbookItem,
                                                                                    r'''$.ebook.cover''',
                                                                                  ).toString(),
                                                                                  transitionOnUserGestures: true,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                      imageUrl: getJsonField(
                                                                                        listOwnedEbookItem,
                                                                                        r'''$.ebook.cover''',
                                                                                      ).toString(),
                                                                                      fit: BoxFit.scaleDown,
                                                                                      errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.jpg',
                                                                                        fit: BoxFit.scaleDown,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  listOwnedEbookItem,
                                                                                  r'''$.ebook.title''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  listOwnedEbookItem,
                                                                                  r'''$.ebook.description''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
                                                                                maxLines: 3,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FontStyle.italic,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'h6aedgcp' /* PRICE     :  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: getJsonField(
                                                                                                listOwnedEbookItem,
                                                                                                r'''$.formatted_price''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'bblvmdow' /* EXP         :  */,
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
                                                                                              text: getJsonField(
                                                                                                listOwnedEbookItem,
                                                                                                r'''$.expired_at''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          if ((GetOwnedEbookListCall.status(
                                                                                                listEbookGVGetOwnedEbookListResponse.jsonBody,
                                                                                              )?.elementAtOrNull(listOwnedEbookIndex)) ==
                                                                                              'ACTIVE') {
                                                                                            return RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'lcon0bq4' /* STATUS  :  */,
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
                                                                                                      'ppiilj5q' /* ACTIVE */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontSize: 13.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'ruygqxzy' /* STATUS :  */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      '9sy8s93f' /* EXPIRED */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).pureRed,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if ((GetOwnedEbookListCall.status(
                                                                                listEbookGVGetOwnedEbookListResponse.jsonBody,
                                                                              )?.elementAtOrNull(listOwnedEbookIndex)) ==
                                                                              'ACTIVE') {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 15.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      context.pushNamed(
                                                                                        MyEbookContentPageWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'uuidEbook': serializeParam(
                                                                                            getJsonField(
                                                                                              listOwnedEbookItem,
                                                                                              r'''$.uuid_ebook''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'ebookTitle': serializeParam(
                                                                                            getJsonField(
                                                                                              listOwnedEbookItem,
                                                                                              r'''$.ebook.title''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'ebookDesc': serializeParam(
                                                                                            getJsonField(
                                                                                              listOwnedEbookItem,
                                                                                              r'''$.ebook.description''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'o7thqgju' /* View Program */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.view_compact_rounded,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      color: FlutterFlowTheme.of(context).sbCareLightColor,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                          ),
                                                                                      elevation: 1.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 15.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        context.pushNamed(
                                                                                          MyEbookRenewalPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'uuidEbook': serializeParam(
                                                                                              getJsonField(
                                                                                                listOwnedEbookItem,
                                                                                                r'''$.uuid_ebook''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'uuidUserEbook': serializeParam(
                                                                                              getJsonField(
                                                                                                listOwnedEbookItem,
                                                                                                r'''$.uuid_user_ebook''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            '__transition_info__': TransitionInfo(
                                                                                              hasTransition: true,
                                                                                              transitionType: PageTransitionType.bottomToTop,
                                                                                              duration: Duration(milliseconds: 500),
                                                                                            ),
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'nexkmrcl' /* Renew Program */,
                                                                                      ),
                                                                                      icon: Icon(
                                                                                        Icons.add_shopping_cart_outlined,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconColor: Colors.black,
                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: Colors.black,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                            ),
                                                                                        elevation: 1.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      context.pushNamed(
                                                                                        EbookRedeemCodePageWidget.routeName,
                                                                                        pathParameters: {
                                                                                          'uuidEbook': serializeParam(
                                                                                            getJsonField(
                                                                                              listOwnedEbookItem,
                                                                                              r'''$.uuid_ebook''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          '__transition_info__': TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.bottomToTop,
                                                                                            duration: Duration(milliseconds: 500),
                                                                                          ),
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'm14wq2os' /* Redeem Code */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.redeem_outlined,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: Colors.black,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: Colors.black,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                          ),
                                                                                      elevation: 1.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
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
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: (_model
                                                                .apiRequestCompleter2 ??=
                                                            Completer<
                                                                ApiCallResponse>()
                                                              ..complete(
                                                                  SearchOwnedEbookListCall
                                                                      .call(
                                                                token:
                                                                    FFAppState()
                                                                        .token,
                                                                keyword: _model
                                                                    .searchKeyword,
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitDualRing(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final searchEbookGVSearchOwnedEbookListResponse =
                                                          snapshot.data!;

                                                      return Builder(
                                                        builder: (context) {
                                                          final searchEbook =
                                                              getJsonField(
                                                            searchEbookGVSearchOwnedEbookListResponse
                                                                .jsonBody,
                                                            r'''$.data''',
                                                          ).toList();
                                                          if (searchEbook
                                                              .isEmpty) {
                                                            return EmptySearchMyEbookComponentWidget();
                                                          }

                                                          return RefreshIndicator(
                                                            key: Key(
                                                                'RefreshIndicator_do1fpehh'),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .sbcarePrimaryColor,
                                                            onRefresh:
                                                                () async {
                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter2 =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted2();
                                                            },
                                                            child: GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                0,
                                                                0,
                                                                110.0,
                                                              ),
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      479.0) {
                                                                    return 1;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <=
                                                                      991.0) {
                                                                    return 2;
                                                                  } else {
                                                                    return 3;
                                                                  }
                                                                }(),
                                                                crossAxisSpacing:
                                                                    10.0,
                                                                mainAxisSpacing:
                                                                    16.0,
                                                                childAspectRatio:
                                                                    0.5,
                                                              ),
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  searchEbook
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  searchEbookIndex) {
                                                                final searchEbookItem =
                                                                    searchEbook[
                                                                        searchEbookIndex];
                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          4.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sbCareLightColor,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                                                                              child: InkWell(
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
                                                                                          fadeInDuration: Duration(milliseconds: 500),
                                                                                          fadeOutDuration: Duration(milliseconds: 500),
                                                                                          imageUrl: getJsonField(
                                                                                            searchEbookItem,
                                                                                            r'''$.ebook.cover''',
                                                                                          ).toString(),
                                                                                          fit: BoxFit.contain,
                                                                                          errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                            'assets/images/error_image.jpg',
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                        allowRotation: false,
                                                                                        tag: getJsonField(
                                                                                          searchEbookItem,
                                                                                          r'''$.ebook.cover''',
                                                                                        ).toString(),
                                                                                        useHeroAnimation: true,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Hero(
                                                                                  tag: getJsonField(
                                                                                    searchEbookItem,
                                                                                    r'''$.ebook.cover''',
                                                                                  ).toString(),
                                                                                  transitionOnUserGestures: true,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                      imageUrl: getJsonField(
                                                                                        searchEbookItem,
                                                                                        r'''$.ebook.cover''',
                                                                                      ).toString(),
                                                                                      fit: BoxFit.scaleDown,
                                                                                      errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.jpg',
                                                                                        fit: BoxFit.scaleDown,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  searchEbookItem,
                                                                                  r'''$.ebook.title''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  searchEbookItem,
                                                                                  r'''$.ebook.description''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                '61ub8h4p' /* PRICE     :  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: getJsonField(
                                                                                                searchEbookItem,
                                                                                                r'''$.formatted_price''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 13.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'knvkgrpc' /* EXP         :  */,
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
                                                                                              text: getJsonField(
                                                                                                searchEbookItem,
                                                                                                r'''$.expired_at''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          if ((SearchOwnedEbookListCall.status(
                                                                                                searchEbookGVSearchOwnedEbookListResponse.jsonBody,
                                                                                              )?.elementAtOrNull(searchEbookIndex)) ==
                                                                                              'ACTIVE') {
                                                                                            return RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      '6a93fa12' /* STATUS  :  */,
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
                                                                                                      'o5s7rlwd' /* ACTIVE */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontSize: 13.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      '3l59roy0' /* STATUS :  */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      '1dn0yqmz' /* EXPIRED */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).pureRed,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontSize: 14.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if ((SearchOwnedEbookListCall.status(
                                                                                searchEbookGVSearchOwnedEbookListResponse.jsonBody,
                                                                              )?.elementAtOrNull(searchEbookIndex)) ==
                                                                              'ACTIVE') {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 15.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      context.pushNamed(
                                                                                        MyEbookContentPageWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'uuidEbook': serializeParam(
                                                                                            getJsonField(
                                                                                              searchEbookItem,
                                                                                              r'''$.uuid_ebook''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'ebookTitle': serializeParam(
                                                                                            getJsonField(
                                                                                              searchEbookItem,
                                                                                              r'''$.ebook.title''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'ebookDesc': serializeParam(
                                                                                            getJsonField(
                                                                                              searchEbookItem,
                                                                                              r'''$.ebook.description''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'gda47ux3' /* View Program */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.view_compact_rounded,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: Colors.black,
                                                                                      color: FlutterFlowTheme.of(context).sbCareLightColor,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: Colors.black,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                          ),
                                                                                      elevation: 1.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 15.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        context.pushNamed(
                                                                                          MyEbookRenewalPageWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'uuidEbook': serializeParam(
                                                                                              getJsonField(
                                                                                                searchEbookItem,
                                                                                                r'''$.uuid_ebook''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'uuidUserEbook': serializeParam(
                                                                                              getJsonField(
                                                                                                searchEbookItem,
                                                                                                r'''$.uuid_user_ebook''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'ntyp4wpg' /* Renew Program */,
                                                                                      ),
                                                                                      icon: Icon(
                                                                                        Icons.add_shopping_cart_outlined,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                            ),
                                                                                        elevation: 1.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      context.pushNamed(
                                                                                        EbookRedeemCodePageWidget.routeName,
                                                                                        pathParameters: {
                                                                                          'uuidEbook': serializeParam(
                                                                                            getJsonField(
                                                                                              searchEbookItem,
                                                                                              r'''$.uuid_ebook''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          '__transition_info__': TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.bottomToTop,
                                                                                            duration: Duration(milliseconds: 500),
                                                                                          ),
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'yehz4b5b' /* Redeem Code */,
                                                                                    ),
                                                                                    icon: Icon(
                                                                                      Icons.redeem_outlined,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                          ),
                                                                                      elevation: 1.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
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
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 15.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: (_model
                                                        .apiRequestCompleter1 ??=
                                                    Completer<ApiCallResponse>()
                                                      ..complete(ProFeatureGroup
                                                          .getOwnedListContractionProCall
                                                          .call(
                                                        token:
                                                            FFAppState().token,
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .sbcarePrimaryColor,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final listContractionProGVGetOwnedListContractionProResponse =
                                                  snapshot.data!;

                                              return Builder(
                                                builder: (context) {
                                                  final myContractionProList =
                                                      ProFeatureGroup
                                                              .getOwnedListContractionProCall
                                                              .allData(
                                                                listContractionProGVGetOwnedListContractionProResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.toList() ??
                                                          [];
                                                  if (myContractionProList
                                                      .isEmpty) {
                                                    return EmptyListContractionTimerProComponentWidget();
                                                  }

                                                  return RefreshIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbcarePrimaryColor,
                                                    onRefresh: () async {
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter1 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted1();
                                                    },
                                                    child: GridView.builder(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        0,
                                                        0,
                                                        0,
                                                        70.0,
                                                      ),
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              479.0) {
                                                            return 1;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <=
                                                              991.0) {
                                                            return 2;
                                                          } else {
                                                            return 3;
                                                          }
                                                        }(),
                                                        crossAxisSpacing: 10.0,
                                                        mainAxisSpacing: 10.0,
                                                        childAspectRatio: 0.65,
                                                      ),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          myContractionProList
                                                              .length,
                                                      itemBuilder: (context,
                                                          myContractionProListIndex) {
                                                        final myContractionProListItem =
                                                            myContractionProList[
                                                                myContractionProListIndex];
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                offset: Offset(
                                                                  0.0,
                                                                  4.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbCareLightColor,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await Navigator
                                                                              .push(
                                                                            context,
                                                                            PageTransition(
                                                                              type: PageTransitionType.fade,
                                                                              child: FlutterFlowExpandedImageView(
                                                                                image: CachedNetworkImage(
                                                                                  fadeInDuration: Duration(milliseconds: 500),
                                                                                  fadeOutDuration: Duration(milliseconds: 500),
                                                                                  imageUrl: getJsonField(
                                                                                    myContractionProListItem,
                                                                                    r'''$.pro_feature.image''',
                                                                                  ).toString(),
                                                                                  fit: BoxFit.contain,
                                                                                  errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                    'assets/images/error_image.jpg',
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                                allowRotation: false,
                                                                                tag: getJsonField(
                                                                                  myContractionProListItem,
                                                                                  r'''$.pro_feature.image''',
                                                                                ).toString(),
                                                                                useHeroAnimation: true,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Hero(
                                                                          tag:
                                                                              getJsonField(
                                                                            myContractionProListItem,
                                                                            r'''$.pro_feature.image''',
                                                                          ).toString(),
                                                                          transitionOnUserGestures:
                                                                              true,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              fadeInDuration: Duration(milliseconds: 500),
                                                                              fadeOutDuration: Duration(milliseconds: 500),
                                                                              imageUrl: getJsonField(
                                                                                myContractionProListItem,
                                                                                r'''$.pro_feature.image''',
                                                                              ).toString(),
                                                                              fit: BoxFit.scaleDown,
                                                                              errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.jpg',
                                                                                fit: BoxFit.scaleDown,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          myContractionProListItem,
                                                                          r'''$.pro_feature.name''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            getJsonField(
                                                                              myContractionProListItem,
                                                                              r'''$.pro_feature.description''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                enableDrag: false,
                                                                                useSafeArea: true,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return WebViewAware(
                                                                                    child: GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(context).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: ContractionTimerProFullDescriptionComponentWidget(
                                                                                          title: getJsonField(
                                                                                            myContractionProListItem,
                                                                                            r'''$.pro_feature.name''',
                                                                                          ).toString(),
                                                                                          description: getJsonField(
                                                                                            myContractionProListItem,
                                                                                            r'''$.pro_feature.description''',
                                                                                          ).toString(),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'n8qmc2ie' /* View Full Description */,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    decoration: TextDecoration.underline,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          5.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'e29ktvla' /* EXP         :  */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: getJsonField(
                                                                                        myContractionProListItem,
                                                                                        r'''$.expired_date''',
                                                                                      ).toString(),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontSize: 13.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  if ((ProFeatureGroup.getOwnedListContractionProCall
                                                                                          .status(
                                                                                            listContractionProGVGetOwnedListContractionProResponse.jsonBody,
                                                                                          )
                                                                                          ?.elementAtOrNull(myContractionProListIndex)) ==
                                                                                      'active') {
                                                                                    return RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              'ml8rd3cw' /* STATUS :  */,
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
                                                                                              'dvuwisjr' /* ACTIVE */,
                                                                                            ),
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 13.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              'gjuix6wv' /* STATUS   :  */,
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
                                                                                              'ks827q7g' /* EXPIRED */,
                                                                                            ),
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 13.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              fontSize: 12.0,
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
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if ((ProFeatureGroup.getOwnedListContractionProCall
                                                                                .status(
                                                                                  listContractionProGVGetOwnedListContractionProResponse.jsonBody,
                                                                                )
                                                                                ?.elementAtOrNull(myContractionProListIndex)) ==
                                                                            'active') {
                                                                          return FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                MyContractionTimerProDetailsPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'uidUserProFeature': serializeParam(
                                                                                    getJsonField(
                                                                                      myContractionProListItem,
                                                                                      r'''$.uuid_user_pro_feature''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  '__transition_info__': TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.rightToLeft,
                                                                                    duration: Duration(milliseconds: 500),
                                                                                  ),
                                                                                },
                                                                              );
                                                                            },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'hpi8w254' /* View Contraction Pro */,
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.view_compact_rounded,
                                                                              size: 24.0,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              iconColor: Colors.black,
                                                                              color: FlutterFlowTheme.of(context).sbCareLightColor,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: Colors.black,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                              elevation: 1.0,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                ContractionTimerProCheckoutPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'uuidProFeature': serializeParam(
                                                                                    getJsonField(
                                                                                      myContractionProListItem,
                                                                                      r'''$.uuid_pro_feature''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  '__transition_info__': TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.bottomToTop,
                                                                                    duration: Duration(milliseconds: 500),
                                                                                  ),
                                                                                },
                                                                              );
                                                                            },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'uhum28ps' /* Renew Contraction Pro */,
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.add_shopping_cart_outlined,
                                                                              size: 24.0,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              iconColor: Colors.black,
                                                                              color: FlutterFlowTheme.of(context).warning,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: Colors.black,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                              elevation: 1.0,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
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
                                          ),
                                        ),
                                      ],
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
                ],
              ),
            ),
          ),
        ));
  }
}
