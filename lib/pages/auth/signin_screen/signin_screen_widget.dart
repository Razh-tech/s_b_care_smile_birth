import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'signin_screen_model.dart';
export 'signin_screen_model.dart';

class SigninScreenWidget extends StatefulWidget {
  const SigninScreenWidget({
    super.key,
    this.uuidModule,
    this.uuidProgramClass,
    this.uuidEbook,
  });

  /// If anonymous user navigated via "Purchase" button in Elearning Detail
  /// public page
  final String? uuidModule;

  /// If anonymous user navigated via "Details" button in Online Class list
  /// public page
  final String? uuidProgramClass;

  /// If anonymous user navigated via "Purchase" button in Ebook Detail public
  /// page
  final String? uuidEbook;

  static String routeName = 'SigninScreen';
  static String routePath = 'sign-in';

  @override
  State<SigninScreenWidget> createState() => _SigninScreenWidgetState();
}

class _SigninScreenWidgetState extends State<SigninScreenWidget>
    with TickerProviderStateMixin {
  late SigninScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SigninScreenModel());

    _model.emailTextFieldTextController1 ??= TextEditingController();
    _model.emailTextFieldFocusNode1 ??= FocusNode();

    _model.passwordTextFieldTextController1 ??= TextEditingController();
    _model.passwordTextFieldFocusNode1 ??= FocusNode();

    _model.emailTextFieldTextController2 ??= TextEditingController();
    _model.emailTextFieldFocusNode2 ??= FocusNode();

    _model.passwordTextFieldTextController2 ??= TextEditingController();
    _model.passwordTextFieldFocusNode2 ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(115.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(115.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        title: 'Sign in | SBCare - SmileBirth',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF1F4F8),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {},
              backgroundColor: Color(0xFF25D366),
              icon: FaIcon(
                FaIconData(const IconData(/* whatsapp */ 0xf232,
                    fontFamily: 'FontAwesomeBrands',
                    fontPackage: 'font_awesome_flutter')),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24.0,
              ),
              elevation: 4.0,
              label: Text(
                FFLocalizations.of(context).getText(
                  'yb5ml4ot' /* Help Center */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/SB_CARE_1.png',
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: SingleChildScrollView(
                          controller: _model.containerScrollController1,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'hyjbx59o' /* Sign in to your account to con... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      controller:
                                          _model.emailTextFieldTextController1,
                                      focusNode:
                                          _model.emailTextFieldFocusNode1,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.emailTextFieldTextController1',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      autofillHints: [AutofillHints.email],
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'galqlk79' /* Email */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
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
                                        alignLabelWithHint: false,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelMediumIsCustom,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .sbCareLightColor,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFED3A61),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          size: 20.0,
                                        ),
                                        suffixIcon: _model
                                                .emailTextFieldTextController1!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model
                                                      .emailTextFieldTextController1
                                                      ?.clear();
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  size: 20.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      enableInteractiveSelection: true,
                                      validator: _model
                                          .emailTextFieldTextController1Validator
                                          .asValidator(context),
                                      inputFormatters: [
                                        if (!isAndroid && !isiOS)
                                          TextInputFormatter.withFunction(
                                              (oldValue, newValue) {
                                            return TextEditingValue(
                                              selection: newValue.selection,
                                              text: newValue.text
                                                  .toCapitalization(
                                                      TextCapitalization.none),
                                            );
                                          }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      controller: _model
                                          .passwordTextFieldTextController1,
                                      focusNode:
                                          _model.passwordTextFieldFocusNode1,
                                      autofocus: false,
                                      autofillHints: [AutofillHints.password],
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText:
                                          !_model.passwordTextFieldVisibility1,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'i5evc4bt' /* Password */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelMediumIsCustom,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelMediumIsCustom,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .sbCareLightColor,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFED3A61),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        prefixIcon: Icon(
                                          Icons.lock_outlined,
                                          size: 20.0,
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () async {
                                            safeSetState(() => _model
                                                    .passwordTextFieldVisibility1 =
                                                !_model
                                                    .passwordTextFieldVisibility1);
                                          },
                                          focusNode: _model
                                              .passwordTextFieldPasswordVisibilityFocusNode1
                                            ..skipTraversal = !(false),
                                          child: Icon(
                                            _model.passwordTextFieldVisibility1
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .sbcarePrimaryColor,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                      maxLength: 64,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      enableInteractiveSelection: true,
                                      validator: _model
                                          .passwordTextFieldTextController1Validator
                                          .asValidator(context),
                                      inputFormatters: [
                                        if (!isAndroid && !isiOS)
                                          TextInputFormatter.withFunction(
                                              (oldValue, newValue) {
                                            return TextEditingValue(
                                              selection: newValue.selection,
                                              text: newValue.text
                                                  .toCapitalization(
                                                      TextCapitalization.none),
                                            );
                                          }),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                ForgotPasswordScreenWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9he4biy4' /* Forgot password? */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                    fontWeight: FontWeight.w500,
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
                                  ],
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (FFAppState().fingerprintLogin == false) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.loginResult =
                                                    await AuthGroup.loginCall
                                                        .call(
                                                  email: _model
                                                      .emailTextFieldTextController1
                                                      .text,
                                                  password: _model
                                                      .passwordTextFieldTextController1
                                                      .text,
                                                );

                                                await Future.delayed(
                                                  Duration(
                                                    milliseconds: 10000,
                                                  ),
                                                );
                                                if ((_model.loginResult
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (AuthGroup.loginCall
                                                      .isProvider(
                                                    (_model.loginResult
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!) {
                                                    FFAppState().token =
                                                        AuthGroup.loginCall
                                                            .token(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().uidUser =
                                                        AuthGroup.loginCall
                                                            .uidUser(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().refreshToken =
                                                        AuthGroup.loginCall
                                                            .refreshToken(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().uidProvider =
                                                        AuthGroup.loginCall
                                                            .uidProvider(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().fullname =
                                                        AuthGroup.loginCall
                                                            .fullname(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().emailUser =
                                                        AuthGroup.loginCall
                                                            .email(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState()
                                                            .defaultProvider =
                                                        AuthGroup.loginCall
                                                            .defaultProvider(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().update(() {});
                                                  } else {
                                                    FFAppState().token =
                                                        AuthGroup.loginCall
                                                            .token(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().uidUser =
                                                        AuthGroup.loginCall
                                                            .uidUser(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().refreshToken =
                                                        AuthGroup.loginCall
                                                            .refreshToken(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().fullname =
                                                        AuthGroup.loginCall
                                                            .fullname(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().emailUser =
                                                        AuthGroup.loginCall
                                                            .email(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState()
                                                            .defaultProvider =
                                                        AuthGroup.loginCall
                                                            .defaultProvider(
                                                      (_model.loginResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().update(() {});
                                                  }

                                                  GoRouter.of(context)
                                                      .prepareAuthEvent(true);
                                                  await authManager.signIn(
                                                    authenticationToken:
                                                        FFAppState().token,
                                                    refreshToken: FFAppState()
                                                        .refreshToken,
                                                    tokenExpiration:
                                                        currentAuthTokenExpiration,
                                                    authUid:
                                                        FFAppState().uidUser,
                                                  );
                                                  if (widget.uuidModule !=
                                                          null &&
                                                      widget.uuidModule !=
                                                          '') {
                                                    unawaited(
                                                      () async {
                                                        await actions.tagUser(
                                                          FFAppState().uidUser,
                                                          _model
                                                              .emailTextFieldTextController1
                                                              .text,
                                                        );
                                                      }(),
                                                    );

                                                    context.goNamedAuth(
                                                      HomeNavbarWidget
                                                          .routeName,
                                                      context.mounted,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                        ),
                                                      },
                                                      ignoreRedirect: true,
                                                    );

                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 500,
                                                      ),
                                                    );

                                                    context.goNamedAuth(
                                                      ELearningCheckoutPageWidget
                                                          .routeName,
                                                      context.mounted,
                                                      pathParameters: {
                                                        'uuidModule':
                                                            serializeParam(
                                                          widget.uuidModule,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                        ),
                                                      },
                                                      ignoreRedirect: true,
                                                    );
                                                  } else if (widget
                                                              .uuidProgramClass !=
                                                          null &&
                                                      widget.uuidProgramClass !=
                                                          '') {
                                                    unawaited(
                                                      () async {
                                                        await actions.tagUser(
                                                          FFAppState().uidUser,
                                                          _model
                                                              .emailTextFieldTextController1
                                                              .text,
                                                        );
                                                      }(),
                                                    );

                                                    context.goNamedAuth(
                                                      HomeNavbarWidget
                                                          .routeName,
                                                      context.mounted,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                        ),
                                                      },
                                                      ignoreRedirect: true,
                                                    );

                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 500,
                                                      ),
                                                    );

                                                    context.goNamedAuth(
                                                      OnlineClassDetailPageWidget
                                                          .routeName,
                                                      context.mounted,
                                                      pathParameters: {
                                                        'uuidProgramClass':
                                                            serializeParam(
                                                          widget
                                                              .uuidProgramClass,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                        ),
                                                      },
                                                      ignoreRedirect: true,
                                                    );
                                                  } else if (widget
                                                              .uuidEbook !=
                                                          null &&
                                                      widget.uuidEbook != '') {
                                                    unawaited(
                                                      () async {
                                                        await actions.tagUser(
                                                          FFAppState().uidUser,
                                                          _model
                                                              .emailTextFieldTextController1
                                                              .text,
                                                        );
                                                      }(),
                                                    );

                                                    context.goNamedAuth(
                                                      HomeNavbarWidget
                                                          .routeName,
                                                      context.mounted,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                        ),
                                                      },
                                                      ignoreRedirect: true,
                                                    );

                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 500,
                                                      ),
                                                    );

                                                    context.goNamedAuth(
                                                      EbookCheckoutPageWidget
                                                          .routeName,
                                                      context.mounted,
                                                      pathParameters: {
                                                        'uuidEbook':
                                                            serializeParam(
                                                          widget.uuidEbook,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                        ),
                                                      },
                                                      ignoreRedirect: true,
                                                    );
                                                  } else {
                                                    unawaited(
                                                      () async {
                                                        await actions.tagUser(
                                                          FFAppState().uidUser,
                                                          _model
                                                              .emailTextFieldTextController1
                                                              .text,
                                                        );
                                                      }(),
                                                    );

                                                    context.goNamedAuth(
                                                      HomeNavbarWidget
                                                          .routeName,
                                                      context.mounted,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                        ),
                                                      },
                                                      ignoreRedirect: true,
                                                    );
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          title: Text('ERROR!'),
                                                          content: Text(
                                                              AuthGroup
                                                                  .loginCall
                                                                  .errorMessage(
                                                            (_model.loginResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'aw2o3r7t' /* Sign in */,
                                              ),
                                              icon: Icon(
                                                Icons.login_outlined,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                iconColor: Colors.black,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbCareLightColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbCareLightColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                hoverColor:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                                hoverTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .sbCareLightColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.loginResultFP =
                                                    await AuthGroup.loginCall
                                                        .call(
                                                  email: _model
                                                      .emailTextFieldTextController1
                                                      .text,
                                                  password: _model
                                                      .passwordTextFieldTextController1
                                                      .text,
                                                );

                                                if ((_model.loginResultFP
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (AuthGroup.loginCall
                                                          .isProvider(
                                                        (_model.loginResultFP
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      true) {
                                                    FFAppState().token =
                                                        AuthGroup.loginCall
                                                            .token(
                                                      (_model.loginResultFP
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().uidUser =
                                                        AuthGroup.loginCall
                                                            .uidUser(
                                                      (_model.loginResultFP
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().refreshToken =
                                                        AuthGroup.loginCall
                                                            .refreshToken(
                                                      (_model.loginResultFP
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().uidProvider =
                                                        AuthGroup.loginCall
                                                            .uidProvider(
                                                      (_model.loginResultFP
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().update(() {});
                                                  } else {
                                                    FFAppState().token =
                                                        AuthGroup.loginCall
                                                            .token(
                                                      (_model.loginResultFP
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().uidUser =
                                                        AuthGroup.loginCall
                                                            .uidUser(
                                                      (_model.loginResultFP
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().refreshToken =
                                                        AuthGroup.loginCall
                                                            .refreshToken(
                                                      (_model.loginResultFP
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!;
                                                    FFAppState().update(() {});
                                                  }

                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();
                                                  await authManager.signIn(
                                                    authenticationToken:
                                                        FFAppState().token,
                                                    refreshToken: FFAppState()
                                                        .refreshToken,
                                                    tokenExpiration:
                                                        currentAuthTokenExpiration,
                                                    authUid:
                                                        FFAppState().uidUser,
                                                  );

                                                  context.pushNamedAuth(
                                                    HomeNavbarWidget.routeName,
                                                    context.mounted,
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
                                                            enText: 'WARNING!',
                                                            idText:
                                                                'PERINGATAN!',
                                                          )),
                                                          content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText:
                                                                'Please input the correct email and password',
                                                            idText:
                                                                'Harap masukkan email dan kata sandi yang benar',
                                                          )),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'vmmr41vd' /* Sign in */,
                                              ),
                                              icon: Icon(
                                                Icons.login_outlined,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 35.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .sbCareLightColor,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                hoverColor:
                                                    FlutterFlowTheme.of(context)
                                                        .sbcarePrimaryColor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .sbCareLightColor,
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .sbcarePrimaryColor,
                                              icon: Icon(
                                                Icons.fingerprint_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'qzkqqwi6' /* Don't have an account? */,
                                      ),
                                      textAlign: TextAlign.center,
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.goNamed(
                                              RegistrationScreenWidget
                                                  .routeName);
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'w68lxtc6' /* Sign up */,
                                        ),
                                        icon: Icon(
                                          Icons.create_outlined,
                                          size: 16.0,
                                        ),
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .sbcarePrimaryColor,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Color(0xFFED3A61),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .sbCareLightColor,
                                          hoverTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .sbcarePrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context)
                                    .sbCareLightColor,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (FFLocalizations.of(context)
                                                .languageCode ==
                                            'en') {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {},
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
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
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7wbjq4q4' /* EN */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setAppLanguage(context, 'en');
                                              FFAppState().language =
                                                  'English (US)';
                                              FFAppState().update(() {});
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
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
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xj58vxts' /* ID */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Container(
                                      width: 250.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setDarkModeSetting(
                                                      context, ThemeMode.light);
                                                  FFAppState().Theme =
                                                      'Light Theme';
                                                  FFAppState().update(() {});
                                                },
                                                child: Container(
                                                  width: 115.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.light
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                      ),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.wb_sunny_rounded,
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.light
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        size: 16.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ghphsdit' /* Light Mode */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .light
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setDarkModeSetting(
                                                      context, ThemeMode.dark);
                                                  FFAppState().Theme =
                                                      'Dark Theme';
                                                  FFAppState().update(() {});
                                                },
                                                child: Container(
                                                  width: 115.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.nightlight_round,
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        size: 16.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'vljoygi8' /* Dark Mode */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
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
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'containerOnActionTriggerAnimation1']!,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  enText: 'version ',
                                                  idText: 'versi ',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
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
                                              TextSpan(
                                                text:
                                                    FFAppState().versionNumber,
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .sbcarePrimaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 40.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.copyright_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '0xlgjyut' /* 2024 - 2026 SBCare - SmileBirt... */,
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
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'p7gvnkac' /* All rights reserved. */,
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
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                )
                                              ],
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
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 40.0)),
                          ),
                        ),
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              flex: 6,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF4B39EF),
                                ),
                                child: Stack(
                                  children: [
                                    Opacity(
                                      opacity: 0.8,
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            Duration(milliseconds: 500),
                                        imageUrl:
                                            'https://dimg.dreamflow.cloud/v1/image/happy%20family%20newborn%20baby%20smiling%20professional%20photo',
                                        fit: BoxFit.cover,
                                        alignment: Alignment(0.0, 0.0),
                                        errorWidget:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.jpg',
                                          fit: BoxFit.cover,
                                          alignment: Alignment(0.0, 0.0),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(32.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'tyv1x0by' /* SmileBirth Care */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineLargeFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    lineHeight: 1.2,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLargeIsCustom,
                                                  ),
                                            ),
                                            Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 500.0,
                                              ),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'zleal46g' /* Your journey to parenthood, su... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xCC000000),
                                            Colors.transparent
                                          ],
                                          stops: [0.0, 1.0],
                                          begin: AlignmentDirectional(0.0, 1.0),
                                          end: AlignmentDirectional(0, -1.0),
                                        ),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 5,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 480.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(32.0),
                                          child: Container(
                                            child: SingleChildScrollView(
                                              controller: _model
                                                  .containerScrollController2,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  40.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/SB_CARE_1.png',
                                                          width: 120.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'kztbqwzd' /* Sign in to your account to con... */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        TextFormField(
                                                          controller: _model
                                                              .emailTextFieldTextController2,
                                                          focusNode: _model
                                                              .emailTextFieldFocusNode2,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.emailTextFieldTextController2',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () => safeSetState(
                                                                () {}),
                                                          ),
                                                          autofocus: false,
                                                          autofillHints: [
                                                            AutofillHints.email
                                                          ],
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .none,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: false,
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'qqurq532' /* Email */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            alignLabelWithHint:
                                                                false,
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .sbCareLightColor,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFED3A61),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .email_outlined,
                                                              size: 20.0,
                                                            ),
                                                            suffixIcon: _model
                                                                    .emailTextFieldTextController2!
                                                                    .text
                                                                    .isNotEmpty
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model
                                                                          .emailTextFieldTextController2
                                                                          ?.clear();
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sbcarePrimaryColor,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  )
                                                                : null,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          enableInteractiveSelection:
                                                              true,
                                                          validator: _model
                                                              .emailTextFieldTextController2Validator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            if (!isAndroid &&
                                                                !isiOS)
                                                              TextInputFormatter
                                                                  .withFunction(
                                                                      (oldValue,
                                                                          newValue) {
                                                                return TextEditingValue(
                                                                  selection:
                                                                      newValue
                                                                          .selection,
                                                                  text: newValue
                                                                      .text
                                                                      .toCapitalization(
                                                                          TextCapitalization
                                                                              .none),
                                                                );
                                                              }),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        TextFormField(
                                                          controller: _model
                                                              .passwordTextFieldTextController2,
                                                          focusNode: _model
                                                              .passwordTextFieldFocusNode2,
                                                          autofocus: false,
                                                          autofillHints: [
                                                            AutofillHints
                                                                .password
                                                          ],
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .none,
                                                          obscureText: !_model
                                                              .passwordTextFieldVisibility2,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'bl4ja3t8' /* Password */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .sbCareLightColor,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFED3A61),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .lock_outlined,
                                                              size: 20.0,
                                                            ),
                                                            suffixIcon: InkWell(
                                                              onTap: () async {
                                                                safeSetState(() =>
                                                                    _model.passwordTextFieldVisibility2 =
                                                                        !_model
                                                                            .passwordTextFieldVisibility2);
                                                              },
                                                              focusNode: _model
                                                                  .passwordTextFieldPasswordVisibilityFocusNode2
                                                                ..skipTraversal =
                                                                    !(false),
                                                              child: Icon(
                                                                _model.passwordTextFieldVisibility2
                                                                    ? Icons
                                                                        .visibility_outlined
                                                                    : Icons
                                                                        .visibility_off_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .sbcarePrimaryColor,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                          maxLength: 64,
                                                          maxLengthEnforcement:
                                                              MaxLengthEnforcement
                                                                  .enforced,
                                                          buildCounter: (context,
                                                                  {required currentLength,
                                                                  required isFocused,
                                                                  maxLength}) =>
                                                              null,
                                                          keyboardType:
                                                              TextInputType
                                                                  .visiblePassword,
                                                          enableInteractiveSelection:
                                                              true,
                                                          validator: _model
                                                              .passwordTextFieldTextController2Validator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            if (!isAndroid &&
                                                                !isiOS)
                                                              TextInputFormatter
                                                                  .withFunction(
                                                                      (oldValue,
                                                                          newValue) {
                                                                return TextEditingValue(
                                                                  selection:
                                                                      newValue
                                                                          .selection,
                                                                  text: newValue
                                                                      .text
                                                                      .toCapitalization(
                                                                          TextCapitalization
                                                                              .none),
                                                                );
                                                              }),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    ForgotPasswordScreenWidget
                                                                        .routeName,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      '__transition_info__':
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 500),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'jo9nedbo' /* Forgot password? */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .sbcarePrimaryColor,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (FFAppState()
                                                              .fingerprintLogin ==
                                                          false) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      40.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    _model.loginResult2 =
                                                                        await AuthGroup
                                                                            .loginCall
                                                                            .call(
                                                                      email: _model
                                                                          .emailTextFieldTextController2
                                                                          .text,
                                                                      password: _model
                                                                          .passwordTextFieldTextController2
                                                                          .text,
                                                                    );

                                                                    if ((_model
                                                                            .loginResult2
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      if (AuthGroup
                                                                          .loginCall
                                                                          .isProvider(
                                                                        (_model.loginResult2?.jsonBody ??
                                                                            ''),
                                                                      )!) {
                                                                        FFAppState().token = AuthGroup
                                                                            .loginCall
                                                                            .token(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().uidUser = AuthGroup
                                                                            .loginCall
                                                                            .uidUser(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().refreshToken = AuthGroup
                                                                            .loginCall
                                                                            .refreshToken(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().uidProvider = AuthGroup
                                                                            .loginCall
                                                                            .fullname(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().fullname = AuthGroup
                                                                            .loginCall
                                                                            .fullname(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().emailUser = AuthGroup
                                                                            .loginCall
                                                                            .email(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().defaultProvider = AuthGroup
                                                                            .loginCall
                                                                            .defaultProvider(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      } else {
                                                                        FFAppState().token = AuthGroup
                                                                            .loginCall
                                                                            .token(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().uidUser = AuthGroup
                                                                            .loginCall
                                                                            .uidUser(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().refreshToken = AuthGroup
                                                                            .loginCall
                                                                            .refreshToken(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().fullname = AuthGroup
                                                                            .loginCall
                                                                            .fullname(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().emailUser = AuthGroup
                                                                            .loginCall
                                                                            .email(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().defaultProvider = AuthGroup
                                                                            .loginCall
                                                                            .defaultProvider(
                                                                          (_model.loginResult2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      }

                                                                      GoRouter.of(
                                                                              context)
                                                                          .prepareAuthEvent(
                                                                              true);
                                                                      await authManager
                                                                          .signIn(
                                                                        authenticationToken:
                                                                            FFAppState().token,
                                                                        refreshToken:
                                                                            FFAppState().refreshToken,
                                                                        tokenExpiration:
                                                                            currentAuthTokenExpiration,
                                                                        authUid:
                                                                            FFAppState().uidUser,
                                                                      );
                                                                      if (widget.uuidModule !=
                                                                              null &&
                                                                          widget.uuidModule !=
                                                                              '') {
                                                                        unawaited(
                                                                          () async {
                                                                            await actions.tagUser(
                                                                              FFAppState().uidUser,
                                                                              _model.emailTextFieldTextController2.text,
                                                                            );
                                                                          }(),
                                                                        );

                                                                        context
                                                                            .goNamedAuth(
                                                                          HomeNavbarWidget
                                                                              .routeName,
                                                                          context
                                                                              .mounted,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            '__transition_info__':
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 500),
                                                                            ),
                                                                          },
                                                                          ignoreRedirect:
                                                                              true,
                                                                        );

                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                500,
                                                                          ),
                                                                        );

                                                                        context
                                                                            .goNamedAuth(
                                                                          ELearningCheckoutPageWidget
                                                                              .routeName,
                                                                          context
                                                                              .mounted,
                                                                          pathParameters:
                                                                              {
                                                                            'uuidModule':
                                                                                serializeParam(
                                                                              widget.uuidModule,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            '__transition_info__':
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 500),
                                                                            ),
                                                                          },
                                                                          ignoreRedirect:
                                                                              true,
                                                                        );
                                                                      } else if (widget.uuidProgramClass !=
                                                                              null &&
                                                                          widget.uuidProgramClass !=
                                                                              '') {
                                                                        unawaited(
                                                                          () async {
                                                                            await actions.tagUser(
                                                                              FFAppState().uidUser,
                                                                              _model.emailTextFieldTextController2.text,
                                                                            );
                                                                          }(),
                                                                        );

                                                                        context
                                                                            .goNamedAuth(
                                                                          HomeNavbarWidget
                                                                              .routeName,
                                                                          context
                                                                              .mounted,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            '__transition_info__':
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 500),
                                                                            ),
                                                                          },
                                                                          ignoreRedirect:
                                                                              true,
                                                                        );

                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                500,
                                                                          ),
                                                                        );

                                                                        context
                                                                            .goNamedAuth(
                                                                          OnlineClassDetailPageWidget
                                                                              .routeName,
                                                                          context
                                                                              .mounted,
                                                                          pathParameters:
                                                                              {
                                                                            'uuidProgramClass':
                                                                                serializeParam(
                                                                              widget.uuidProgramClass,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            '__transition_info__':
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 500),
                                                                            ),
                                                                          },
                                                                          ignoreRedirect:
                                                                              true,
                                                                        );
                                                                      } else if (widget.uuidEbook !=
                                                                              null &&
                                                                          widget.uuidEbook !=
                                                                              '') {
                                                                        unawaited(
                                                                          () async {
                                                                            await actions.tagUser(
                                                                              FFAppState().uidUser,
                                                                              _model.emailTextFieldTextController2.text,
                                                                            );
                                                                          }(),
                                                                        );

                                                                        context
                                                                            .goNamedAuth(
                                                                          HomeNavbarWidget
                                                                              .routeName,
                                                                          context
                                                                              .mounted,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            '__transition_info__':
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 500),
                                                                            ),
                                                                          },
                                                                          ignoreRedirect:
                                                                              true,
                                                                        );

                                                                        await Future
                                                                            .delayed(
                                                                          Duration(
                                                                            milliseconds:
                                                                                500,
                                                                          ),
                                                                        );

                                                                        context
                                                                            .goNamedAuth(
                                                                          EbookCheckoutPageWidget
                                                                              .routeName,
                                                                          context
                                                                              .mounted,
                                                                          pathParameters:
                                                                              {
                                                                            'uuidEbook':
                                                                                serializeParam(
                                                                              widget.uuidEbook,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            '__transition_info__':
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 500),
                                                                            ),
                                                                          },
                                                                          ignoreRedirect:
                                                                              true,
                                                                        );
                                                                      } else {
                                                                        unawaited(
                                                                          () async {
                                                                            await actions.tagUser(
                                                                              FFAppState().uidUser,
                                                                              _model.emailTextFieldTextController2.text,
                                                                            );
                                                                          }(),
                                                                        );

                                                                        context
                                                                            .goNamedAuth(
                                                                          HomeNavbarWidget
                                                                              .routeName,
                                                                          context
                                                                              .mounted,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            '__transition_info__':
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 500),
                                                                            ),
                                                                          },
                                                                          ignoreRedirect:
                                                                              true,
                                                                        );
                                                                      }
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              title: Text('ERROR!'),
                                                                              content: Text(AuthGroup.loginCall.errorMessage(
                                                                                (_model.loginResult2?.jsonBody ?? ''),
                                                                              )!),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '10usxmr3' /* Sign in */,
                                                                  ),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .login_outlined,
                                                                    size: 20.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconColor:
                                                                        Colors
                                                                            .black,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbCareLightColor,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .sbCareLightColor,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    hoverColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .sbcarePrimaryColor,
                                                                    hoverTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .sbCareLightColor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      20.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    _model.loginResultFP2 =
                                                                        await AuthGroup
                                                                            .loginCall
                                                                            .call(
                                                                      email: _model
                                                                          .emailTextFieldTextController2
                                                                          .text,
                                                                      password: _model
                                                                          .passwordTextFieldTextController2
                                                                          .text,
                                                                    );

                                                                    if ((_model
                                                                            .loginResultFP2
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      if (AuthGroup
                                                                              .loginCall
                                                                              .isProvider(
                                                                            (_model.loginResultFP2?.jsonBody ??
                                                                                ''),
                                                                          ) ==
                                                                          true) {
                                                                        FFAppState().token = AuthGroup
                                                                            .loginCall
                                                                            .token(
                                                                          (_model.loginResultFP2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().uidUser = AuthGroup
                                                                            .loginCall
                                                                            .uidUser(
                                                                          (_model.loginResultFP2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().refreshToken = AuthGroup
                                                                            .loginCall
                                                                            .refreshToken(
                                                                          (_model.loginResultFP2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().uidProvider = AuthGroup
                                                                            .loginCall
                                                                            .uidProvider(
                                                                          (_model.loginResultFP2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      } else {
                                                                        FFAppState().token = AuthGroup
                                                                            .loginCall
                                                                            .token(
                                                                          (_model.loginResultFP2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().uidUser = AuthGroup
                                                                            .loginCall
                                                                            .uidUser(
                                                                          (_model.loginResultFP2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState().refreshToken = AuthGroup
                                                                            .loginCall
                                                                            .refreshToken(
                                                                          (_model.loginResultFP2?.jsonBody ??
                                                                              ''),
                                                                        )!;
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      }

                                                                      GoRouter.of(
                                                                              context)
                                                                          .prepareAuthEvent();
                                                                      await authManager
                                                                          .signIn(
                                                                        authenticationToken:
                                                                            FFAppState().token,
                                                                        refreshToken:
                                                                            FFAppState().refreshToken,
                                                                        tokenExpiration:
                                                                            currentAuthTokenExpiration,
                                                                        authUid:
                                                                            FFAppState().uidUser,
                                                                      );

                                                                      context
                                                                          .pushNamedAuth(
                                                                        HomeNavbarWidget
                                                                            .routeName,
                                                                        context
                                                                            .mounted,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          '__transition_info__':
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.fade,
                                                                            duration:
                                                                                Duration(milliseconds: 500),
                                                                          ),
                                                                        },
                                                                      );
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              title: Text(FFLocalizations.of(context).getVariableText(
                                                                                enText: 'WARNING!',
                                                                                idText: 'PERINGATAN!',
                                                                              )),
                                                                              content: Text(FFLocalizations.of(context).getVariableText(
                                                                                enText: 'Please input the correct email and password',
                                                                                idText: 'Harap masukkan email dan kata sandi yang benar',
                                                                              )),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '6ird288u' /* Sign in */,
                                                                  ),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .login_outlined,
                                                                    size: 20.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        35.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .sbCareLightColor,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    hoverColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .sbcarePrimaryColor,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .sbCareLightColor,
                                                                  hoverColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .sbcarePrimaryColor,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .fingerprint_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 20.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'hfgjj9nh' /* Don't have an account? */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
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
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.goNamed(
                                                                  RegistrationScreenWidget
                                                                      .routeName);
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'ixkkmq4b' /* Sign up */,
                                                            ),
                                                            icon: Icon(
                                                              Icons
                                                                  .create_outlined,
                                                              size: 16.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
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
                                                              iconColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .sbcarePrimaryColor,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Color(
                                                                            0xFFED3A61),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .sbCareLightColor,
                                                              hoverTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .sbcarePrimaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .sbCareLightColor,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        8.0,
                                                                        16.0,
                                                                        8.0),
                                                            child: Container(
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (FFLocalizations.of(
                                                                              context)
                                                                          .languageCode ==
                                                                      'en') {
                                                                    return InkWell(
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
                                                                        setAppLanguage(
                                                                            context,
                                                                            'id');
                                                                        FFAppState().language =
                                                                            'Bahasa Indonesia (ID)';
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.language_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'ibid9961' /* English (US) */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  lineHeight: 1.38,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return InkWell(
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
                                                                        setAppLanguage(
                                                                            context,
                                                                            'en');
                                                                        FFAppState().language =
                                                                            'English (US)';
                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.language_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'iv5pfr8j' /* Indonesian (ID) */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  lineHeight: 1.38,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 250.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
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
                                                                      setDarkModeSetting(
                                                                          context,
                                                                          ThemeMode
                                                                              .light);
                                                                      FFAppState()
                                                                              .Theme =
                                                                          'Light Theme';
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          115.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Theme.of(context).brightness ==
                                                                                Brightness.light
                                                                            ? FlutterFlowTheme.of(context).secondaryBackground
                                                                            : FlutterFlowTheme.of(context).primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            Theme.of(context).brightness == Brightness.light
                                                                                ? FlutterFlowTheme.of(context).alternate
                                                                                : FlutterFlowTheme.of(context).primaryBackground,
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.wb_sunny_rounded,
                                                                            color: Theme.of(context).brightness == Brightness.light
                                                                                ? FlutterFlowTheme.of(context).primaryText
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'jsize9xe' /* Light Mode */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: Theme.of(context).brightness == Brightness.light ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
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
                                                                      setDarkModeSetting(
                                                                          context,
                                                                          ThemeMode
                                                                              .dark);
                                                                      FFAppState()
                                                                              .Theme =
                                                                          'Dark Theme';
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          115.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Theme.of(context).brightness ==
                                                                                Brightness.dark
                                                                            ? FlutterFlowTheme.of(context).secondaryBackground
                                                                            : FlutterFlowTheme.of(context).primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            Theme.of(context).brightness == Brightness.dark
                                                                                ? FlutterFlowTheme.of(context).alternate
                                                                                : FlutterFlowTheme.of(context).primaryBackground,
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.nightlight_round,
                                                                            color: Theme.of(context).brightness == Brightness.dark
                                                                                ? FlutterFlowTheme.of(context).primaryText
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'jltpmqrb' /* Dark Mode */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: Theme.of(context).brightness == Brightness.dark ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ).animateOnActionTrigger(
                                                                    animationsMap[
                                                                        'containerOnActionTriggerAnimation2']!,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 16.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                      enText: 'version ',
                                                      idText: 'versi ',
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
                                                              .sbcarePrimaryColor,
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
                                                  TextSpan(
                                                    text: FFAppState()
                                                        .versionNumber,
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .sbcarePrimaryColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12.0,
                                                    ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .sbcarePrimaryColor,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.copyright_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 14.0,
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dg80pk5i' /* 2024 - 2026 SBCare - SmileBirt... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        lineHeight: 1.27,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmallIsCustom,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 50.0)),
                                ),
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
