import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'e_learning_voucher_generate_page_model.dart';
export 'e_learning_voucher_generate_page_model.dart';

class ELearningVoucherGeneratePageWidget extends StatefulWidget {
  const ELearningVoucherGeneratePageWidget({super.key});

  static String routeName = 'ELearningVoucherGeneratePage';
  static String routePath = 'provider/voucher/elearning-generate';

  @override
  State<ELearningVoucherGeneratePageWidget> createState() =>
      _ELearningVoucherGeneratePageWidgetState();
}

class _ELearningVoucherGeneratePageWidgetState
    extends State<ELearningVoucherGeneratePageWidget> {
  late ELearningVoucherGeneratePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ELearningVoucherGeneratePageModel());

    _model.quantityTFTextController ??= TextEditingController();
    _model.quantityTFFocusNode ??= FocusNode();

    _model.notesTFTextController ??= TextEditingController();
    _model.notesTFFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.quantityTFTextController?.text =
              FFLocalizations.of(context).getText(
            'qy3xy0s7' /* 1 */,
          );
        }));
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
        title: 'E-Learning Voucher | SBCare - SmileBirth',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                  '20b4xfmb' /* E-Learning Voucher */,
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: SingleChildScrollView(
                  controller: _model.columnController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '3lauj5it' /* Generate Voucher Code for Clie... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: GetELearningModulesCall.call(
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
                                    color: FlutterFlowTheme.of(context)
                                        .sbcarePrimaryColor,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            final rowGetELearningModulesResponse =
                                snapshot.data!;

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.elearningDDValueController ??=
                                            FormFieldController<String>(null),
                                    options: List<String>.from(
                                        GetELearningModulesCall.uidModule(
                                      rowGetELearningModulesResponse.jsonBody,
                                    )!),
                                    optionLabels:
                                        GetELearningModulesCall.moduleInfo(
                                      rowGetELearningModulesResponse.jsonBody,
                                    )!,
                                    onChanged: (val) => safeSetState(
                                        () => _model.elearningDDValue = val),
                                    maxHeight: 400.0,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
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
                                    searchTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'v9olzdz6' /* Select E-learning module */,
                                    ),
                                    searchHintText:
                                        FFLocalizations.of(context).getText(
                                      'v0qs2ui8' /* Search module */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .sbCareLightColor,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 4.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'it1g5gwz' /* Quantity */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .sbcarePrimaryColor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                          TextFormField(
                            controller: _model.quantityTFTextController,
                            focusNode: _model.quantityTFFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.quantityTFTextController',
                              Duration(milliseconds: 2000),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelMediumIsCustom,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .sbcarePrimaryColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              suffixIcon: _model
                                      .quantityTFTextController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.quantityTFTextController
                                            ?.clear();
                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .sbcarePrimaryColor,
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            maxLength: 2,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.number,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.quantityTFTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 4.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '1jp1tn37' /* Notes */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
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
                              child: TextFormField(
                                controller: _model.notesTFTextController,
                                focusNode: _model.notesTFFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelMediumIsCustom,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .sbcarePrimaryColor,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                maxLines: 5,
                                maxLength: 255,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.notesTFTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText: 'Confirmation',
                                                idText: 'Konfirmasi',
                                              )),
                                              content: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText:
                                                    'Are you sure you would like to generate a code for your client? Your SBPay Balance will be reduced according to the E-Learning price.',
                                                idText:
                                                    'Apakah Anda yakin ingin membuat kode untuk klien Anda? Saldo SBPay Anda akan dikurangi sesuai harga E-Learning',
                                              )),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    enText: 'Cancel',
                                                    idText: 'Batal',
                                                  )),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
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
                                    _model.generateCodeResult =
                                        await GenerateELearningCodeCall.call(
                                      token: FFAppState().token,
                                      uuidModul: _model.elearningDDValue,
                                      notes: _model.notesTFTextController.text,
                                      maxRedemptions: int.tryParse(
                                          _model.quantityTFTextController.text),
                                    );

                                    if ((_model.generateCodeResult?.succeeded ??
                                        true)) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText: 'Generate Code Status',
                                                idText: 'Status Pembuatan Kode',
                                              )),
                                              content: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText:
                                                    'E-Learning Activation Code has been generated successfully.',
                                                idText:
                                                    'Kode aktivasi E-Learning telah berhasil dibuat.',
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
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                          VoucherHistoryPageWidget.routeName);
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText: 'Generate Code Status',
                                                idText: 'Status Pembuatan Kode',
                                              )),
                                              content: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText:
                                                    'Please ensure that your SBPay balance is sufficient.',
                                                idText:
                                                    'Pastikan saldo SBPay Anda cukup.',
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
                                  }

                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'agumi6rw' /* Create Voucher */,
                                ),
                                icon: Icon(
                                  Icons.generating_tokens_outlined,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconColor: FlutterFlowTheme.of(context).info,
                                  color: FlutterFlowTheme.of(context)
                                      .sbcarePrimaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
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
