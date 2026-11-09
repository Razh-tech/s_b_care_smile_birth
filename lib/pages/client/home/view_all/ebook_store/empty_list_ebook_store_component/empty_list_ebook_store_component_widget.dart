import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'empty_list_ebook_store_component_model.dart';
export 'empty_list_ebook_store_component_model.dart';

class EmptyListEbookStoreComponentWidget extends StatefulWidget {
  const EmptyListEbookStoreComponentWidget({super.key});

  @override
  State<EmptyListEbookStoreComponentWidget> createState() =>
      _EmptyListEbookStoreComponentWidgetState();
}

class _EmptyListEbookStoreComponentWidgetState
    extends State<EmptyListEbookStoreComponentWidget> {
  late EmptyListEbookStoreComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListEbookStoreComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.list_alt_rounded,
              color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
              size: 48.0,
            ),
            Text(
              FFLocalizations.of(context).getText(
                'bzlobn2p' /* No Program Found */,
              ),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).titleMediumIsCustom,
                  ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'e44jtr9e' /* Please contact SBCare Admin fo... */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 48.0,
              fillColor: Color(0xFF28D146),
              icon: FaIcon(
                FaIconData(const IconData(/* whatsapp */ 0xf232,
                    fontFamily: 'FontAwesomeBrands',
                    fontPackage: 'font_awesome_flutter')),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 30.0,
              ),
              onPressed: () async {
                await launchURL(
                    'https://api.whatsapp.com/send?phone=6282138839119');
              },
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
