import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'e_learning_redeem_code_page_model.dart';
export 'e_learning_redeem_code_page_model.dart';

class ELearningRedeemCodePageWidget extends StatefulWidget {
  const ELearningRedeemCodePageWidget({
    super.key,
    this.uuidModule,
  });

  final String? uuidModule;

  static String routeName = 'ELearningRedeemCodePage';
  static String routePath = 'elearning/:uuidModule/redeem';

  @override
  State<ELearningRedeemCodePageWidget> createState() =>
      _ELearningRedeemCodePageWidgetState();
}

class _ELearningRedeemCodePageWidgetState
    extends State<ELearningRedeemCodePageWidget> {
  late ELearningRedeemCodePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ELearningRedeemCodePageModel());

    _model.codeTFTextController ??= TextEditingController();
    _model.codeTFFocusNode ??= FocusNode();

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
        title: 'E-Learning Redeem Code | SBCare - SmileBirth',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).sbCareLightColor,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).sbcarePrimaryColor,
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
                  'c0z8jcxq' /* E-Learning Redeem Code */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: Colors.white,
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
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 12.0, 32.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'nzuw1jrg' /* Enter your code below to redee... */,
                              ),
                              textAlign: TextAlign.center,
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
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 32.0, 32.0, 0.0),
                              child: TextFormField(
                                controller: _model.codeTFTextController,
                                focusNode: _model.codeTFFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.codeTFTextController',
                                  Duration(milliseconds: 2000),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                autofillHints: [AutofillHints.oneTimeCode],
                                textCapitalization:
                                    TextCapitalization.characters,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: FFLocalizations.of(context).getText(
                                    'h7q59r6x' /* Enter redemption code */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  suffixIcon: _model
                                          .codeTFTextController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.codeTFTextController
                                                ?.clear();
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .sbcarePrimaryColor,
                                            size: 20.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyLargeFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyLargeIsCustom,
                                    ),
                                maxLength: 6,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                buildCounter: (context,
                                        {required currentLength,
                                        required isFocused,
                                        maxLength}) =>
                                    null,
                                cursorColor: FlutterFlowTheme.of(context)
                                    .sbcarePrimaryColor,
                                enableInteractiveSelection: true,
                                validator: _model.codeTFTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  if (!isAndroid && !isiOS)
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      return TextEditingValue(
                                        selection: newValue.selection,
                                        text: newValue.text.toCapitalization(
                                            TextCapitalization.characters),
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 24.0, 32.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.redeemCode = await ModuleClientGroup
                                    .redeemModuleCall
                                    .call(
                                  token: FFAppState().token,
                                  uuidModul: widget.uuidModule,
                                  code: _model.codeTFTextController.text,
                                );

                                if ((_model.redeemCode?.succeeded ?? true)) {
                                  context.goNamed(
                                    ELearningSuccessRedeemScreenWidget
                                        .routeName,
                                    pathParameters: {
                                      'uuidModule': serializeParam(
                                        widget.uuidModule,
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
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            enText: 'Redeem Status',
                                            idText: 'Status Penukaran',
                                          )),
                                          content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            enText:
                                                'Please input a valid code!',
                                            idText:
                                                'Silakan masukkan kode yang valid!',
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
                                }

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'qmwa8m3n' /* Redeem */,
                              ),
                              icon: Icon(
                                Icons.redeem_outlined,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                color: FlutterFlowTheme.of(context)
                                    .sbcarePrimaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'wxc4lda0' /* Need help?  */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodySmallIsCustom,
                                      ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    await launchURL(
                                        'https://api.whatsapp.com/send?phone=6285881397361');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '06fkpctp' /* Contact SBCare Admin */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 30.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .sbCareLightColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .sbcarePrimaryColor,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(20.0),
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
            ),
          ),
        ));
  }
}
