// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

/// Initialises Branch SDK.
///
/// Add this action as a final action in main.dart
Future initBranch() async {
  // Add your function code here!
  await FlutterBranchSdk.init();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
