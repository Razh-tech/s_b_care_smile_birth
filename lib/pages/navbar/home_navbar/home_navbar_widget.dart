import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/client/home/elearning_store/e_learning_detail_sheet/e_learning_detail_sheet_widget.dart';
import '/walkthroughs/home_introduce.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_navbar_model.dart';
export 'home_navbar_model.dart';

class HomeNavbarWidget extends StatefulWidget {
  const HomeNavbarWidget({super.key});

  static String routeName = 'HomeNavbar';
  static String routePath = 'dashboard';

  @override
  State<HomeNavbarWidget> createState() => _HomeNavbarWidgetState();
}

class _HomeNavbarWidgetState extends State<HomeNavbarWidget> {
  late HomeNavbarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeNavbarModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.handleBranchDeeplink(
        (linkData) async {
          if (functions.getCanonicalIdentifierFromLink(linkData) != null &&
              functions.getCanonicalIdentifierFromLink(linkData) != '') {
            if (functions.isTargetingPage(linkData, 'elearning')) {
              final context = appNavigatorKey.currentContext!;

              await Future.wait([
                Future(() async {
                  FFAppState().canonicalIdentifier =
                      functions.getCanonicalIdentifierFromLink(linkData)!;
                  FFAppState().targetingPage =
                      functions.isTargetingPage(linkData, 'elearning');
                  FFAppState().referringLink =
                      functions.getReferringLink(linkData)!;
                  FFAppState().lastPathSegment = functions.getLastPathSegment(
                      functions.getCanonicalIdentifierFromLink(linkData))!;
                }),
                Future(() async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    isDismissible: false,
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
                            child: ELearningDetailSheetWidget(
                              uuidModule: functions
                                  .getLastPathSegment(valueOrDefault<String>(
                                functions
                                    .getCanonicalIdentifierFromLink(linkData),
                                '/elearning/01972a65-6d4e-73ac-bade-1967781616a0',
                              )),
                            ),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                }),
              ]);
            } else {
              if (Navigator.of(context).canPop()) {
                context.pop();
              }
              context.pushNamed(
                ELearningDetailPageWidget.routeName,
                pathParameters: {
                  'uuidModule': serializeParam(
                    functions.getLastPathSegment(
                        functions.getCanonicalIdentifierFromLink(linkData)),
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            }
          }
        },
      );
      await Future.wait([
        Future(() async {
          _model.getUserProfileResult = await UserGroup.getUserProfileCall.call(
            token: FFAppState().token,
          );
        }),
        Future(() async {
          await actions.getVersionNumber();
        }),
      ]);
      if ((_model.getUserProfileResult?.succeeded ?? true)) {
        if (UserGroup.getUserProfileCall.defaultProvider(
              (_model.getUserProfileResult?.jsonBody ?? ''),
            ) !=
            '019187a0-c684-7327-a36e-fe37d2d8535e') {
          await Future.wait([
            Future(() async {
              _model.getHomeAddressCounty =
                  await UserGroup.getHomeAddressCall.call(
                token: FFAppState().token,
              );
            }),
            Future(() async {
              _model.getInfoMitra = await GetInfoMitraCall.call(
                uuidProvider: UserGroup.getUserProfileCall.defaultProvider(
                  (_model.getUserProfileResult?.jsonBody ?? ''),
                ),
              );
            }),
            Future(() async {
              _model.countTotalOwnedContractionPro =
                  await ProFeatureGroup.getOwnedListContractionProCall.call(
                token: FFAppState().token,
              );
            }),
            Future(() async {
              _model.getUserWallet = await UserGroup.getUserWalletCall.call(
                token: FFAppState().token,
              );
            }),
          ]);
          if ((UserGroup.getHomeAddressCall.countryState(
                        (_model.getHomeAddressCounty?.jsonBody ?? ''),
                      ) !=
                      null &&
                  UserGroup.getHomeAddressCall.countryState(
                        (_model.getHomeAddressCounty?.jsonBody ?? ''),
                      ) !=
                      '') &&
              (_model.getInfoMitra?.succeeded ?? true)) {
            FFAppState().defaultProvider =
                UserGroup.getUserProfileCall.defaultProvider(
              (_model.getUserProfileResult?.jsonBody ?? ''),
            )!;
            FFAppState().countyHomeAddress =
                UserGroup.getHomeAddressCall.countryState(
              (_model.getHomeAddressCounty?.jsonBody ?? ''),
            )!;
            FFAppState().ownedContractionPro =
                ProFeatureGroup.getOwnedListContractionProCall.totalOwned(
              (_model.countTotalOwnedContractionPro?.jsonBody ?? ''),
            )!;
            FFAppState().sbpayBalance =
                UserGroup.getUserWalletCall.walletBalance(
              (_model.getUserWallet?.jsonBody ?? ''),
            )!;
            FFAppState().providerName = GetInfoMitraCall.fullname(
              (_model.getInfoMitra?.jsonBody ?? ''),
            )!;
            FFAppState().update(() {});
            await Future.wait([
              Future(() async {
                safeSetState(() => _model.apiRequestCompleter2 = null);
                await _model.waitForApiRequestCompleted2();
              }),
              Future(() async {
                safeSetState(() => _model.apiRequestCompleter1 = null);
                await _model.waitForApiRequestCompleted1();
              }),
            ]);
            await Future.wait([
              Future(() async {
                _model.getSubscriptionIdResult =
                    await actions.getOneSignalSubscriptionId();
              }),
              Future(() async {
                _model.getDeviceIdResult = await actions.getDeviceID();
              }),
              Future(() async {
                _model.getDeviceInfoResult = await actions.getDeviceInfo();
              }),
            ]);
            FFAppState().subscriptionId = _model.getSubscriptionIdResult!;
            FFAppState().deviceId = _model.getDeviceIdResult!;
            FFAppState().deviceInfo = _model.getDeviceInfoResult!;
            FFAppState().update(() {});
            _model.registerDeviceResult =
                await UserGroup.registerUserDeviceCall.call(
              deviceId: FFAppState().deviceId,
              deviceToken: FFAppState().subscriptionId,
              platform: isAndroid ? 'Android' : 'Web',
              deviceInfo: FFAppState().deviceInfo,
              token: FFAppState().token,
            );
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    title: Text(FFLocalizations.of(context).getVariableText(
                      enText: 'Information',
                      idText: 'Informasi',
                    )),
                    content: Text(FFLocalizations.of(context).getVariableText(
                      enText:
                          'You have not set your home address. You need to set it to use SBCare.',
                      idText:
                          'Anda belum menetapkan alamat rumah Anda. Anda perlu mengaturnya untuk menggunakan SBCare.',
                    )),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Continue'),
                      ),
                    ],
                  ),
                );
              },
            );

            context.pushNamedAuth(
                AddressSettingPageWidget.routeName, context.mounted);
          }
        } else {
          await Future.wait([
            Future(() async {
              _model.getHomeAddressDetails =
                  await UserGroup.getHomeAddressCall.call(
                token: FFAppState().token,
              );
            }),
            Future(() async {
              _model.getMitraInfo = await GetInfoMitraCall.call(
                uuidProvider: UserGroup.getUserProfileCall.defaultProvider(
                  (_model.getUserProfileResult?.jsonBody ?? ''),
                ),
              );
            }),
            Future(() async {
              _model.countTotalOwnedContractionPro2 =
                  await ProFeatureGroup.getOwnedListContractionProCall.call(
                token: FFAppState().token,
              );
            }),
            Future(() async {
              _model.getUserWallet2 = await UserGroup.getUserWalletCall.call(
                token: FFAppState().token,
              );
            }),
          ]);
          if (UserGroup.getHomeAddressCall.countryState(
                    (_model.getHomeAddressDetails?.jsonBody ?? ''),
                  ) !=
                  null &&
              UserGroup.getHomeAddressCall.countryState(
                    (_model.getHomeAddressDetails?.jsonBody ?? ''),
                  ) !=
                  '') {
            FFAppState().defaultProvider =
                UserGroup.getUserProfileCall.defaultProvider(
              (_model.getUserProfileResult?.jsonBody ?? ''),
            )!;
            FFAppState().countyHomeAddress =
                UserGroup.getHomeAddressCall.countryState(
              (_model.getHomeAddressDetails?.jsonBody ?? ''),
            )!;
            FFAppState().ownedContractionPro =
                ProFeatureGroup.getOwnedListContractionProCall.totalOwned(
              (_model.countTotalOwnedContractionPro2?.jsonBody ?? ''),
            )!;
            FFAppState().sbpayBalance =
                UserGroup.getUserWalletCall.walletBalance(
              (_model.getUserWallet2?.jsonBody ?? ''),
            )!;
            FFAppState().update(() {});
            await Future.wait([
              Future(() async {
                safeSetState(() => _model.apiRequestCompleter2 = null);
                await _model.waitForApiRequestCompleted2();
              }),
              Future(() async {
                safeSetState(() => _model.apiRequestCompleter1 = null);
                await _model.waitForApiRequestCompleted1();
              }),
            ]);
            await Future.wait([
              Future(() async {
                _model.getSubscriptionIdResult2 =
                    await actions.getOneSignalSubscriptionId();
              }),
              Future(() async {
                _model.getDeviceIdResult2 = await actions.getDeviceID();
              }),
              Future(() async {
                _model.getDeviceInfoResult2 = await actions.getDeviceInfo();
              }),
            ]);
            FFAppState().subscriptionId = _model.getSubscriptionIdResult2!;
            FFAppState().deviceId = _model.getDeviceIdResult2!;
            FFAppState().deviceInfo = _model.getDeviceInfoResult2!;
            FFAppState().update(() {});
            _model.registerDeviceResult2 =
                await UserGroup.registerUserDeviceCall.call(
              deviceId: FFAppState().deviceId,
              deviceToken: FFAppState().subscriptionId,
              platform: isAndroid ? 'Android' : 'Web',
              deviceInfo: FFAppState().deviceInfo,
              token: FFAppState().token,
            );
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    title: Text(FFLocalizations.of(context).getVariableText(
                      enText: 'Information',
                      idText: 'Informasi',
                    )),
                    content: Text(FFLocalizations.of(context).getVariableText(
                      enText:
                          'You have not set your home address. You need to set it to use SBCare.',
                      idText:
                          'Anda belum menetapkan alamat rumah Anda. Anda perlu mengaturnya untuk menggunakan SBCare.',
                    )),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Continue'),
                      ),
                    ],
                  ),
                );
              },
            );

            context.pushNamedAuth(
                AddressSettingPageWidget.routeName, context.mounted);
          }
        }
      } else {
        _model.getRefreshToken = await AuthGroup.refreshTokenCall.call(
          refreshToken: FFAppState().refreshToken,
        );

        if ((_model.getRefreshToken?.succeeded ?? true)) {
          FFAppState().token = AuthGroup.refreshTokenCall.accessToken(
            (_model.getRefreshToken?.jsonBody ?? ''),
          )!;
          FFAppState().refreshToken = AuthGroup.refreshTokenCall.refreshToken(
            (_model.getRefreshToken?.jsonBody ?? ''),
          )!;
          FFAppState().update(() {});
          await authManager.updateAuthUserData(
            authenticationToken: AuthGroup.refreshTokenCall.accessToken(
              (_model.getRefreshToken?.jsonBody ?? ''),
            ),
            refreshToken: AuthGroup.refreshTokenCall.refreshToken(
              (_model.getRefreshToken?.jsonBody ?? ''),
            ),
            tokenExpiration: currentAuthTokenExpiration,
            authUid: FFAppState().uidUser,
          );
          await Future.wait([
            Future(() async {
              safeSetState(() => _model.apiRequestCompleter2 = null);
              await _model.waitForApiRequestCompleted2();
            }),
            Future(() async {
              safeSetState(() => _model.apiRequestCompleter1 = null);
              await _model.waitForApiRequestCompleted1();
            }),
          ]);
          await Future.wait([
            Future(() async {
              _model.getSubscriptionIdResult3 =
                  await actions.getOneSignalSubscriptionId();
            }),
            Future(() async {
              _model.getDeviceIdResult3 = await actions.getDeviceID();
            }),
            Future(() async {
              _model.getDeviceInfoResult3 = await actions.getDeviceInfo();
            }),
          ]);
          FFAppState().subscriptionId = _model.getSubscriptionIdResult3!;
          FFAppState().deviceId = _model.getDeviceIdResult3!;
          FFAppState().deviceInfo = _model.getDeviceInfoResult3!;
          FFAppState().update(() {});
          _model.registerDeviceResult3 =
              await UserGroup.registerUserDeviceCall.call(
            deviceId: FFAppState().deviceId,
            deviceToken: FFAppState().subscriptionId,
            platform: isAndroid ? 'Android' : 'Web',
            deviceInfo: FFAppState().deviceInfo,
            token: FFAppState().token,
          );
        } else {
          FFAppState().token = '';
          FFAppState().deleteUidUser(resetState: true);
          FFAppState().deleteDefaultProvider(resetState: true);
          FFAppState().deleteCountyHomeAddress(resetState: true);
          FFAppState().deleteRefreshToken(resetState: true);
          FFAppState().deleteUidProvider(resetState: true);
          FFAppState().sbpayBalance = 0;
          FFAppState().ownedContractionPro = 0;
          FFAppState().update(() {});
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          context.goNamedAuth(
            HomePublicPageWidget.routeName,
            context.mounted,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.scale,
                alignment: Alignment.bottomCenter,
                duration: Duration(milliseconds: 500),
              ),
            },
          );
        }
      }
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

    return Title(
        title: 'Dashboard | SBCare - SmileBirth',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: RefreshIndicator(
                  color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                  onRefresh: () async {
                    await Future.wait([
                      Future(() async {
                        safeSetState(() => _model.apiRequestCompleter2 = null);
                        await _model.waitForApiRequestCompleted2();
                      }),
                      Future(() async {
                        safeSetState(() => _model.apiRequestCompleter1 = null);
                        await _model.waitForApiRequestCompleted1();
                      }),
                      Future(() async {
                        FFAppState().defaultProvider =
                            UserGroup.getUserProfileCall.defaultProvider(
                          (_model.getUserProfileResult?.jsonBody ?? ''),
                        )!;
                        FFAppState().countyHomeAddress =
                            UserGroup.getHomeAddressCall.countryState(
                          (_model.getHomeAddressDetails?.jsonBody ?? ''),
                        )!;
                        FFAppState().ownedContractionPro = ProFeatureGroup
                            .getOwnedListContractionProCall
                            .totalOwned(
                          (_model.countTotalOwnedContractionPro2?.jsonBody ??
                              ''),
                        )!;
                        FFAppState().sbpayBalance =
                            UserGroup.getUserWalletCall.walletBalance(
                          (_model.getUserWallet2?.jsonBody ?? ''),
                        )!;
                        FFAppState().update(() {});
                      }),
                    ]);
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: (_model.apiRequestCompleter2 ??=
                                              Completer<ApiCallResponse>()
                                                ..complete(UserGroup
                                                    .getUserWalletCall
                                                    .call(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        final profileCardGetUserWalletResponse =
                                            snapshot.data!;

                                        return Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .sbCareLightColor,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 10.0, 5.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            UserGroup
                                                                .getUserWalletCall
                                                                .customerName(
                                                              profileCardGetUserWalletResponse
                                                                  .jsonBody,
                                                            ),
                                                            'SBCare User',
                                                          ),
                                                          maxLines: 2,
                                                          minFontSize: 12.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .sbcarePrimaryColor,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderRadius: 20.0,
                                                      buttonSize: 40.0,
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .sbcarePrimaryColor,
                                                      hoverIconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      icon: Icon(
                                                        Icons
                                                            .shopping_cart_outlined,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbcarePrimaryColor,
                                                        size: 24.0,
                                                      ),
                                                      showLoadingIndicator:
                                                          true,
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .sbcarePrimaryColor,
                                                      hoverIconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      icon: Icon(
                                                        Icons
                                                            .notifications_outlined,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .sbcarePrimaryColor,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  indent: 10.0,
                                                  endIndent: 10.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
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
                                                                        10.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'f7ujk1m3' /* SBPay Balance */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    formatNumber(
                                                                      UserGroup
                                                                          .getUserWalletCall
                                                                          .walletBalance(
                                                                        profileCardGetUserWalletResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .commaDecimal,
                                                                      currency:
                                                                          'Rp ',
                                                                    ),
                                                                    'Rp 0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 6.0))
                                                            .around(SizedBox(
                                                                height: 6.0)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .sbcarePrimaryColor,
                                                            icon: Icon(
                                                              Icons
                                                                  .add_circle_outline_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbCareLightColor,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  TopupPageWidget
                                                                      .routeName);
                                                            },
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '180s4lwe' /* Top up */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 4.0))
                                                            .around(SizedBox(
                                                                height: 4.0)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .sbcarePrimaryColor,
                                                            icon: Icon(
                                                              Icons
                                                                  .send_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbCareLightColor,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  TransferPageWidget
                                                                      .routeName);
                                                            },
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '4cv6pin3' /* Transfer */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 4.0))
                                                            .around(SizedBox(
                                                                height: 4.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).addWalkthrough(
                                          cardK7ygrrus,
                                          _model.homeIntroduceController,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter1 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(
                                                      GetInfoMitraCall.call(
                                                    uuidProvider: FFAppState()
                                                        .defaultProvider,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final defaultProviderCardGetInfoMitraResponse =
                                              snapshot.data!;

                                          return Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .sbCareLightColor,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Column(
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
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                GetInfoMitraCall
                                                                    .fullname(
                                                                  defaultProviderCardGetInfoMitraResponse
                                                                      .jsonBody,
                                                                ),
                                                                'SBCare Corp.',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 37,
                                                              ),
                                                              minFontSize: 12.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'z03fxnz7' /* (Default Provider) */,
                                                              ),
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
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
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
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                          context.pushNamed(
                                                              ProviderListPageWidget
                                                                  .routeName);
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_right,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 30.0,
                                                        child: VerticalDivider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                        ),
                                                      ),
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
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          title:
                                                                              Text(FFLocalizations.of(context).getVariableText(
                                                                            enText:
                                                                                'Reset Default Provider',
                                                                            idText:
                                                                                'Setel Ulang Mitra Default',
                                                                          )),
                                                                          content:
                                                                              Text(FFLocalizations.of(context).getVariableText(
                                                                            enText:
                                                                                'Are you sure that you would like to reset your default provider?',
                                                                            idText:
                                                                                'Apakah Anda yakin ingin mengatur ulang mitra default Anda?',
                                                                          )),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text(FFLocalizations.of(context).getVariableText(
                                                                                enText: 'Cancel',
                                                                                idText: 'Batal',
                                                                              )),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text(FFLocalizations.of(context).getVariableText(
                                                                                enText: 'Confirm',
                                                                                idText: 'Konfirmasi',
                                                                              )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            _model.resetDefaultProvider =
                                                                await UpdateDefaultProviderCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              defaultProvider:
                                                                  '019187a0-c684-7327-a36e-fe37d2d8535e',
                                                            );

                                                            if ((_model
                                                                    .resetDefaultProvider
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                        enText:
                                                                            'Default provider has been reset to Default',
                                                                        idText:
                                                                            'Mitra default telah diatur ulang ke Default',
                                                                      )),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              FFAppState()
                                                                      .defaultProvider =
                                                                  '019187a0-c684-7327-a36e-fe37d2d8535e';
                                                              FFAppState()
                                                                  .deleteProviderName(
                                                                      resetState:
                                                                          true);
                                                              FFAppState()
                                                                  .deleteEmailProvider(
                                                                      resetState:
                                                                          true);
                                                              FFAppState()
                                                                  .update(
                                                                      () {});

                                                              context.pushNamed(
                                                                  HomeNavbarWidget
                                                                      .routeName);
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Update Status'),
                                                                      content: Text(
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                        enText:
                                                                            'Something\'s wrong!',
                                                                        idText:
                                                                            'Ada yang salah!',
                                                                      )),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
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
                                                        child: Icon(
                                                          Icons
                                                              .restore_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ).addWalkthrough(
                                            cardAg2xs8ki,
                                            _model.homeIntroduceController,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '89yj6rnv' /* Main Features */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              ViewAllPageWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .topToBottom,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                ),
                                              },
                                            );
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'o1paj2md' /* View All */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
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
                                                        AppointmentSchedulePageWidget
                                                            .routeName);
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Image.asset(
                                                      'assets/images/APPOINTMENT_.png',
                                                      width: 70.0,
                                                      height: 70.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ).addWalkthrough(
                                                  image094yyq21,
                                                  _model
                                                      .homeIntroduceController,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '4cl8g6jc' /* Appointment
Schedule */
                                                  ,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if ((FFAppState()
                                                              .defaultProvider ==
                                                          '') ||
                                                  (FFAppState()
                                                          .defaultProvider ==
                                                      '019187a0-c684-7327-a36e-fe37d2d8535e') ||
                                                  (FFAppState()
                                                          .defaultProvider ==
                                                      '')) {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
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
                                                              ProviderListPageWidget
                                                                  .routeName);
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.0),
                                                          child: Image.asset(
                                                            'assets/images/FIND_PROVIDER.png',
                                                            width: 70.0,
                                                            height: 70.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ).addWalkthrough(
                                                        imageXoz5j4tn,
                                                        _model
                                                            .homeIntroduceController,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fsbeuwe1' /* Default
Provider */
                                                        ,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ],
                                                );
                                              } else {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
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
                                                            ProviderServicePageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'uuidUser':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .defaultProvider,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          child: Image.asset(
                                                            'assets/images/FIND_PROVIDER.png',
                                                            width: 70.0,
                                                            height: 70.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '095ryz5z' /* Provider
Service */
                                                        ,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ],
                                                );
                                              }
                                            },
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
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
                                                        ELearningListPageWidget
                                                            .routeName);
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Image.asset(
                                                      'assets/images/E-LEARNING.png',
                                                      width: 70.0,
                                                      height: 70.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ).addWalkthrough(
                                                  imageFpd9g1s3,
                                                  _model
                                                      .homeIntroduceController,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'f698xnul' /* E-Learning
Store */
                                                  ,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
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
                                                        OnlineClassSubmenuScreenWidget
                                                            .routeName);
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Image.asset(
                                                      'assets/images/ONLINE_CLASS.png',
                                                      width: 70.0,
                                                      height: 70.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ).addWalkthrough(
                                                  imageZ5ctxnz1,
                                                  _model
                                                      .homeIntroduceController,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'wovvyalu' /* Online
Class */
                                                  ,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: 150.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
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
                                                          AppointmentSchedulePageWidget
                                                              .routeName);
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Image.asset(
                                                        'assets/images/APPOINTMENT_.png',
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ash9daxx' /* Appointment Schedule */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if ((FFAppState()
                                                              .defaultProvider ==
                                                          '') ||
                                                  (FFAppState()
                                                          .defaultProvider ==
                                                      '019187a0-c684-7327-a36e-fe37d2d8535e') ||
                                                  (FFAppState()
                                                          .defaultProvider ==
                                                      '')) {
                                                return Container(
                                                  width: 150.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
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
                                                            context.pushNamed(
                                                                ProviderListPageWidget
                                                                    .routeName);
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                            child: Image.asset(
                                                              'assets/images/FIND_PROVIDER.png',
                                                              width: 100.0,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'zg70f53k' /* Default Provider */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  width: 150.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
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
                                                            context.pushNamed(
                                                              ProviderServicePageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'uuidUser':
                                                                    serializeParam(
                                                                  FFAppState()
                                                                      .defaultProvider,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: Image.asset(
                                                              'assets/images/FIND_PROVIDER.png',
                                                              width: 100.0,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'vcdst7xn' /* Provider Service */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          Container(
                                            width: 150.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
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
                                                          ELearningListPageWidget
                                                              .routeName);
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Image.asset(
                                                        'assets/images/E-LEARNING.png',
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ma9zpibm' /* E-Learning Store */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 150.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
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
                                                          OnlineClassSubmenuScreenWidget
                                                              .routeName);
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Image.asset(
                                                        'assets/images/ONLINE_CLASS.png',
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'y1u7799u' /* Online Class */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
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
                                                      ProviderListPublicPageWidget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .scale,
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Image.asset(
                                                      'assets/images/PROFILE_MITRA.png',
                                                      width: 70.0,
                                                      height: 70.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'lb4rp1qk' /* Provider
List */
                                                  ,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
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
                                                        EbookListPageWidget
                                                            .routeName);
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Image.asset(
                                                      'assets/images/ICON_PROGRAM_STORE.png',
                                                      width: 70.0,
                                                      height: 70.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ).addWalkthrough(
                                                  imageUc20meg7,
                                                  _model
                                                      .homeIntroduceController,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'xxhcks6j' /* Program
Store */
                                                  ,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (FFAppState()
                                                          .ownedContractionPro <
                                                      1) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
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
                                                              ContractionTimerProListPageWidget
                                                                  .routeName);
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          child: Image.asset(
                                                            'assets/images/ICON_CONTRACTION_TIMER_PRO_LOCKED.png',
                                                            width: 70.0,
                                                            height: 70.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ).addWalkthrough(
                                                        imageHelkvi5y,
                                                        _model
                                                            .homeIntroduceController,
                                                      ),
                                                    );
                                                  } else {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
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
                                                              MyContractionTimerProListPageWidget
                                                                  .routeName);
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          child: Image.asset(
                                                            'assets/images/ICON_CONTRACTION_TIMER_PRO.png',
                                                            width: 70.0,
                                                            height: 70.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kyqrsbo5' /* Contraction
Timer Pro */
                                                  ,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: Image.asset(
                                                    'assets/images/ICON_SB_LINK.png',
                                                    width: 70.0,
                                                    height: 70.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ).addWalkthrough(
                                                  imageT9t6ihai,
                                                  _model
                                                      .homeIntroduceController,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  's3w9bmda' /* My SBLink
 */
                                                  ,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: 150.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
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
                                                        ProviderListPublicPageWidget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .scale,
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Image.asset(
                                                        'assets/images/PROFILE_MITRA.png',
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0ctfcrf8' /* Provider List */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 150.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
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
                                                          EbookListPageWidget
                                                              .routeName);
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Image.asset(
                                                        'assets/images/ICON_PROGRAM_STORE.png',
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'i6w03hmx' /* Program Store */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 150.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    if (FFAppState()
                                                            .ownedContractionPro <
                                                        1) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
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
                                                            context.pushNamed(
                                                                ContractionTimerProListPageWidget
                                                                    .routeName);
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: Image.asset(
                                                              'assets/images/ICON_CONTRACTION_TIMER_PRO_LOCKED.png',
                                                              width: 70.0,
                                                              height: 70.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
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
                                                            context.pushNamed(
                                                                MyContractionTimerProListPageWidget
                                                                    .routeName);
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: Image.asset(
                                                              'assets/images/ICON_CONTRACTION_TIMER_PRO.png',
                                                              width: 100.0,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qrrb5rgc' /* Contraction Timer Pro */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 150.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: Image.asset(
                                                      'assets/images/ICON_SB_LINK.png',
                                                      width: 100.0,
                                                      height: 100.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ddxvccko' /* My SBLink */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '5mak15lv' /* Recent Articles */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              ArticleListPublicPageWidget
                                                  .routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .topToBottom,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                ),
                                              },
                                            );
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '5gl5vddp' /* View Article */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    FutureBuilder<ApiCallResponse>(
                                      future: PublicAPIGroup
                                          .pubGetListArticleCall
                                          .call(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitDualRing(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        final articleCarouselPubGetListArticleResponse =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          height: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <=
                                                400.0) {
                                              return 100.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <=
                                                480.0) {
                                              return 120.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <=
                                                768.0) {
                                              return 192.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <=
                                                1024.0) {
                                              return 256.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <=
                                                1440.0) {
                                              return 360.0;
                                            } else {
                                              return 480.0;
                                            }
                                          }(),
                                          child: CarouselSlider(
                                            items: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    ArticleListPublicPageWidget
                                                        .routeName,
                                                    extra: <String, dynamic>{
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .topToBottom,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl: PublicAPIGroup
                                                        .pubGetListArticleCall
                                                        .coverImageUrl(
                                                          articleCarouselPubGetListArticleResponse
                                                              .jsonBody,
                                                        )!
                                                        .firstOrNull!,
                                                    fit: BoxFit.scaleDown,
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.jpg',
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    ArticleListPublicPageWidget
                                                        .routeName,
                                                    extra: <String, dynamic>{
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .topToBottom,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl: (PublicAPIGroup
                                                        .pubGetListArticleCall
                                                        .coverImageUrl(
                                                          articleCarouselPubGetListArticleResponse
                                                              .jsonBody,
                                                        )!
                                                        .elementAtOrNull(1))!,
                                                    fit: BoxFit.scaleDown,
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.jpg',
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    ArticleListPublicPageWidget
                                                        .routeName,
                                                    extra: <String, dynamic>{
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .topToBottom,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl: (PublicAPIGroup
                                                        .pubGetListArticleCall
                                                        .coverImageUrl(
                                                          articleCarouselPubGetListArticleResponse
                                                              .jsonBody,
                                                        )!
                                                        .elementAtOrNull(2))!,
                                                    fit: BoxFit.scaleDown,
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.jpg',
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            carouselController: _model
                                                    .articleCarouselController1 ??=
                                                CarouselSliderController(),
                                            options: CarouselOptions(
                                              initialPage: 0,
                                              viewportFraction: 1.0,
                                              disableCenter: false,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.8,
                                              enableInfiniteScroll: true,
                                              scrollDirection: Axis.horizontal,
                                              autoPlay: true,
                                              autoPlayAnimationDuration:
                                                  Duration(milliseconds: 1000),
                                              autoPlayInterval: Duration(
                                                  milliseconds: (1000 + 4000)),
                                              autoPlayCurve: Curves.linear,
                                              pauseAutoPlayInFiniteScroll: true,
                                              onPageChanged: (index, _) => _model
                                                      .articleCarouselCurrentIndex1 =
                                                  index,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: PublicAPIGroup
                                            .pubGetListArticleCall
                                            .call(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitDualRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final articleCarouselPubGetListArticleResponse =
                                              snapshot.data!;

                                          return Container(
                                            width: double.infinity,
                                            height: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <=
                                                  400.0) {
                                                return 100.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <=
                                                  480.0) {
                                                return 120.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <=
                                                  768.0) {
                                                return 192.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <=
                                                  1024.0) {
                                                return 256.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <=
                                                  1440.0) {
                                                return 360.0;
                                              } else {
                                                return 480.0;
                                              }
                                            }(),
                                            child: CarouselSlider(
                                              items: [
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
                                                    context.pushNamed(
                                                      ArticleListPublicPageWidget
                                                          .routeName,
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
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: PublicAPIGroup
                                                          .pubGetListArticleCall
                                                          .coverImageUrl(
                                                            articleCarouselPubGetListArticleResponse
                                                                .jsonBody,
                                                          )!
                                                          .firstOrNull!,
                                                      fit: BoxFit.scaleDown,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.jpg',
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                                                    context.pushNamed(
                                                      ArticleListPublicPageWidget
                                                          .routeName,
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
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: (PublicAPIGroup
                                                          .pubGetListArticleCall
                                                          .coverImageUrl(
                                                            articleCarouselPubGetListArticleResponse
                                                                .jsonBody,
                                                          )!
                                                          .elementAtOrNull(1))!,
                                                      fit: BoxFit.scaleDown,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.jpg',
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                                                    context.pushNamed(
                                                      ArticleListPublicPageWidget
                                                          .routeName,
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
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: (PublicAPIGroup
                                                          .pubGetListArticleCall
                                                          .coverImageUrl(
                                                            articleCarouselPubGetListArticleResponse
                                                                .jsonBody,
                                                          )!
                                                          .elementAtOrNull(2))!,
                                                      fit: BoxFit.scaleDown,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.jpg',
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              carouselController: _model
                                                      .articleCarouselController2 ??=
                                                  CarouselSliderController(),
                                              options: CarouselOptions(
                                                initialPage: 0,
                                                viewportFraction: 1.0,
                                                disableCenter: false,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.8,
                                                enableInfiniteScroll: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: true,
                                                autoPlayAnimationDuration:
                                                    Duration(
                                                        milliseconds: 1000),
                                                autoPlayInterval: Duration(
                                                    milliseconds:
                                                        (1000 + 4000)),
                                                autoPlayCurve: Curves.linear,
                                                pauseAutoPlayInFiniteScroll:
                                                    true,
                                                onPageChanged: (index, _) =>
                                                    _model.articleCarouselCurrentIndex2 =
                                                        index,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
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
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .sbCareLightColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/SB_CARE_1.png',
                                                      width: 70.0,
                                                      height: 60.0,
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'iuknejmk' /* SBCare Home Treatment */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallIsCustom,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'amtdcc3u' /* Coming soon! */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: ModuleClientGroup
                                        .getSBCareFlyersCall
                                        .call(
                                      token: FFAppState().token,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitDualRing(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .sbcarePrimaryColor,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final adsCarouselGetSBCareFlyersResponse =
                                          snapshot.data!;

                                      return Container(
                                        width: double.infinity,
                                        height: () {
                                          if (MediaQuery.sizeOf(context)
                                                  .width <=
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
                                        child: CarouselSlider(
                                          items: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl: ModuleClientGroup
                                                    .getSBCareFlyersCall
                                                    .flyerUrl(
                                                      adsCarouselGetSBCareFlyersResponse
                                                          .jsonBody,
                                                    )!
                                                    .firstOrNull!,
                                                fit: BoxFit.scaleDown,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.jpg',
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl: (ModuleClientGroup
                                                    .getSBCareFlyersCall
                                                    .flyerUrl(
                                                      adsCarouselGetSBCareFlyersResponse
                                                          .jsonBody,
                                                    )!
                                                    .elementAtOrNull(1))!,
                                                fit: BoxFit.scaleDown,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.jpg',
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl: (ModuleClientGroup
                                                    .getSBCareFlyersCall
                                                    .flyerUrl(
                                                      adsCarouselGetSBCareFlyersResponse
                                                          .jsonBody,
                                                    )!
                                                    .elementAtOrNull(2))!,
                                                fit: BoxFit.scaleDown,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.jpg',
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl: (ModuleClientGroup
                                                    .getSBCareFlyersCall
                                                    .flyerUrl(
                                                      adsCarouselGetSBCareFlyersResponse
                                                          .jsonBody,
                                                    )!
                                                    .elementAtOrNull(3))!,
                                                fit: BoxFit.scaleDown,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.jpg',
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl: (ModuleClientGroup
                                                    .getSBCareFlyersCall
                                                    .flyerUrl(
                                                      adsCarouselGetSBCareFlyersResponse
                                                          .jsonBody,
                                                    )!
                                                    .elementAtOrNull(4))!,
                                                fit: BoxFit.scaleDown,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.jpg',
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                          ],
                                          carouselController:
                                              _model.adsCarouselController ??=
                                                  CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: 0,
                                            viewportFraction: 0.9,
                                            disableCenter: false,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.8,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                Duration(milliseconds: 1000),
                                            autoPlayInterval: Duration(
                                                milliseconds: (1000 + 4000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) =>
                                                _model.adsCarouselCurrentIndex =
                                                    index,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ]
                                    .divide(SizedBox(height: 4.0))
                                    .around(SizedBox(height: 4.0)),
                              ),
                            ],
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 120.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.homeIntroduceController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
