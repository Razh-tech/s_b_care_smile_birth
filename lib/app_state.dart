import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _refreshToken =
          await secureStorage.getString('ff_refreshToken') ?? _refreshToken;
    });
    await _safeInitAsync(() async {
      _uidUser = await secureStorage.getString('ff_uidUser') ?? _uidUser;
    });
    await _safeInitAsync(() async {
      _uidProvider =
          await secureStorage.getString('ff_uidProvider') ?? _uidProvider;
    });
    await _safeInitAsync(() async {
      _defaultProvider = await secureStorage.getString('ff_defaultProvider') ??
          _defaultProvider;
    });
    await _safeInitAsync(() async {
      _fullname = await secureStorage.getString('ff_fullname') ?? _fullname;
    });
    await _safeInitAsync(() async {
      _providerName =
          await secureStorage.getString('ff_providerName') ?? _providerName;
    });
    await _safeInitAsync(() async {
      _emailUser = await secureStorage.getString('ff_emailUser') ?? _emailUser;
    });
    await _safeInitAsync(() async {
      _emailProvider =
          await secureStorage.getString('ff_emailProvider') ?? _emailProvider;
    });
    await _safeInitAsync(() async {
      _countyHomeAddress =
          await secureStorage.getString('ff_countyHomeAddress') ??
              _countyHomeAddress;
    });
    await _safeInitAsync(() async {
      _language = await secureStorage.getString('ff_language') ?? _language;
    });
    await _safeInitAsync(() async {
      _Theme = await secureStorage.getString('ff_Theme') ?? _Theme;
    });
    await _safeInitAsync(() async {
      _deviceId = await secureStorage.getString('ff_deviceId') ?? _deviceId;
    });
    await _safeInitAsync(() async {
      _deviceToken =
          await secureStorage.getString('ff_deviceToken') ?? _deviceToken;
    });
    await _safeInitAsync(() async {
      _deviceInfo =
          await secureStorage.getString('ff_deviceInfo') ?? _deviceInfo;
    });
    await _safeInitAsync(() async {
      _canonicalIdentifier =
          await secureStorage.getString('ff_canonicalIdentifier') ??
              _canonicalIdentifier;
    });
    await _safeInitAsync(() async {
      _referringLink =
          await secureStorage.getString('ff_referringLink') ?? _referringLink;
    });
    await _safeInitAsync(() async {
      _lastPathSegment = await secureStorage.getString('ff_lastPathSegment') ??
          _lastPathSegment;
    });
    await _safeInitAsync(() async {
      _fingerprintLogin = await secureStorage.getBool('ff_fingerprintLogin') ??
          _fingerprintLogin;
    });
    await _safeInitAsync(() async {
      _emailNotif = await secureStorage.getBool('ff_emailNotif') ?? _emailNotif;
    });
    await _safeInitAsync(() async {
      _subscriptionId =
          await secureStorage.getString('ff_subscriptionId') ?? _subscriptionId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String value) {
    _refreshToken = value;
    secureStorage.setString('ff_refreshToken', value);
  }

  void deleteRefreshToken({bool resetState = false}) {
    if (resetState) {
      _refreshToken = '';
    }
    secureStorage.delete(key: 'ff_refreshToken');
  }

  String _uidUser = '';
  String get uidUser => _uidUser;
  set uidUser(String value) {
    _uidUser = value;
    secureStorage.setString('ff_uidUser', value);
  }

  void deleteUidUser({bool resetState = false}) {
    if (resetState) {
      _uidUser = '';
    }
    secureStorage.delete(key: 'ff_uidUser');
  }

  String _uidProvider = '';
  String get uidProvider => _uidProvider;
  set uidProvider(String value) {
    _uidProvider = value;
    secureStorage.setString('ff_uidProvider', value);
  }

  void deleteUidProvider({bool resetState = false}) {
    if (resetState) {
      _uidProvider = '';
    }
    secureStorage.delete(key: 'ff_uidProvider');
  }

  String _defaultProvider = '';
  String get defaultProvider => _defaultProvider;
  set defaultProvider(String value) {
    _defaultProvider = value;
    secureStorage.setString('ff_defaultProvider', value);
  }

  void deleteDefaultProvider({bool resetState = false}) {
    if (resetState) {
      _defaultProvider = '';
    }
    secureStorage.delete(key: 'ff_defaultProvider');
  }

  int _sbpayBalance = 0;
  int get sbpayBalance => _sbpayBalance;
  set sbpayBalance(int value) {
    _sbpayBalance = value;
  }

  String _fullname = '';
  String get fullname => _fullname;
  set fullname(String value) {
    _fullname = value;
    secureStorage.setString('ff_fullname', value);
  }

  void deleteFullname({bool resetState = false}) {
    if (resetState) {
      _fullname = '';
    }
    secureStorage.delete(key: 'ff_fullname');
  }

  String _providerName = '';
  String get providerName => _providerName;
  set providerName(String value) {
    _providerName = value;
    secureStorage.setString('ff_providerName', value);
  }

  void deleteProviderName({bool resetState = false}) {
    if (resetState) {
      _providerName = '';
    }
    secureStorage.delete(key: 'ff_providerName');
  }

  String _emailUser = '';
  String get emailUser => _emailUser;
  set emailUser(String value) {
    _emailUser = value;
    secureStorage.setString('ff_emailUser', value);
  }

  void deleteEmailUser({bool resetState = false}) {
    if (resetState) {
      _emailUser = '';
    }
    secureStorage.delete(key: 'ff_emailUser');
  }

  String _emailProvider = '';
  String get emailProvider => _emailProvider;
  set emailProvider(String value) {
    _emailProvider = value;
    secureStorage.setString('ff_emailProvider', value);
  }

  void deleteEmailProvider({bool resetState = false}) {
    if (resetState) {
      _emailProvider = '';
    }
    secureStorage.delete(key: 'ff_emailProvider');
  }

  String _countyHomeAddress = '';
  String get countyHomeAddress => _countyHomeAddress;
  set countyHomeAddress(String value) {
    _countyHomeAddress = value;
    secureStorage.setString('ff_countyHomeAddress', value);
  }

  void deleteCountyHomeAddress({bool resetState = false}) {
    if (resetState) {
      _countyHomeAddress = '';
    }
    secureStorage.delete(key: 'ff_countyHomeAddress');
  }

  String _versionNumber = '';
  String get versionNumber => _versionNumber;
  set versionNumber(String value) {
    _versionNumber = value;
  }

  List<String> _searchState = [];
  List<String> get searchState => _searchState;
  set searchState(List<String> value) {
    _searchState = value;
  }

  void addToSearchState(String value) {
    searchState.add(value);
  }

  void removeFromSearchState(String value) {
    searchState.remove(value);
  }

  void removeAtIndexFromSearchState(int index) {
    searchState.removeAt(index);
  }

  void updateSearchStateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchState[index] = updateFn(_searchState[index]);
  }

  void insertAtIndexInSearchState(int index, String value) {
    searchState.insert(index, value);
  }

  /// Picked Date with format YYYY-MM-DD to be passed to appointmentDate page
  /// parameter
  String _pickedDate = '';
  String get pickedDate => _pickedDate;
  set pickedDate(String value) {
    _pickedDate = value;
  }

  /// Picked date which set with DD MMMM YY format, for triggering
  /// bookAppointment function
  String _pickedDateFunc = '';
  String get pickedDateFunc => _pickedDateFunc;
  set pickedDateFunc(String value) {
    _pickedDateFunc = value;
  }

  String _uuidOnlineClassSchedule = '';
  String get uuidOnlineClassSchedule => _uuidOnlineClassSchedule;
  set uuidOnlineClassSchedule(String value) {
    _uuidOnlineClassSchedule = value;
  }

  String _onlineAppointmentTime = '';
  String get onlineAppointmentTime => _onlineAppointmentTime;
  set onlineAppointmentTime(String value) {
    _onlineAppointmentTime = value;
  }

  int _contractionCount = 0;
  int get contractionCount => _contractionCount;
  set contractionCount(int value) {
    _contractionCount = value;
  }

  String _averageDuration = '';
  String get averageDuration => _averageDuration;
  set averageDuration(String value) {
    _averageDuration = value;
  }

  String _averageInterval = '';
  String get averageInterval => _averageInterval;
  set averageInterval(String value) {
    _averageInterval = value;
  }

  List<String> _listDuration = [];
  List<String> get listDuration => _listDuration;
  set listDuration(List<String> value) {
    _listDuration = value;
  }

  void addToListDuration(String value) {
    listDuration.add(value);
  }

  void removeFromListDuration(String value) {
    listDuration.remove(value);
  }

  void removeAtIndexFromListDuration(int index) {
    listDuration.removeAt(index);
  }

  void updateListDurationAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listDuration[index] = updateFn(_listDuration[index]);
  }

  void insertAtIndexInListDuration(int index, String value) {
    listDuration.insert(index, value);
  }

  List<String> _listEnd = [];
  List<String> get listEnd => _listEnd;
  set listEnd(List<String> value) {
    _listEnd = value;
  }

  void addToListEnd(String value) {
    listEnd.add(value);
  }

  void removeFromListEnd(String value) {
    listEnd.remove(value);
  }

  void removeAtIndexFromListEnd(int index) {
    listEnd.removeAt(index);
  }

  void updateListEndAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listEnd[index] = updateFn(_listEnd[index]);
  }

  void insertAtIndexInListEnd(int index, String value) {
    listEnd.insert(index, value);
  }

  List<String> _listStart = [];
  List<String> get listStart => _listStart;
  set listStart(List<String> value) {
    _listStart = value;
  }

  void addToListStart(String value) {
    listStart.add(value);
  }

  void removeFromListStart(String value) {
    listStart.remove(value);
  }

  void removeAtIndexFromListStart(int index) {
    listStart.removeAt(index);
  }

  void updateListStartAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listStart[index] = updateFn(_listStart[index]);
  }

  void insertAtIndexInListStart(int index, String value) {
    listStart.insert(index, value);
  }

  int _contractionCounter = 0;
  int get contractionCounter => _contractionCounter;
  set contractionCounter(int value) {
    _contractionCounter = value;
  }

  String _isStarted = '';
  String get isStarted => _isStarted;
  set isStarted(String value) {
    _isStarted = value;
  }

  int _idSubschedule = 0;
  int get idSubschedule => _idSubschedule;
  set idSubschedule(int value) {
    _idSubschedule = value;
  }

  String _language = 'English (US)';
  String get language => _language;
  set language(String value) {
    _language = value;
    secureStorage.setString('ff_language', value);
  }

  void deleteLanguage({bool resetState = false}) {
    if (resetState) {
      _language = 'English (US)';
    }
    secureStorage.delete(key: 'ff_language');
  }

  List<dynamic> _contractionPerHour = [];
  List<dynamic> get contractionPerHour => _contractionPerHour;
  set contractionPerHour(List<dynamic> value) {
    _contractionPerHour = value;
  }

  void addToContractionPerHour(dynamic value) {
    contractionPerHour.add(value);
  }

  void removeFromContractionPerHour(dynamic value) {
    contractionPerHour.remove(value);
  }

  void removeAtIndexFromContractionPerHour(int index) {
    contractionPerHour.removeAt(index);
  }

  void updateContractionPerHourAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    contractionPerHour[index] = updateFn(_contractionPerHour[index]);
  }

  void insertAtIndexInContractionPerHour(int index, dynamic value) {
    contractionPerHour.insert(index, value);
  }

  List<dynamic> _currentHour = [];
  List<dynamic> get currentHour => _currentHour;
  set currentHour(List<dynamic> value) {
    _currentHour = value;
  }

  void addToCurrentHour(dynamic value) {
    currentHour.add(value);
  }

  void removeFromCurrentHour(dynamic value) {
    currentHour.remove(value);
  }

  void removeAtIndexFromCurrentHour(int index) {
    currentHour.removeAt(index);
  }

  void updateCurrentHourAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    currentHour[index] = updateFn(_currentHour[index]);
  }

  void insertAtIndexInCurrentHour(int index, dynamic value) {
    currentHour.insert(index, value);
  }

  String _bbResult = '';
  String get bbResult => _bbResult;
  set bbResult(String value) {
    _bbResult = value;
  }

  double _bbJanin = 0.0;
  double get bbJanin => _bbJanin;
  set bbJanin(double value) {
    _bbJanin = value;
  }

  double _tbJanin = 0.0;
  double get tbJanin => _tbJanin;
  set tbJanin(double value) {
    _tbJanin = value;
  }

  double _bbBumilRata = 0.0;
  double get bbBumilRata => _bbBumilRata;
  set bbBumilRata(double value) {
    _bbBumilRata = value;
  }

  double _bbIdeal = 0.0;
  double get bbIdeal => _bbIdeal;
  set bbIdeal(double value) {
    _bbIdeal = value;
  }

  String _Theme = 'Light Theme';
  String get Theme => _Theme;
  set Theme(String value) {
    _Theme = value;
    secureStorage.setString('ff_Theme', value);
  }

  void deleteTheme({bool resetState = false}) {
    if (resetState) {
      _Theme = 'Light Theme';
    }
    secureStorage.delete(key: 'ff_Theme');
  }

  String _rangeBBIdeal = '';
  String get rangeBBIdeal => _rangeBBIdeal;
  set rangeBBIdeal(String value) {
    _rangeBBIdeal = value;
  }

  String _averageBB = '';
  String get averageBB => _averageBB;
  set averageBB(String value) {
    _averageBB = value;
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String value) {
    _deviceId = value;
    secureStorage.setString('ff_deviceId', value);
  }

  void deleteDeviceId({bool resetState = false}) {
    if (resetState) {
      _deviceId = '';
    }
    secureStorage.delete(key: 'ff_deviceId');
  }

  String _deviceToken = '';
  String get deviceToken => _deviceToken;
  set deviceToken(String value) {
    _deviceToken = value;
    secureStorage.setString('ff_deviceToken', value);
  }

  void deleteDeviceToken({bool resetState = false}) {
    if (resetState) {
      _deviceToken = '';
    }
    secureStorage.delete(key: 'ff_deviceToken');
  }

  String _deviceInfo = '';
  String get deviceInfo => _deviceInfo;
  set deviceInfo(String value) {
    _deviceInfo = value;
    secureStorage.setString('ff_deviceInfo', value);
  }

  void deleteDeviceInfo({bool resetState = false}) {
    if (resetState) {
      _deviceInfo = '';
    }
    secureStorage.delete(key: 'ff_deviceInfo');
  }

  String _canonicalIdentifier = '';
  String get canonicalIdentifier => _canonicalIdentifier;
  set canonicalIdentifier(String value) {
    _canonicalIdentifier = value;
    secureStorage.setString('ff_canonicalIdentifier', value);
  }

  void deleteCanonicalIdentifier({bool resetState = false}) {
    if (resetState) {
      _canonicalIdentifier = '';
    }
    secureStorage.delete(key: 'ff_canonicalIdentifier');
  }

  bool _targetingPage = false;
  bool get targetingPage => _targetingPage;
  set targetingPage(bool value) {
    _targetingPage = value;
  }

  String _referringLink = '';
  String get referringLink => _referringLink;
  set referringLink(String value) {
    _referringLink = value;
    secureStorage.setString('ff_referringLink', value);
  }

  void deleteReferringLink({bool resetState = false}) {
    if (resetState) {
      _referringLink = '';
    }
    secureStorage.delete(key: 'ff_referringLink');
  }

  String _lastPathSegment = '';
  String get lastPathSegment => _lastPathSegment;
  set lastPathSegment(String value) {
    _lastPathSegment = value;
    secureStorage.setString('ff_lastPathSegment', value);
  }

  void deleteLastPathSegment({bool resetState = false}) {
    if (resetState) {
      _lastPathSegment = '';
    }
    secureStorage.delete(key: 'ff_lastPathSegment');
  }

  bool _fingerprintLogin = false;
  bool get fingerprintLogin => _fingerprintLogin;
  set fingerprintLogin(bool value) {
    _fingerprintLogin = value;
    secureStorage.setBool('ff_fingerprintLogin', value);
  }

  void deleteFingerprintLogin({bool resetState = false}) {
    if (resetState) {
      _fingerprintLogin = false;
    }
    secureStorage.delete(key: 'ff_fingerprintLogin');
  }

  int _ownedContractionPro = 0;
  int get ownedContractionPro => _ownedContractionPro;
  set ownedContractionPro(int value) {
    _ownedContractionPro = value;
  }

  int _elapsedTime = 0;
  int get elapsedTime => _elapsedTime;
  set elapsedTime(int value) {
    _elapsedTime = value;
  }

  bool _emailNotif = false;
  bool get emailNotif => _emailNotif;
  set emailNotif(bool value) {
    _emailNotif = value;
    secureStorage.setBool('ff_emailNotif', value);
  }

  void deleteEmailNotif({bool resetState = false}) {
    if (resetState) {
      _emailNotif = false;
    }
    secureStorage.delete(key: 'ff_emailNotif');
  }

  /// OneSignal Subscription Id
  String _subscriptionId = '';
  String get subscriptionId => _subscriptionId;
  set subscriptionId(String value) {
    _subscriptionId = value;
    secureStorage.setString('ff_subscriptionId', value);
  }

  void deleteSubscriptionId({bool resetState = false}) {
    if (resetState) {
      _subscriptionId = '';
    }
    secureStorage.delete(key: 'ff_subscriptionId');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async {
    final value = await read(key: key);
    return value == null ? null : value == 'true';
  }

  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        // Lists are stored as JSON. Older versions stored CSV, which never
        // starts with `["` because CSV quotes any field containing a quote.
        if (result == '[]' || result.startsWith('["')) {
          return (jsonDecode(result) as List).map((e) => e.toString()).toList();
        }
        return const CsvToListConverter(shouldParseNumbers: false)
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: jsonEncode(value));
}
