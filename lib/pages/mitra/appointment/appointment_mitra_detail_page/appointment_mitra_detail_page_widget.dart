import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'appointment_mitra_detail_page_model.dart';
export 'appointment_mitra_detail_page_model.dart';

class AppointmentMitraDetailPageWidget extends StatefulWidget {
  const AppointmentMitraDetailPageWidget({
    super.key,
    this.uuidAppointment,
  });

  final String? uuidAppointment;

  static String routeName = 'AppointmentMitraDetailPage';
  static String routePath = 'provider/appointment/details';

  @override
  State<AppointmentMitraDetailPageWidget> createState() =>
      _AppointmentMitraDetailPageWidgetState();
}

class _AppointmentMitraDetailPageWidgetState
    extends State<AppointmentMitraDetailPageWidget> {
  late AppointmentMitraDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentMitraDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
    });

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
            ..complete(
                AppointmentMitraGroup.getAppointmentDetailsMitraCall.call(
              token: FFAppState().token,
              uuidAppointment: widget.uuidAppointment,
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
        final appointmentMitraDetailPageGetAppointmentDetailsMitraResponse =
            snapshot.data!;

        return Title(
            title: 'Appointment Details | SBCare - SmileBirth',
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
                      '54l2ypkj' /* Appointment Details */,
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
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: AppointmentMitraGroup
                                          .getAppointmentDetailsMitraCall
                                          .avatarClient(
                                        appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'iyfn9066' /* Client Information */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .sbcarePrimaryColor,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            AppointmentMitraGroup
                                                .getAppointmentDetailsMitraCall
                                                .fullnameClient(
                                              appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                  .jsonBody,
                                            ),
                                            'Appointment Client',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                AppointmentMitraGroup
                                                    .getAppointmentDetailsMitraCall
                                                    .phoneClient(
                                                  appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                      .jsonBody,
                                                ),
                                                '+6281234567890',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: Color(0xFF6C6C6C),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Clipboard.setData(
                                                      ClipboardData(
                                                          text: AppointmentMitraGroup
                                                              .getAppointmentDetailsMitraCall
                                                              .phoneClient(
                                                    appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                        .jsonBody,
                                                  )!));
                                                },
                                                child: FaIcon(
                                                  FaIconData(const IconData(
                                                      /* copy */ 0xf0c5,
                                                      fontFamily:
                                                          'FontAwesomeRegular',
                                                      fontPackage:
                                                          'font_awesome_flutter')),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 2.0))
                                        .around(SizedBox(height: 2.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .sbcarePrimaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'f1dl6qih' /* Appointment Date */,
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
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '${AppointmentMitraGroup.getAppointmentDetailsMitraCall.appointmentDays(
                                        appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                            .jsonBody,
                                      )}, ${AppointmentMitraGroup.getAppointmentDetailsMitraCall.appointmentDate(
                                        appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                            .jsonBody,
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '${AppointmentMitraGroup.getAppointmentDetailsMitraCall.appointmentStart(
                                        appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                            .jsonBody,
                                      )} - ${AppointmentMitraGroup.getAppointmentDetailsMitraCall.appointmentEnd(
                                        appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                            .jsonBody,
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 20.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'tipn9ia7' /* Appointment Class */,
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
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        valueOrDefault<String>(
                                          AppointmentMitraGroup
                                              .getAppointmentDetailsMitraCall
                                              .appointmentTitle(
                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                .jsonBody,
                                          ),
                                          'Prenatal Class',
                                        ),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 20.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'uzvhzxde' /* Appointment Price */,
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
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        AppointmentMitraGroup
                                            .getAppointmentDetailsMitraCall
                                            .formattedPrice(
                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                              .jsonBody,
                                        ),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 20.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'asn6pftt' /* Appointment Status */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            if ((AppointmentMitraGroup
                                                        .getAppointmentDetailsMitraCall
                                                        .appointmentVerify(
                                                      appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                          .jsonBody,
                                                    ) ==
                                                    'unverified') &&
                                                (AppointmentMitraGroup
                                                        .getAppointmentDetailsMitraCall
                                                        .appointmentStatus(
                                                      appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                          .jsonBody,
                                                    ) ==
                                                    'pending')) {
                                              return Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'zcgrh3xt' /* UNVERIFIED */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pureRed,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              );
                                            } else if ((AppointmentMitraGroup
                                                        .getAppointmentDetailsMitraCall
                                                        .appointmentVerify(
                                                      appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                          .jsonBody,
                                                    ) ==
                                                    'verified') &&
                                                (AppointmentMitraGroup
                                                        .getAppointmentDetailsMitraCall
                                                        .appointmentStatus(
                                                      appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                          .jsonBody,
                                                    ) ==
                                                    'pending')) {
                                              return Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  's4hb1ngk' /* WAITING FOR VERIFICATION */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              );
                                            } else if (AppointmentMitraGroup
                                                    .getAppointmentDetailsMitraCall
                                                    .appointmentStatus(
                                                  appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                      .jsonBody,
                                                ) ==
                                                'onprogress') {
                                              return Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'b2oc0tlk' /* ON PROGRESS */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              );
                                            } else if (AppointmentMitraGroup
                                                    .getAppointmentDetailsMitraCall
                                                    .appointmentStatus(
                                                  appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                      .jsonBody,
                                                ) ==
                                                'purchased') {
                                              return Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6kztbthh' /* PURCHASED */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              );
                                            } else if (AppointmentMitraGroup
                                                    .getAppointmentDetailsMitraCall
                                                    .appointmentStatus(
                                                  appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                      .jsonBody,
                                                ) ==
                                                'finished') {
                                              return Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'trgxalc3' /* DONE */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              );
                                            } else {
                                              return Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'yx3gk1kb' /* EXPIRED */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 20.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '2vuqhqph' /* Sent Class Module */,
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
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        AppointmentMitraGroup
                                            .getAppointmentDetailsMitraCall
                                            .submoduleTitle(
                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                              .jsonBody,
                                        ),
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Builder(
                              builder: (context) {
                                if ((AppointmentMitraGroup
                                            .getAppointmentDetailsMitraCall
                                            .appointmentVerify(
                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                              .jsonBody,
                                        ) ==
                                        'unverified') &&
                                    (AppointmentMitraGroup
                                            .getAppointmentDetailsMitraCall
                                            .appointmentStatus(
                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                              .jsonBody,
                                        ) ==
                                        'pending')) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 20.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  _model.acceptResult =
                                                      await AppointmentMitraGroup
                                                          .acceptAppointmentCall
                                                          .call(
                                                    token: FFAppState().token,
                                                    uuidAppointment:
                                                        widget.uuidAppointment,
                                                  );

                                                  if ((_model.acceptResult
                                                          ?.succeeded ??
                                                      true)) {
                                                    await showDialog(
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
                                                                  'Appointment Status',
                                                              idText:
                                                                  'Status Janji Temu',
                                                            )),
                                                            content: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                              enText:
                                                                  'Your appointment has been accepted.',
                                                              idText:
                                                                  'Janji temu Anda telah diterima.',
                                                            )),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted(
                                                            minWait: 1000);
                                                  } else {
                                                    await showDialog(
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
                                                                  'Appointment Status',
                                                              idText:
                                                                  'Status Janji Temu',
                                                            )),
                                                            content: Text(
                                                                AppointmentMitraGroup
                                                                    .acceptAppointmentCall
                                                                    .errorMessage(
                                                              (_model.acceptResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
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
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'od4gbco7' /* Accept */,
                                                ),
                                                icon: FaIcon(
                                                  FaIconData(const IconData(
                                                      /* check */ 0xf00c,
                                                      fontFamily:
                                                          'FontAwesomeSolid',
                                                      fontPackage:
                                                          'font_awesome_flutter')),
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 1.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else if ((AppointmentMitraGroup
                                            .getAppointmentDetailsMitraCall
                                            .appointmentVerify(
                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                              .jsonBody,
                                        ) ==
                                        'verified') &&
                                    (AppointmentMitraGroup
                                            .getAppointmentDetailsMitraCall
                                            .appointmentStatus(
                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                              .jsonBody,
                                        ) ==
                                        'pending')) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 20.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    AppointmentVerificationPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'uuidAppointment':
                                                          serializeParam(
                                                        AppointmentMitraGroup
                                                            .getAppointmentDetailsMitraCall
                                                            .uidAppointment(
                                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                              .jsonBody,
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'appointmentTitle':
                                                          serializeParam(
                                                        AppointmentMitraGroup
                                                            .getAppointmentDetailsMitraCall
                                                            .appointmentTitle(
                                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                              .jsonBody,
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'appointmentPrice':
                                                          serializeParam(
                                                        AppointmentMitraGroup
                                                            .getAppointmentDetailsMitraCall
                                                            .appointmentPrice(
                                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                              .jsonBody,
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                      'formattedPrice':
                                                          serializeParam(
                                                        AppointmentMitraGroup
                                                            .getAppointmentDetailsMitraCall
                                                            .formattedPrice(
                                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                              .jsonBody,
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                      'feeService':
                                                          serializeParam(
                                                        AppointmentMitraGroup
                                                            .getAppointmentDetailsMitraCall
                                                            .feeProgramClass(
                                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                              .jsonBody,
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                      'formattedFee':
                                                          serializeParam(
                                                        AppointmentMitraGroup
                                                            .getAppointmentDetailsMitraCall
                                                            .formattedFee(
                                                          appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
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
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'qtgvy49s' /* Input Code Verification */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .domain_verification_outlined,
                                                  size: 20.0,
                                                ),
                                                options: FFButtonOptions(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 1.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (AppointmentMitraGroup
                                        .getAppointmentDetailsMitraCall
                                        .appointmentStatus(
                                      appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                          .jsonBody,
                                    ) ==
                                    'onprogress') {
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 20.0, 15.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      PracticeModuleContentAltPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'uuidProgramClass':
                                                            serializeParam(
                                                          AppointmentMitraGroup
                                                              .getAppointmentDetailsMitraCall
                                                              .uidProgramClass(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                        'modulTitle':
                                                            serializeParam(
                                                          AppointmentMitraGroup
                                                              .getAppointmentDetailsMitraCall
                                                              .appointmentTitle(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
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
                                                                  .leftToRight,
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
                                                    '2oyyisji' /* View Practice Module */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbCareLightColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                ),
                                                if (AppointmentMitraGroup
                                                        .getAppointmentDetailsMitraCall
                                                        .isModuleSent(
                                                      appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                          .jsonBody,
                                                    ) ==
                                                    true)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        SendAppointmentModulePageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'uuidAppointment':
                                                              serializeParam(
                                                            AppointmentMitraGroup
                                                                .getAppointmentDetailsMitraCall
                                                                .uidAppointment(
                                                              appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                  .jsonBody,
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                          'uuidUser':
                                                              serializeParam(
                                                            AppointmentMitraGroup
                                                                .getAppointmentDetailsMitraCall
                                                                .uidUser(
                                                              appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                  .jsonBody,
                                                            ),
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
                                                      'jaaovnfk' /* Send Module for Client */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                  ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'End Appointment',
                                                                      idText:
                                                                          'Akhiri Janji Temu',
                                                                    )),
                                                                    content: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Are you sure you would like to end this appointment?',
                                                                      idText:
                                                                          'Apakah Anda yakin ingin mengakhiri janji temu ini?',
                                                                    )),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            FFLocalizations.of(context).getVariableText(
                                                                          enText:
                                                                              'Cancel',
                                                                          idText:
                                                                              'Batal',
                                                                        )),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            FFLocalizations.of(context).getVariableText(
                                                                          enText:
                                                                              'Confirm',
                                                                          idText:
                                                                              'Konfirmasi',
                                                                        )),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      _model.endResult =
                                                          await AppointmentMitraGroup
                                                              .endAppointmentCall
                                                              .call(
                                                        token:
                                                            FFAppState().token,
                                                        uuidAppointment: widget
                                                            .uuidAppointment,
                                                      );

                                                      if ((_model.endResult
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.notifResult =
                                                            await SupabaseGroup
                                                                .insertAppointmentDoneNotificationCall
                                                                .call(
                                                          uuidUser:
                                                              AppointmentMitraGroup
                                                                  .getAppointmentDetailsMitraCall
                                                                  .uidUser(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          ),
                                                          uuidProvider:
                                                              FFAppState()
                                                                  .uidUser,
                                                          emailClient:
                                                              AppointmentMitraGroup
                                                                  .getAppointmentDetailsMitraCall
                                                                  .emailClient(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          ),
                                                          emailProvider:
                                                              FFAppState()
                                                                  .emailUser,
                                                          serviceName:
                                                              AppointmentMitraGroup
                                                                  .getAppointmentDetailsMitraCall
                                                                  .appointmentTitle(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          ),
                                                          nameClient:
                                                              AppointmentMitraGroup
                                                                  .getAppointmentDetailsMitraCall
                                                                  .fullnameClient(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          ),
                                                          nameProvider:
                                                              FFAppState()
                                                                  .fullname,
                                                          appointmentDate: functions
                                                              .translateToIndonesianDate(
                                                                  '${AppointmentMitraGroup.getAppointmentDetailsMitraCall.appointmentDays(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          )}, ${AppointmentMitraGroup.getAppointmentDetailsMitraCall.appointmentDate(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          )}'),
                                                          appointmentTime:
                                                              '${AppointmentMitraGroup.getAppointmentDetailsMitraCall.appointmentStart(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          )} - ${AppointmentMitraGroup.getAppointmentDetailsMitraCall.appointmentEnd(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          )} WIB',
                                                          appointmentPrice:
                                                              AppointmentMitraGroup
                                                                  .getAppointmentDetailsMitraCall
                                                                  .formattedPrice(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          ),
                                                          appointmentModule:
                                                              AppointmentMitraGroup
                                                                  .getAppointmentDetailsMitraCall
                                                                  .submoduleTitle(
                                                            appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                                                .jsonBody,
                                                          ),
                                                        );

                                                        if ((_model.notifResult
                                                                ?.succeeded ??
                                                            true)) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText:
                                                                        'Appointment Ended',
                                                                    idText:
                                                                        'Janji Temu Berakhir',
                                                                  )),
                                                                  content: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                    enText:
                                                                        'This session is now complete and your schedule has been updated. Your earnings/payout for this session will be processed shortly.',
                                                                    idText:
                                                                        'Sesi ini sekarang telah selesai dan jadwal Anda telah diperbarui. Penghasilan/pembayaran Anda untuk sesi ini akan segera diproses.',
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
                                                          safeSetState(() =>
                                                              _model.apiRequestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForApiRequestCompleted(
                                                                  minWait:
                                                                      1000);
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText:
                                                                        'Appointment Ended',
                                                                    idText:
                                                                        'Janji Temu Berakhir',
                                                                  )),
                                                                  content: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                    enText:
                                                                        'Your appointment has ended. Please wait for your payment.',
                                                                    idText:
                                                                        'Janji temu Anda telah berakhir. Harap tunggu pembayaran Anda.',
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
                                                          safeSetState(() =>
                                                              _model.apiRequestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForApiRequestCompleted(
                                                                  minWait:
                                                                      1000);
                                                        }
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                title: Text(FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText:
                                                                      'Appointment Status',
                                                                  idText:
                                                                      'Status Janji Temu',
                                                                )),
                                                                content: Text(
                                                                    AppointmentMitraGroup
                                                                        .endAppointmentCall
                                                                        .errorMessage(
                                                                  (_model.endResult
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
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
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '92z0ruhf' /* End Appointment */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 10.0))
                                                  .around(
                                                      SizedBox(height: 10.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else if (AppointmentMitraGroup
                                        .getAppointmentDetailsMitraCall
                                        .appointmentStatus(
                                      appointmentMitraDetailPageGetAppointmentDetailsMitraResponse
                                          .jsonBody,
                                    ) ==
                                    'finished') {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 20.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    AppointmentMitraInvoicePageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'uuidAppointment':
                                                          serializeParam(
                                                        widget.uuidAppointment,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '8yg9n2zs' /* View Invoice */,
                                                ),
                                                icon: FaIcon(
                                                  FaIconData(const IconData(
                                                      /* fileInvoice */ 0xf570,
                                                      fontFamily:
                                                          'FontAwesomeSolid',
                                                      fontPackage:
                                                          'font_awesome_flutter')),
                                                  size: 20.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 35.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                  elevation: 1.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 30.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [],
                                    ),
                                  );
                                }
                              },
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
