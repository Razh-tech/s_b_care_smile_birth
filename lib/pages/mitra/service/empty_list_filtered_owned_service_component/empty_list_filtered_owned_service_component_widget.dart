import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_list_filtered_owned_service_component_model.dart';
export 'empty_list_filtered_owned_service_component_model.dart';

class EmptyListFilteredOwnedServiceComponentWidget extends StatefulWidget {
  const EmptyListFilteredOwnedServiceComponentWidget({super.key});

  @override
  State<EmptyListFilteredOwnedServiceComponentWidget> createState() =>
      _EmptyListFilteredOwnedServiceComponentWidgetState();
}

class _EmptyListFilteredOwnedServiceComponentWidgetState
    extends State<EmptyListFilteredOwnedServiceComponentWidget> {
  late EmptyListFilteredOwnedServiceComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => EmptyListFilteredOwnedServiceComponentModel());

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
                '53mcaucq' /* No Services Found */,
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
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
