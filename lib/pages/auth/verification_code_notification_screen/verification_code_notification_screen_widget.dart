import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'verification_code_notification_screen_model.dart';
export 'verification_code_notification_screen_model.dart';

/// A page to give user a message; that the verification code has been sent to
/// user's email; forgot password context
class VerificationCodeNotificationScreenWidget extends StatefulWidget {
  const VerificationCodeNotificationScreenWidget({
    super.key,
    this.destinationEmail,
  });

  final String? destinationEmail;

  static String routeName = 'VerificationCodeNotificationScreen';
  static String routePath = 'verification-code-notification';

  @override
  State<VerificationCodeNotificationScreenWidget> createState() =>
      _VerificationCodeNotificationScreenWidgetState();
}

class _VerificationCodeNotificationScreenWidgetState
    extends State<VerificationCodeNotificationScreenWidget> {
  late VerificationCodeNotificationScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => VerificationCodeNotificationScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Verification Code Notification | SBCare - SmileBirth',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
                              child: Icon(
                                Icons.email_outlined,
                                color: FlutterFlowTheme.of(context)
                                    .sbcarePrimaryColor,
                                size: 86.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sfadjx42' /* Check your email */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displaySmallFamily,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .displaySmallIsCustom,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '5160b2lf' /* We've sent a verification code... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'f07hyxe2' /* Didn't receive the email? Chec... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 40.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.resendEmailResult =
                                      await VerificationGroup
                                          .resendEmailResetPasswordCall
                                          .call(
                                    email: widget.destinationEmail,
                                  );

                                  if ((_model.resendEmailResult?.succeeded ??
                                      true)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'INFORMATION',
                                              idText: 'INFORMASI',
                                            )),
                                            content: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText:
                                                  'We\'ve sent a verification code to your email.',
                                              idText:
                                                  'Kami telah mengirimkan kode verifikasi ke email Anda.',
                                            )),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('ERROR'),
                                            content: Text((_model
                                                    .resendEmailResult
                                                    ?.exceptionMessage ??
                                                '')),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
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
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '2sd2xoz4' /* Resend verification code */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .sbcarePrimaryColor,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(
                                    VerifyEmailScreenWidget.routeName,
                                    queryParameters: {
                                      'destinationEmail': serializeParam(
                                        widget.destinationEmail,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 500),
                                      ),
                                    },
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  '8z19bg4y' /* Enter Verification Code */,
                                ),
                                icon: Icon(
                                  Icons.input_outlined,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconColor: Colors.black,
                                  color: FlutterFlowTheme.of(context)
                                      .sbCareLightColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .sbcarePrimaryColor,
                                  hoverTextColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
            ),
          ),
        ));
  }
}
