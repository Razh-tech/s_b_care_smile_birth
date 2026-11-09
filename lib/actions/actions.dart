import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';

Future actionFlowForUnauthorizedUser(
  BuildContext context, {
  required bool? isProvider,
}) async {
  if (isProvider == false) {
    if (Navigator.of(context).canPop()) {
      context.pop();
    }
    context.pushNamed(RestrictedRoleScreenWidget.routeName);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Some error occurred!',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}
