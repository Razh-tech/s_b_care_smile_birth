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

import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

Future<String?> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? device_info;

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    device_info = androidInfo.brand +
        ', ' +
        androidInfo.model +
        ', ' +
        androidInfo.version.sdkInt.toString();
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    device_info =
        iosInfo.name + ', ' + iosInfo.model + ', ' + iosInfo.systemVersion;
  } else if (Platform.isWindows) {
    final windowsInfo = await deviceInfo.windowsInfo;
    device_info =
        'Windows: ${windowsInfo.computerName}, ${windowsInfo.deviceId}';
  } else if (Platform.isMacOS) {
    final macInfo = await deviceInfo.macOsInfo;
    device_info = 'macOS: ${macInfo.computerName}, ${macInfo.osRelease}';
  }

  return device_info;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
