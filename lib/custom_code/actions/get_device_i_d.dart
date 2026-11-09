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

Future<String?> getDeviceID() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? deviceId;

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id; // Unique ID for Android
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceId = iosInfo.identifierForVendor; // Unique ID for iOS
  } else if (Platform.isWindows) {
    WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
    deviceId = windowsInfo.deviceId; // Unique ID for Windows
  } else if (Platform.isMacOS) {
    MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
    deviceId = macInfo.systemGUID; // Unique ID for macOS
  }

  return deviceId;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
