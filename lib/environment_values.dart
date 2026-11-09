import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _branchLinkDomain = data['branchLinkDomain'];
      _branchKey = data['branchKey'];
      _branchAlternateLinkDomain = data['branchAlternateLinkDomain'];
      _isTestMode = data['isTestMode'];
      _sbcareLinkDomain = data['sbcareLinkDomain'];
      _sbcareAlternateLinkDomain = data['sbcareAlternateLinkDomain'];
      _androidLinkDomain = data['androidLinkDomain'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _branchLinkDomain = '';
  String get branchLinkDomain => _branchLinkDomain;

  String _branchKey = '';
  String get branchKey => _branchKey;

  String _branchAlternateLinkDomain = '';
  String get branchAlternateLinkDomain => _branchAlternateLinkDomain;

  bool _isTestMode = false;
  bool get isTestMode => _isTestMode;

  String _sbcareLinkDomain = '';
  String get sbcareLinkDomain => _sbcareLinkDomain;

  String _sbcareAlternateLinkDomain = '';
  String get sbcareAlternateLinkDomain => _sbcareAlternateLinkDomain;

  String _androidLinkDomain = '';
  String get androidLinkDomain => _androidLinkDomain;
}
