import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'empty_list_my_ebook_component_model.dart';
export 'empty_list_my_ebook_component_model.dart';

class EmptyListMyEbookComponentWidget extends StatefulWidget {
  const EmptyListMyEbookComponentWidget({super.key});

  @override
  State<EmptyListMyEbookComponentWidget> createState() =>
      _EmptyListMyEbookComponentWidgetState();
}

class _EmptyListMyEbookComponentWidgetState
    extends State<EmptyListMyEbookComponentWidget> {
  late EmptyListMyEbookComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListMyEbookComponentModel());

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
                '6nwk4l1u' /* No Program Found */,
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
                '47lbhi1c' /* You can purchase a Program in
... */
                ,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(EbookListPageWidget.routeName);
                },
                text: FFLocalizations.of(context).getText(
                  'fp86dysp' /* Purchase Program */,
                ),
                icon: FaIcon(
                  FaIconData(const IconData(/* shoppingCart */ 0xf07a,
                      fontFamily: 'FontAwesomeSolid',
                      fontPackage: 'font_awesome_flutter')),
                  size: 20.0,
                ),
                options: FFButtonOptions(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconColor: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                  color: FlutterFlowTheme.of(context).sbCareLightColor,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
