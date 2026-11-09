import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Auth Group Code

class AuthGroup {
  static String getBaseUrl() => 'https://sbcareapi.sleepydev.net/auth';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
  static LogoutCall logoutCall = LogoutCall();
  static RefreshTokenCall refreshTokenCall = RefreshTokenCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": ${email == null ? 'null' : '"${escapeStringForJson(email)}"'},
  "password": ${password == null ? 'null' : '"${escapeStringForJson(password)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}/sign_in',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_user''',
      ));
  String? uidProvider(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_provider''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..access_token''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..refresh_token''',
      ));
  String? defaultProvider(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..default_provider''',
      ));
  String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..fullname''',
      ));
  bool? isProvider(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$..is_provider''',
      ));
  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..email''',
      ));
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: '${baseUrl}/sign_out',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RefreshTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "refresh_token": ${refreshToken == null ? 'null' : '"${escapeStringForJson(refreshToken)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Refresh Token',
      apiUrl: '${baseUrl}/refresh_token',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..access_token''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..refresh_token''',
      ));
}

/// End Auth Group Code

/// Start User Group Code

class UserGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://sbcareapi.sleepydev.net/user';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static GetUserProfileCall getUserProfileCall = GetUserProfileCall();
  static UpdateUserProfileCall updateUserProfileCall = UpdateUserProfileCall();
  static GetUserWalletCall getUserWalletCall = GetUserWalletCall();
  static GetUserBankCall getUserBankCall = GetUserBankCall();
  static GetHomeAddressCall getHomeAddressCall = GetHomeAddressCall();
  static UpdateHomeAddressCall updateHomeAddressCall = UpdateHomeAddressCall();
  static RedeemSBPayVoucherCall redeemSBPayVoucherCall =
      RedeemSBPayVoucherCall();
  static RegisterUserDeviceCall registerUserDeviceCall =
      RegisterUserDeviceCall();
}

class GetUserProfileCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get User Profile',
      apiUrl: '${baseUrl}/profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? avatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..avatar''',
      ));
  String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..username''',
      ));
  String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..fullname''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..email''',
      ));
  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..phone_number''',
      ));
  String? walletNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..user_wallet_number''',
      ));
  String? dob(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..datebirth_user''',
      ));
  bool? isProvider(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$..is_provider''',
      ));
  String? defaultProvider(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..default_provider''',
      ));
}

class UpdateUserProfileCall {
  Future<ApiCallResponse> call({
    String? fullName = '',
    String? phoneNumber = '',
    String? birthDate = '',
    String? token = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "user": {
    "full_name": ${fullName == null ? 'null' : '"${escapeStringForJson(fullName)}"'},
    "phone_number": ${phoneNumber == null ? 'null' : '"${escapeStringForJson(phoneNumber)}"'},
    "birth_date": ${birthDate == null ? 'null' : '"${escapeStringForJson(birthDate)}"'}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Profile',
      apiUrl: '${baseUrl}/profile',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetUserWalletCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get User Wallet',
      apiUrl: '${baseUrl}/wallet',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? walletNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..number_wallet''',
      ));
  String? billingName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..billing_name''',
      ));
  String? customerName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..customer_name''',
      ));
  int? walletBalance(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..balance_wallet''',
      ));
  String? invoiceEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..invoice_email''',
      ));
}

class GetUserBankCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get User Bank',
      apiUrl: '${baseUrl}/profile/bank',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidUserBank(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_user_bank''',
      ));
  String? uidBank(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_bank''',
      ));
  String? uidUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_user''',
      ));
  String? bankName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..bank_name''',
      ));
  String? bankOwner(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..bank_owner''',
      ));
  String? bankNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..bank_number''',
      ));
}

class GetHomeAddressCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Home Address',
      apiUrl: '${baseUrl}/profile/address',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidUserAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_user_address''',
      ));
  String? streetAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..street_address''',
      ));
  String? subdistrictAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..subdistrict_address''',
      ));
  String? districtAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..district_address''',
      ));
  String? cityAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..city_address''',
      ));
  String? zipCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..zip_postals_code''',
      ));
  String? countryState(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..country_state''',
      ));
}

class UpdateHomeAddressCall {
  Future<ApiCallResponse> call({
    String? uuidUserAddress = '',
    String? streetAddress = '',
    String? subdistrictAddress = '',
    String? districtAddress = '',
    String? cityAddress = '',
    String? countryState = '',
    String? zipPostalsCode = '',
    String? token = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "street_address": ${streetAddress == null ? 'null' : '"${escapeStringForJson(streetAddress)}"'},
  "subdistrict_address": ${subdistrictAddress == null ? 'null' : '"${escapeStringForJson(subdistrictAddress)}"'},
  "district_address": ${districtAddress == null ? 'null' : '"${escapeStringForJson(districtAddress)}"'},
  "city_address": ${cityAddress == null ? 'null' : '"${escapeStringForJson(cityAddress)}"'},
  "country_state": ${countryState == null ? 'null' : '"${escapeStringForJson(countryState)}"'},
  "zip_postals_code": ${zipPostalsCode == null ? 'null' : '"${escapeStringForJson(zipPostalsCode)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Home Address',
      apiUrl: '${baseUrl}/address/${uuidUserAddress}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class RedeemSBPayVoucherCall {
  Future<ApiCallResponse> call({
    String? code = '',
    String? token = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "code": ${code == null ? 'null' : '"${escapeStringForJson(code)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Redeem SBPay Voucher',
      apiUrl: '${baseUrl}/redemptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class RegisterUserDeviceCall {
  Future<ApiCallResponse> call({
    String? deviceId = '',
    String? deviceToken = '',
    String? platform = '',
    String? deviceInfo = '',
    String? token = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "device": {
    "device_id": ${deviceId == null ? 'null' : '"${escapeStringForJson(deviceId)}"'},
    "device_token": ${deviceToken == null ? 'null' : '"${escapeStringForJson(deviceToken)}"'},
    "platform": ${platform == null ? 'null' : '"${escapeStringForJson(platform)}"'},
    "device_info": ${deviceInfo == null ? 'null' : '"${escapeStringForJson(deviceInfo)}"'}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register User Device',
      apiUrl: '${baseUrl}/user_devices/register',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End User Group Code

/// Start Appointment Group Code

class AppointmentGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://sbcareapi.sleepydev.net/user';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static GetListAppointmentCall getListAppointmentCall =
      GetListAppointmentCall();
  static GetAppointmentDetailsCall getAppointmentDetailsCall =
      GetAppointmentDetailsCall();
  static CreateAppointmentCall createAppointmentCall = CreateAppointmentCall();
}

class GetListAppointmentCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AppointmentGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get List Appointment',
      apiUrl: '${baseUrl}/appointment',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidAppointment(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_appointment''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentTitle(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentDays(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_days''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentDate(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentStart(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_started''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentEnd(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? appointmentPrice(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentVerify(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_verified''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentStatus(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatarMitra(dynamic response) => (getJsonField(
        response,
        r'''$..provider.avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fullnameMitra(dynamic response) => (getJsonField(
        response,
        r'''$..provider.fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? emailMitra(dynamic response) => (getJsonField(
        response,
        r'''$..provider.email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? phoneMitra(dynamic response) => (getJsonField(
        response,
        r'''$..provider.phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? unverifiedList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'pending')]''',
        true,
      ) as List?;
  List? onProgressList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'onprogress')]''',
        true,
      ) as List?;
  List? doneList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'purchased' || @.appointment_status == 'finished')]''',
        true,
      ) as List?;
  List? expiredList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'expired')]''',
        true,
      ) as List?;
  List? appointmentList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAppointmentDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidAppointment = '',
    String? token = '',
  }) async {
    final baseUrl = AppointmentGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Appointment Details',
      apiUrl: '${baseUrl}/appointment/${uuidAppointment}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidAppointment(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_appointment''',
      ));
  String? appointmentTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_title''',
      ));
  String? appointmentDays(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_days''',
      ));
  String? appointmentDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_date''',
      ));
  String? appointmentStart(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_started''',
      ));
  String? appointmentEnd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_end''',
      ));
  int? appointmentPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..appointment_price''',
      ));
  String? appointmentVerify(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..appointment_verified''',
      ));
  String? appointmentStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..appointment_status''',
      ));
  String? appointmentCreated(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..appointment_created''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_appointment_price''',
      ));
  String? appointmentCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_code''',
      ));
  String? avatarMitra(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..provider.avatar''',
      ));
  String? fullnameMitra(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..provider.fullname''',
      ));
  String? emailMitra(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..provider.email''',
      ));
  String? phoneMitra(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..provider.phone_number''',
      ));
  String? submodulTitles(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..submodul_titles''',
      ));
}

class CreateAppointmentCall {
  Future<ApiCallResponse> call({
    String? appointmentDate = '',
    int? idSubschedule,
    String? token = '',
  }) async {
    final baseUrl = AppointmentGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "appointment_date": ${appointmentDate == null ? 'null' : '"${escapeStringForJson(appointmentDate)}"'},
  "id_subschedule": ${idSubschedule}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Appointment',
      apiUrl: '${baseUrl}/appointment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

/// End Appointment Group Code

/// Start Appointment Mitra Group Code

class AppointmentMitraGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://sbcareapi.sleepydev.net/provider';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static GetListAppointmentMitraCall getListAppointmentMitraCall =
      GetListAppointmentMitraCall();
  static GetAppointmentDetailsMitraCall getAppointmentDetailsMitraCall =
      GetAppointmentDetailsMitraCall();
  static VerifyAppointmentCall verifyAppointmentCall = VerifyAppointmentCall();
  static AcceptAppointmentCall acceptAppointmentCall = AcceptAppointmentCall();
  static EndAppointmentCall endAppointmentCall = EndAppointmentCall();
  static SendModuleAppointmentCall sendModuleAppointmentCall =
      SendModuleAppointmentCall();
}

class GetListAppointmentMitraCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AppointmentMitraGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get List Appointment Mitra',
      apiUrl: '${baseUrl}/appointment',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidAppointment(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_appointment''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatarClient(dynamic response) => (getJsonField(
        response,
        r'''$..avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fullnameClient(dynamic response) => (getJsonField(
        response,
        r'''$..fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentTitle(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentDays(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_days''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentDate(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentStart(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_started''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentEnd(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentVerify(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_verified''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentStatus(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? appointmentPrice(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_appointment_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? pendingList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_verified == 'unverified' && @.appointment_status == 'pending')]''',
        true,
      ) as List?;
  List? onProgressList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'onprogress')]''',
        true,
      ) as List?;
  List? verifyList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_verified == 'verified' && @.appointment_status == 'pending')]''',
        true,
      ) as List?;
  List? doneList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'purchased' || @.appointment_status == 'finished')]''',
        true,
      ) as List?;
  List? expiredList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'expired')]''',
        true,
      ) as List?;
  List? appointmentList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAppointmentDetailsMitraCall {
  Future<ApiCallResponse> call({
    String? uuidAppointment = '',
    String? token = '',
  }) async {
    final baseUrl = AppointmentMitraGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Appointment Details Mitra',
      apiUrl: '${baseUrl}/appointment/${uuidAppointment}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidAppointment(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_appointment''',
      ));
  String? uidUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_user''',
      ));
  String? avatarClient(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..avatar''',
      ));
  String? fullnameClient(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..fullname''',
      ));
  String? phoneClient(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..phone_number''',
      ));
  String? emailClient(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..email''',
      ));
  String? appointmentTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_title''',
      ));
  String? appointmentDays(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_days''',
      ));
  String? appointmentDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_date''',
      ));
  String? appointmentStart(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_started''',
      ));
  String? appointmentEnd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_end''',
      ));
  int? appointmentPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..appointment_price''',
      ));
  String? appointmentVerify(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..appointment_verified''',
      ));
  String? appointmentStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..appointment_status''',
      ));
  List<String>? uidModule(dynamic response) => (getJsonField(
        response,
        r'''$..modules..uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleTitle(dynamic response) => (getJsonField(
        response,
        r'''$..modules..modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? allModules(dynamic response) => getJsonField(
        response,
        r'''$..modules''',
        true,
      ) as List?;
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_appointment_price''',
      ));
  bool? isModuleSent(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$..appointment_modul''',
      ));
  String? uidProgramClass(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_program_class''',
      ));
  List<String>? moduleDescription(dynamic response) => (getJsonField(
        response,
        r'''$..modules..modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? feeProgramClass(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..fee_service_program_class''',
      ));
  String? formattedFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_fee_service_program_class''',
      ));
  String? submoduleTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..submodul_titles''',
      ));
}

class VerifyAppointmentCall {
  Future<ApiCallResponse> call({
    String? uuidAppointment = '',
    String? verificationCode = '',
    String? token = '',
  }) async {
    final baseUrl = AppointmentMitraGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "verification_code": ${verificationCode == null ? 'null' : '"${escapeStringForJson(verificationCode)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify Appointment',
      apiUrl: '${baseUrl}/appointment/${uuidAppointment}/verify',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class AcceptAppointmentCall {
  Future<ApiCallResponse> call({
    String? uuidAppointment = '',
    String? token = '',
  }) async {
    final baseUrl = AppointmentMitraGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Accept Appointment',
      apiUrl: '${baseUrl}/appointment/${uuidAppointment}/accept',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class EndAppointmentCall {
  Future<ApiCallResponse> call({
    String? uuidAppointment = '',
    String? token = '',
  }) async {
    final baseUrl = AppointmentMitraGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'End Appointment',
      apiUrl: '${baseUrl}/appointment/${uuidAppointment}/close',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SendModuleAppointmentCall {
  Future<ApiCallResponse> call({
    String? uuidModul = '',
    String? uuidUser = '',
    String? uuidAppointment = '',
    String? token = '',
  }) async {
    final baseUrl = AppointmentMitraGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "uuid_modul": ${uuidModul == null ? 'null' : '"${escapeStringForJson(uuidModul)}"'},
  "uuid_user": ${uuidUser == null ? 'null' : '"${escapeStringForJson(uuidUser)}"'},
  "uuid_appointment": ${uuidAppointment == null ? 'null' : '"${escapeStringForJson(uuidAppointment)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Module Appointment',
      apiUrl: '${baseUrl}/modul/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

/// End Appointment Mitra Group Code

/// Start Online Class Group Code

class OnlineClassGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://sbcareapi.sleepydev.net/user';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static GetListOnlineClassProgramsCall getListOnlineClassProgramsCall =
      GetListOnlineClassProgramsCall();
  static CreateOnlineClassCall createOnlineClassCall = CreateOnlineClassCall();
  static GetListOnlineClassAppointmentCall getListOnlineClassAppointmentCall =
      GetListOnlineClassAppointmentCall();
  static GetDetailsOnlineClassAppointmentCall
      getDetailsOnlineClassAppointmentCall =
      GetDetailsOnlineClassAppointmentCall();
  static GetAvailableOnlineSchedulesCall getAvailableOnlineSchedulesCall =
      GetAvailableOnlineSchedulesCall();
  static GetDetailProgramClassOnlineCall getDetailProgramClassOnlineCall =
      GetDetailProgramClassOnlineCall();
}

class GetListOnlineClassProgramsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = OnlineClassGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get List Online Class Programs',
      apiUrl: '${baseUrl}/program-class?type=online',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageOnlineClass(dynamic response) => (getJsonField(
        response,
        r'''$..image_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nameOnlineClass(dynamic response) => (getJsonField(
        response,
        r'''$..name_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? infoOnlineClass(dynamic response) => (getJsonField(
        response,
        r'''$..info_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_online_class_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CreateOnlineClassCall {
  Future<ApiCallResponse> call({
    String? programClassId = '',
    String? uuidProgramClass = '',
    String? uuidOnlineClassSchedule = '',
    String? appointmentDate = '',
    String? appointmentTime = '',
    String? token = '',
  }) async {
    final baseUrl = OnlineClassGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "uuid_program_class": ${uuidProgramClass == null ? 'null' : '"${escapeStringForJson(uuidProgramClass)}"'},
  "uuid_online_class_schedule": ${uuidOnlineClassSchedule == null ? 'null' : '"${escapeStringForJson(uuidOnlineClassSchedule)}"'},
  "appointment_date": ${appointmentDate == null ? 'null' : '"${escapeStringForJson(appointmentDate)}"'},
  "appointment_time": ${appointmentTime == null ? 'null' : '"${escapeStringForJson(appointmentTime)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Online Class',
      apiUrl: '${baseUrl}/program-class/online/${programClassId}/booking',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetListOnlineClassAppointmentCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = OnlineClassGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get List Online Class Appointment',
      apiUrl: '${baseUrl}/online-appointment',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidOnlineAppointment(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_online_appointment''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..image_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? infoProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..info_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentTitle(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentDay(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_days''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentStatus(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? appointmentDate(dynamic response) => (getJsonField(
        response,
        r'''$..appointment_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? unverifiedList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'unverified')]''',
        true,
      ) as List?;
  List? verifiedList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'verified')]''',
        true,
      ) as List?;
  List? onProgressList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'onprogress')]''',
        true,
      ) as List?;
  List? doneList(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.appointment_status == 'done')]''',
        true,
      ) as List?;
  List? allList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? fullname(dynamic response) => (getJsonField(
        response,
        r'''$..user_fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetDetailsOnlineClassAppointmentCall {
  Future<ApiCallResponse> call({
    String? uuidOnlineAppointment = '',
    String? token = '',
  }) async {
    final baseUrl = OnlineClassGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Details Online Class Appointment',
      apiUrl: '${baseUrl}/online-appointment/${uuidOnlineAppointment}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidOnlineAppointment(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..uuid_online_appointment''',
      ));
  String? imageProgramClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..image_program_class''',
      ));
  String? infoProgramClass(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..info_program_class''',
      ));
  String? appointmentTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_title''',
      ));
  String? appointmentDay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_days''',
      ));
  String? appointmentDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_date''',
      ));
  int? appointmentPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..appointment_price''',
      ));
  int? appointmentFee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..appointment_fee''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_appointment_price''',
      ));
  String? formattedFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_appointment_fee''',
      ));
  String? appointmentLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_link''',
      ));
  String? appointmentStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..appointment_status''',
      ));
  dynamic appointmentNotes(dynamic response) => getJsonField(
        response,
        r'''$..appointment_notes''',
      );
  String? appointmentTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..appointment_time''',
      ));
  String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..user_fullname''',
      ));
  String? phoneUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..user_phone''',
      ));
}

class GetAvailableOnlineSchedulesCall {
  Future<ApiCallResponse> call({
    String? programClassId = '',
    String? token = '',
  }) async {
    final baseUrl = OnlineClassGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Available Online Schedules',
      apiUrl:
          '${baseUrl}/program-class/online/${programClassId}/available-schedules',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? sunday(dynamic response) => (getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Sunday')].list_schedule..time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? monday(dynamic response) => (getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Monday')].list_schedule..time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? tuesday(dynamic response) => (getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Tuesday')].list_schedule..time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? wednesday(dynamic response) => (getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Wednesday')].list_schedule..time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? thursday(dynamic response) => (getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Thursday')].list_schedule..time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? friday(dynamic response) => (getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Friday')].list_schedule..time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? saturday(dynamic response) => (getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Saturday')].list_schedule..time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidOnlineClassSchedules(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_online_class_schedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? uidSunday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Sunday')].uuid_online_class_schedule''',
      ));
  String? uidMonday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Monday')].uuid_online_class_schedule''',
      ));
  String? uidTuesday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Tuesday')].uuid_online_class_schedule''',
      ));
  String? uidWednesday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Wednesday')].uuid_online_class_schedule''',
      ));
  String? uidThursday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Thursday')].uuid_online_class_schedule''',
      ));
  String? uidFriday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Friday')].uuid_online_class_schedule''',
      ));
  String? uidSaturday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..[?(@.schedule_days == 'Saturday')].uuid_online_class_schedule''',
      ));
}

class GetDetailProgramClassOnlineCall {
  Future<ApiCallResponse> call({
    String? programClassId = '',
    String? token = '',
  }) async {
    final baseUrl = OnlineClassGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Detail Program Class Online',
      apiUrl: '${baseUrl}/program-class/online/${programClassId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidProgramClass(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_program_class''',
      ));
  String? imageProgramClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..image_program_class''',
      ));
  String? nameProgramClass(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..name_program_class''',
      ));
  String? infoProgramClass(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..info_program_class''',
      ));
  String? uidOnlineClass(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_online_class''',
      ));
  int? priceOnlineClass(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..online_class_price''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_online_class_price''',
      ));
  int? feeOnlineClass(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..online_class_fee''',
      ));
  String? formattedFee(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_online_class_fee''',
      ));
  int? limitOnlineClass(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..online_class_limit''',
      ));
  String? statusOnlineClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..online_class_status''',
      ));
}

/// End Online Class Group Code

/// Start SBPay Group Code

class SBPayGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://sbcareapi.sleepydev.net/wallet';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static TopupSBPayCall topupSBPayCall = TopupSBPayCall();
  static GetTopupHistoryCall getTopupHistoryCall = GetTopupHistoryCall();
  static GetTopupDetailsCall getTopupDetailsCall = GetTopupDetailsCall();
  static GetRecentTopupDetailsCall getRecentTopupDetailsCall =
      GetRecentTopupDetailsCall();
  static TransferSBPayCall transferSBPayCall = TransferSBPayCall();
  static GetTransferHistoryCall getTransferHistoryCall =
      GetTransferHistoryCall();
  static GetTransferRecipientNameCall getTransferRecipientNameCall =
      GetTransferRecipientNameCall();
  static WithdrawSBPayCall withdrawSBPayCall = WithdrawSBPayCall();
  static GetWithdrawHistoryCall getWithdrawHistoryCall =
      GetWithdrawHistoryCall();
}

class TopupSBPayCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? bank = '',
    String? token = '',
  }) async {
    final baseUrl = SBPayGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "amount": ${amount},
  "bank": ${bank == null ? 'null' : '"${escapeStringForJson(bank)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Topup SBPay',
      apiUrl: '${baseUrl}/topup',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetTopupHistoryCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = SBPayGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Topup History',
      apiUrl: '${baseUrl}/topup/history',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidTopup(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_topup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? invoice(dynamic response) => (getJsonField(
        response,
        r'''$..invoice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? amountTopup(dynamic response) => (getJsonField(
        response,
        r'''$..amount_topup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? formattedAmount(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_amount_topup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? feeTopup(dynamic response) => (getJsonField(
        response,
        r'''$..fee_merchant''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? formattedFee(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_fee_merchant''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? paidBy(dynamic response) => (getJsonField(
        response,
        r'''$..payment_by''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$..created_topup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? note(dynamic response) => (getJsonField(
        response,
        r'''$..note''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$..status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? allTopup(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetTopupDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidTopup = '',
    String? token = '',
  }) async {
    final baseUrl = SBPayGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Topup Details',
      apiUrl: '${baseUrl}/topup/${uuidTopup}/invoice',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? refNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..reference''',
      ));
  String? bankName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..payment_name''',
      ));
  String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..customer_name''',
      ));
  int? topupAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..amount''',
      ));
  int? feeCustomer(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..fee_customer''',
      ));
  int? amountNetto(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..amount_received''',
      ));
  String? checkoutUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..checkout_url''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..status''',
      ));
  String? expiredTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..expired_time''',
      ));
  String? invoice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..order_items..sku''',
      ));
  String? topupName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..order_items..name''',
      ));
  dynamic vaNumber(dynamic response) => getJsonField(
        response,
        r'''$..pay_code''',
      );
  List? instructions(dynamic response) => getJsonField(
        response,
        r'''$..instructions''',
        true,
      ) as List?;
}

class GetRecentTopupDetailsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = SBPayGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Recent Topup Details',
      apiUrl: '${baseUrl}/topup/recent',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidTopup(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_topup''',
      ));
}

class TransferSBPayCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? accountNumber = '',
    String? token = '',
  }) async {
    final baseUrl = SBPayGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "amount": ${amount},
  "account_number": ${accountNumber == null ? 'null' : '"${escapeStringForJson(accountNumber)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Transfer SBPay',
      apiUrl: '${baseUrl}/transfer',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetTransferHistoryCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = SBPayGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Transfer History',
      apiUrl: '${baseUrl}/transfer/history',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidTransfer(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_transfer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? numberWallet(dynamic response) => (getJsonField(
        response,
        r'''$..number_wallet''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? transferAmount(dynamic response) => (getJsonField(
        response,
        r'''$..transfer_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? billingName(dynamic response) => (getJsonField(
        response,
        r'''$..billing_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$..transfer_created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$..transfer_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? formattedAmount(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_transfer_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? allTransfer(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetTransferRecipientNameCall {
  Future<ApiCallResponse> call({
    String? numberWallet = '',
    String? token = '',
  }) async {
    final baseUrl = SBPayGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Transfer Recipient Name',
      apiUrl: '${baseUrl}/transfer/recipient/${numberWallet}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? fullnameRecipient(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..fullname_recipient''',
      ));
  String? emailRecipient(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..email_recipient''',
      ));
}

class WithdrawSBPayCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? token = '',
  }) async {
    final baseUrl = SBPayGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "amount": ${amount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Withdraw SBPay',
      apiUrl: '${baseUrl}/withdrawal',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetWithdrawHistoryCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = SBPayGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Withdraw History',
      apiUrl: '${baseUrl}/withdrawal/history',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidWithdraw(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_withdraw''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidBank(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_bank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bankName(dynamic response) => (getJsonField(
        response,
        r'''$..bank_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? withdrawAmount(dynamic response) => (getJsonField(
        response,
        r'''$..withdraw_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? withdrawInvoice(dynamic response) => (getJsonField(
        response,
        r'''$..withdraw_invoice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? withdrawStatus(dynamic response) => (getJsonField(
        response,
        r'''$..withdraw_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$..withdraw_created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? formattedAmount(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_withdraw_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? allWithdraw(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

/// End SBPay Group Code

/// Start Module Client Group Code

class ModuleClientGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://sbcareapi.sleepydev.net/user/modul';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static OrderModuleCall orderModuleCall = OrderModuleCall();
  static RenewModuleCall renewModuleCall = RenewModuleCall();
  static GetListOfShopModulesCall getListOfShopModulesCall =
      GetListOfShopModulesCall();
  static ModuleShopSearchCall moduleShopSearchCall = ModuleShopSearchCall();
  static GetShopModuleDetailsCall getShopModuleDetailsCall =
      GetShopModuleDetailsCall();
  static GetClientModuleDetailsCall getClientModuleDetailsCall =
      GetClientModuleDetailsCall();
  static RedeemModuleCall redeemModuleCall = RedeemModuleCall();
  static GetSBCareFlyersCall getSBCareFlyersCall = GetSBCareFlyersCall();
}

class OrderModuleCall {
  Future<ApiCallResponse> call({
    String? uuidModul = '',
    String? token = '',
  }) async {
    final baseUrl = ModuleClientGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Order Module',
      apiUrl: '${baseUrl}/${uuidModul}/order',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RenewModuleCall {
  Future<ApiCallResponse> call({
    String? uuidModul = '',
    String? uuidUserModul = '',
    String? token = '',
  }) async {
    final baseUrl = ModuleClientGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Renew Module',
      apiUrl: '${baseUrl}/${uuidModul}/extend/${uuidUserModul}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetListOfShopModulesCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = ModuleClientGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get List of Shop Modules',
      apiUrl: '${baseUrl}/shop',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidModule(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleImage(dynamic response) => (getJsonField(
        response,
        r'''$..modul_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleTitle(dynamic response) => (getJsonField(
        response,
        r'''$..modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? modulePrice(dynamic response) => (getJsonField(
        response,
        r'''$..modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleDesc(dynamic response) => (getJsonField(
        response,
        r'''$..modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? allModules(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ModuleShopSearchCall {
  Future<ApiCallResponse> call({
    String? keyword = '',
    String? token = '',
  }) async {
    final baseUrl = ModuleClientGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Module Shop Search',
      apiUrl: '${baseUrl}/shop',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidModule(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleImage(dynamic response) => (getJsonField(
        response,
        r'''$..modul_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleTitle(dynamic response) => (getJsonField(
        response,
        r'''$..modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? modulePrice(dynamic response) => (getJsonField(
        response,
        r'''$..modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleDesc(dynamic response) => (getJsonField(
        response,
        r'''$..modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? allModules(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetShopModuleDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidModul = '',
    String? token = '',
  }) async {
    final baseUrl = ModuleClientGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Shop Module Details',
      apiUrl: '${baseUrl}/shop/${uuidModul}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidModule(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_modul''',
      ));
  String? moduleImage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..modul_image''',
      ));
  String? moduleTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..modul_title''',
      ));
  int? modulePrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..modul_price''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_modul_price''',
      ));
  String? moduleDuration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..modul_duration''',
      ));
  List? allSubmodules(dynamic response) => getJsonField(
        response,
        r'''$..active_sub_modules''',
        true,
      ) as List?;
  String? submoduleTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..active_sub_modules..submodul_title''',
      ));
  dynamic allModule(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? moduleDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..modul_description''',
      ));
}

class GetClientModuleDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidUserModule = '',
    String? token = '',
  }) async {
    final baseUrl = ModuleClientGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Client Module Details',
      apiUrl: '${baseUrl}/detail/${uuidUserModule}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidModule(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? submoduleTitle(dynamic response) => (getJsonField(
        response,
        r'''$..submodul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? submoduleDesc(dynamic response) => (getJsonField(
        response,
        r'''$..submodul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? submoduleUrl(dynamic response) => (getJsonField(
        response,
        r'''$..submodul_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? submoduleType(dynamic response) => (getJsonField(
        response,
        r'''$..submodul_tipe''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? submoduleDuration(dynamic response) => (getJsonField(
        response,
        r'''$..submodul_duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? allSubmodules(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? modulTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..[0].modul_title''',
      ));
}

class RedeemModuleCall {
  Future<ApiCallResponse> call({
    String? uuidModul = '',
    String? code = '',
    String? token = '',
  }) async {
    final baseUrl = ModuleClientGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "code": ${code == null ? 'null' : '"${escapeStringForJson(code)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Redeem Module',
      apiUrl: '${baseUrl}/${uuidModul}/redeem_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSBCareFlyersCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = ModuleClientGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get SBCare Flyers',
      apiUrl: '${baseUrl}/flyer',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? flyerTitle(dynamic response) => (getJsonField(
        response,
        r'''$..submodul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? flyerUrl(dynamic response) => (getJsonField(
        response,
        r'''$..submodul_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Module Client Group Code

/// Start Ebook Group Code

class EbookGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://sbcareapi.sleepydev.net/user/ebook';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static GetEbookShopListCall getEbookShopListCall = GetEbookShopListCall();
  static EbookShopSearchCall ebookShopSearchCall = EbookShopSearchCall();
  static GetEbookShopDetailsCall getEbookShopDetailsCall =
      GetEbookShopDetailsCall();
  static OrderEbookCall orderEbookCall = OrderEbookCall();
  static GetOwnedEbookDetailsCall getOwnedEbookDetailsCall =
      GetOwnedEbookDetailsCall();
  static RenewEbookCall renewEbookCall = RenewEbookCall();
  static RedeemEbookCall redeemEbookCall = RedeemEbookCall();
}

class GetEbookShopListCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EbookGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Ebook Shop List',
      apiUrl: '${baseUrl}/shop',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? cover(dynamic response) => (getJsonField(
        response,
        r'''$..cover''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$..title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$..description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? duration(dynamic response) => (getJsonField(
        response,
        r'''$..duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? category(dynamic response) => (getJsonField(
        response,
        r'''$..category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidEbook(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_ebook''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class EbookShopSearchCall {
  Future<ApiCallResponse> call({
    String? keyword = '',
    String? token = '',
  }) async {
    final baseUrl = EbookGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Ebook Shop Search',
      apiUrl: '${baseUrl}/shop',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetEbookShopDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidEbook = '',
    String? token = '',
  }) async {
    final baseUrl = EbookGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Ebook Shop Details',
      apiUrl: '${baseUrl}/shop/${uuidEbook}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidEbook(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_ebook''',
      ));
  String? cover(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..cover''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..title''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..description''',
      ));
  List? allCatalogue(dynamic response) => getJsonField(
        response,
        r'''$..catalogues''',
        true,
      ) as List?;
  int? price(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..price''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_price''',
      ));
}

class OrderEbookCall {
  Future<ApiCallResponse> call({
    String? uuidEbook = '',
    String? token = '',
  }) async {
    final baseUrl = EbookGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Order Ebook',
      apiUrl: '${baseUrl}/${uuidEbook}/order',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOwnedEbookDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidEbook = '',
    String? token = '',
  }) async {
    final baseUrl = EbookGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Owned Ebook Details',
      apiUrl: '${baseUrl}/detail/${uuidEbook}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidEbookCatalogue(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_ebook_catalogue''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? catalogueTitle(dynamic response) => (getJsonField(
        response,
        r'''$..catalogue_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? catalogueDescription(dynamic response) => (getJsonField(
        response,
        r'''$..catalogue_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? sku(dynamic response) => (getJsonField(
        response,
        r'''$..sku''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? url(dynamic response) => (getJsonField(
        response,
        r'''$..url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RenewEbookCall {
  Future<ApiCallResponse> call({
    String? uuidEbook = '',
    String? uuidUserEbook = '',
    String? token = '',
  }) async {
    final baseUrl = EbookGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Renew Ebook',
      apiUrl: '${baseUrl}/${uuidEbook}/extend/${uuidUserEbook}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RedeemEbookCall {
  Future<ApiCallResponse> call({
    String? uuidEbook = '',
    String? code = '',
    String? token = '',
  }) async {
    final baseUrl = EbookGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "code": ${code == null ? 'null' : '"${escapeStringForJson(code)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Redeem Ebook',
      apiUrl: '${baseUrl}/${uuidEbook}/redeem_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Ebook Group Code

/// Start Public API Group Code

class PublicAPIGroup {
  static String getBaseUrl() => 'https://sbcareapi.sleepydev.net/api/v1/public';
  static Map<String, String> headers = {};
  static PubGetElearningShopCall pubGetElearningShopCall =
      PubGetElearningShopCall();
  static PubElearningShopSearchCall pubElearningShopSearchCall =
      PubElearningShopSearchCall();
  static PubGetElearningShopDetailsCall pubGetElearningShopDetailsCall =
      PubGetElearningShopDetailsCall();
  static PubGetContractionProCall pubGetContractionProCall =
      PubGetContractionProCall();
  static PubGetListMitraCall pubGetListMitraCall = PubGetListMitraCall();
  static PubMitraSearchCall pubMitraSearchCall = PubMitraSearchCall();
  static PubGetMitraDetailsCall pubGetMitraDetailsCall =
      PubGetMitraDetailsCall();
  static PubGetListArticleCall pubGetListArticleCall = PubGetListArticleCall();
  static PubArticleSearchCall pubArticleSearchCall = PubArticleSearchCall();
  static PubGetArticleDetailsCall pubGetArticleDetailsCall =
      PubGetArticleDetailsCall();
  static PubTopMitraCall pubTopMitraCall = PubTopMitraCall();
  static PubGetOnlineClassProgramsCall pubGetOnlineClassProgramsCall =
      PubGetOnlineClassProgramsCall();
  static PubGetEbookShopCall pubGetEbookShopCall = PubGetEbookShopCall();
  static PubGetEbookShopSearchCall pubGetEbookShopSearchCall =
      PubGetEbookShopSearchCall();
  static PubGetEbookShopDetailsCall pubGetEbookShopDetailsCall =
      PubGetEbookShopDetailsCall();
}

class PubGetElearningShopCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get Elearning Shop',
      apiUrl: '${baseUrl}/e-learnings',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? uidModule(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleImage(dynamic response) => (getJsonField(
        response,
        r'''$..modul_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleTitle(dynamic response) => (getJsonField(
        response,
        r'''$..modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleDesc(dynamic response) => (getJsonField(
        response,
        r'''$..modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubElearningShopSearchCall {
  Future<ApiCallResponse> call({
    String? keyword = '',
  }) async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Elearning Shop Search',
      apiUrl: '${baseUrl}/e-learnings',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? uidModule(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleImage(dynamic response) => (getJsonField(
        response,
        r'''$..modul_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleTitle(dynamic response) => (getJsonField(
        response,
        r'''$..modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? moduleDesc(dynamic response) => (getJsonField(
        response,
        r'''$..modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubGetElearningShopDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidModul = '',
  }) async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get Elearning Shop Details',
      apiUrl: '${baseUrl}/e-learnings/${uuidModul}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? uidModule(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_modul''',
      ));
  String? moduleImage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..modul_image''',
      ));
  String? moduleTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..modul_title_only''',
      ));
  String? moduleDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..modul_description''',
      ));
  int? modulePrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..modul_price''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_modul_price''',
      ));
  List? allSubModule(dynamic response) => getJsonField(
        response,
        r'''$..active_sub_modules''',
        true,
      ) as List?;
  String? submoduleTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..active_sub_modules..submodul_title''',
      ));
}

class PubGetContractionProCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get Contraction Pro ',
      apiUrl: '${baseUrl}/pro-features',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidProFeature(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_pro_feature''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$..name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubGetListMitraCall {
  Future<ApiCallResponse> call({
    int? page,
  }) async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get List Mitra',
      apiUrl: '${baseUrl}/mitra',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? uidUser(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidProvider(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_provider''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fullname(dynamic response) => (getJsonField(
        response,
        r'''$..fullname_mitra''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$..avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? location(dynamic response) => (getJsonField(
        response,
        r'''$..location''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? totalServices(dynamic response) => (getJsonField(
        response,
        r'''$..total_services''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? slug(dynamic response) => (getJsonField(
        response,
        r'''$..slug_mitra''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubMitraSearchCall {
  Future<ApiCallResponse> call({
    String? keyword = '',
  }) async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Mitra Search',
      apiUrl: '${baseUrl}/mitra',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? uidUser(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidProvider(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_provider''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fullname(dynamic response) => (getJsonField(
        response,
        r'''$..fullname_mitra''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$..avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? location(dynamic response) => (getJsonField(
        response,
        r'''$..location''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? totalServices(dynamic response) => (getJsonField(
        response,
        r'''$..total_services''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? slug(dynamic response) => (getJsonField(
        response,
        r'''$..slug_mitra''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubGetMitraDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidProvider = '',
  }) async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get Mitra Details',
      apiUrl: '${baseUrl}/mitra/${uuidProvider}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? uidUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_user''',
      ));
  String? uidProvider(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_provider''',
      ));
  String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..fullname_mitra''',
      ));
  String? avatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..avatar''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..email''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..phone_number''',
      ));
  String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..location''',
      ));
  List? allClasses(dynamic response) => getJsonField(
        response,
        r'''$..program_classes''',
        true,
      ) as List?;
  List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..program_classes..uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nameProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..program_classes..name_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..program_classes..image_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? infoProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..program_classes..info_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..program_classes..formatted_price_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubGetListArticleCall {
  Future<ApiCallResponse> call({
    int? page,
  }) async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get List Article',
      apiUrl: '${baseUrl}/articles',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? uidArticle(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_article''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? articleId(dynamic response) => (getJsonField(
        response,
        r'''$..article_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? coverImageUrl(dynamic response) => (getJsonField(
        response,
        r'''$..cover_image_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$..title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? authorName(dynamic response) => (getJsonField(
        response,
        r'''$..author_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryName(dynamic response) => (getJsonField(
        response,
        r'''$..category_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? publishedAt(dynamic response) => (getJsonField(
        response,
        r'''$..published_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? slug(dynamic response) => (getJsonField(
        response,
        r'''$..slug''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? excerpt(dynamic response) => (getJsonField(
        response,
        r'''$..excerpt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubArticleSearchCall {
  Future<ApiCallResponse> call({
    int? page,
    String? keyword = '',
  }) async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Article Search',
      apiUrl: '${baseUrl}/articles',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? uidArticle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_article''',
      ));
  int? articleId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..article_id''',
      ));
  String? coverImageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..cover_image_url''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..title''',
      ));
  String? authorName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..author_name''',
      ));
  String? categoryName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..category_name''',
      ));
  String? publishedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..published_at''',
      ));
}

class PubGetArticleDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidArticle = '',
  }) async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get Article Details',
      apiUrl: '${baseUrl}/articles/${uuidArticle}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? uidArticle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_article''',
      ));
  int? articleId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..article_id''',
      ));
  int? authorId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..author_id''',
      ));
  String? categoryName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..category_name''',
      ));
  String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..article_images..image_url''',
      ));
  String? caption(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..article_images..caption''',
      ));
  List<String>? tagName(dynamic response) => (getJsonField(
        response,
        r'''$..article_tags..name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? coverImageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..cover_image_url''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..title''',
      ));
  String? slug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..slug''',
      ));
  String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..content''',
      ));
  String? authorName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..author_name''',
      ));
  String? publishedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..published_at''',
      ));
  String? authorAvatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..author_avatar''',
      ));
  String? excerpt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..excerpt''',
      ));
}

class PubTopMitraCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Top Mitra',
      apiUrl: '${baseUrl}/mitra-ranks',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uidUser(dynamic response) => (getJsonField(
        response,
        r'''$..user.uuid_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fullname(dynamic response) => (getJsonField(
        response,
        r'''$..user.fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidProvider(dynamic response) => (getJsonField(
        response,
        r'''$..user.uuid_provider''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? slug(dynamic response) => (getJsonField(
        response,
        r'''$..user.slug_mitra''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$..user.avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? totalServices(dynamic response) => (getJsonField(
        response,
        r'''$..user.total_services''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? location(dynamic response) => (getJsonField(
        response,
        r'''$..user.location''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubGetOnlineClassProgramsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get Online Class Programs',
      apiUrl: '${baseUrl}/online-classes',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? uidProgram(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_program''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageOnlineClass(dynamic response) => (getJsonField(
        response,
        r'''$..image_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nameOnlineClass(dynamic response) => (getJsonField(
        response,
        r'''$..name_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_online_class_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubGetEbookShopCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get Ebook Shop',
      apiUrl: '${baseUrl}/ebooks',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? uidEbook(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_ebook''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cover(dynamic response) => (getJsonField(
        response,
        r'''$..cover''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$..title_only''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$..description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? duration(dynamic response) => (getJsonField(
        response,
        r'''$..duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubGetEbookShopSearchCall {
  Future<ApiCallResponse> call({
    String? keyword = '',
  }) async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get Ebook Shop Search',
      apiUrl: '${baseUrl}/ebooks',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? uidEbook(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_ebook''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cover(dynamic response) => (getJsonField(
        response,
        r'''$..cover''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$..title_only''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$..description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? duration(dynamic response) => (getJsonField(
        response,
        r'''$..duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PubGetEbookShopDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidEbook = '',
  }) async {
    final baseUrl = PublicAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pub Get Ebook Shop Details',
      apiUrl: '${baseUrl}/ebooks/${uuidEbook}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? uidEbook(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_ebook''',
      ));
  String? uidProgramClass(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_program_class''',
      ));
  String? cover(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..cover''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..title_only''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..description''',
      ));
  String? duration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..duration''',
      ));
  int? price(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..price''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_price''',
      ));
  List? allCatalogues(dynamic response) => getJsonField(
        response,
        r'''$..catalogues''',
        true,
      ) as List?;
}

/// End Public API Group Code

/// Start Pro Feature Group Code

class ProFeatureGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://sbcareapi.sleepydev.net/user';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static GetListContractionProCall getListContractionProCall =
      GetListContractionProCall();
  static GetContractionProDetailsCall getContractionProDetailsCall =
      GetContractionProDetailsCall();
  static GetOwnedListContractionProCall getOwnedListContractionProCall =
      GetOwnedListContractionProCall();
  static PurchaseContractionProCall purchaseContractionProCall =
      PurchaseContractionProCall();
  static GetOwnedContractionProDetailsCall getOwnedContractionProDetailsCall =
      GetOwnedContractionProDetailsCall();
  static RedeemContractionProCall redeemContractionProCall =
      RedeemContractionProCall();
}

class GetListContractionProCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = ProFeatureGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get List Contraction Pro',
      apiUrl: '${baseUrl}/pro-features',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? uidProFeature(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_pro_feature''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$..image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$..name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$..description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? price(dynamic response) => (getJsonField(
        response,
        r'''$..price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? duration(dynamic response) => (getJsonField(
        response,
        r'''$..duration_text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetContractionProDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidProFeature = '',
    String? token = '',
  }) async {
    final baseUrl = ProFeatureGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Contraction Pro Details',
      apiUrl: '${baseUrl}/pro-features/${uuidProFeature}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? uidProFeature(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_pro_feature''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..image''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..name''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..description''',
      ));
  int? price(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..price''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_price''',
      ));
  String? duration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..duration_text''',
      ));
}

class GetOwnedListContractionProCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = ProFeatureGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Owned List Contraction Pro',
      apiUrl: '${baseUrl}/owned-pro-features',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalOwned(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_pro_features_purchased''',
      ));
  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? uidUserProFeature(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_user_pro_feature''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidUser(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? expiredDate(dynamic response) => (getJsonField(
        response,
        r'''$..expired_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uidProFeature(dynamic response) => (getJsonField(
        response,
        r'''$..pro_feature.uuid_pro_feature''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$..pro_feature.image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$..pro_feature.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$..pro_feature.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? url(dynamic response) => (getJsonField(
        response,
        r'''$..pro_feature.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$..pro_feature.status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PurchaseContractionProCall {
  Future<ApiCallResponse> call({
    String? uuidProFeature = '',
    int? quantity = 1,
    String? token = '',
  }) async {
    final baseUrl = ProFeatureGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Purchase Contraction Pro',
      apiUrl: '${baseUrl}/pro-features/${uuidProFeature}/subscribe',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOwnedContractionProDetailsCall {
  Future<ApiCallResponse> call({
    String? uuidUserProFeature = '',
    String? token = '',
  }) async {
    final baseUrl = ProFeatureGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Owned Contraction Pro Details',
      apiUrl: '${baseUrl}/owned-pro-features/${uuidUserProFeature}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? uidUserProFeature(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..uuid_user_pro_feature''',
      ));
  List<String>? uidProFeature(dynamic response) => (getJsonField(
        response,
        r'''$..pro_feature.uuid_pro_feature''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? uidUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_user''',
      ));
  String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..fullname''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..pro_feature.image''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..pro_feature.name''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..pro_feature.description''',
      ));
  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..pro_feature.url''',
      ));
}

class RedeemContractionProCall {
  Future<ApiCallResponse> call({
    String? uuidProFeature = '',
    String? code = '',
    String? token = '',
  }) async {
    final baseUrl = ProFeatureGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "code": ${code == null ? 'null' : '"${escapeStringForJson(code)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Redeem Contraction Pro',
      apiUrl: '${baseUrl}/pro-features/${uuidProFeature}/redeem_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Pro Feature Group Code

/// Start Verification Group Code

class VerificationGroup {
  static String getBaseUrl() =>
      'https://sbcareapi.sleepydev.net/api/v1/verification';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static RequestEmailResetPasswordCall requestEmailResetPasswordCall =
      RequestEmailResetPasswordCall();
  static VerifyCodeResetPasswordCall verifyCodeResetPasswordCall =
      VerifyCodeResetPasswordCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static ResendEmailResetPasswordCall resendEmailResetPasswordCall =
      ResendEmailResetPasswordCall();
}

class RequestEmailResetPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = VerificationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": ${email == null ? 'null' : '"${escapeStringForJson(email)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Request Email Reset Password',
      apiUrl: '${baseUrl}/send_password_reset_code',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyCodeResetPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? verificationCode = '',
  }) async {
    final baseUrl = VerificationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": ${email == null ? 'null' : '"${escapeStringForJson(email)}"'},
  "verification_code": ${verificationCode == null ? 'null' : '"${escapeStringForJson(verificationCode)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify Code Reset Password',
      apiUrl: '${baseUrl}/verify_password_reset_code',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.password_change_token''',
      ));
  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? newPassword = '',
    String? passwordConfirmation = '',
    String? passwordChangeToken = '',
  }) async {
    final baseUrl = VerificationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "new_password": ${newPassword == null ? 'null' : '"${escapeStringForJson(newPassword)}"'},
  "password_confirmation": ${passwordConfirmation == null ? 'null' : '"${escapeStringForJson(passwordConfirmation)}"'},
  "password_change_token": ${passwordChangeToken == null ? 'null' : '"${escapeStringForJson(passwordChangeToken)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reset Password',
      apiUrl: '${baseUrl}/reset_password',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ResendEmailResetPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = VerificationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": ${email == null ? 'null' : '"${escapeStringForJson(email)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Resend Email Reset Password',
      apiUrl: '${baseUrl}/resend_password_reset_code',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Verification Group Code

/// Start SBLink Group Code

class SBLinkGroup {
  static String getBaseUrl() => 'https://sbcareapi.sleepydev.net/api/v1/public';
  static Map<String, String> headers = {};
  static SBLinkCreatorProfileCall sBLinkCreatorProfileCall =
      SBLinkCreatorProfileCall();
  static ListProductsCall listProductsCall = ListProductsCall();
  static DetailProductCall detailProductCall = DetailProductCall();
}

class SBLinkCreatorProfileCall {
  Future<ApiCallResponse> call({
    String? slug = '',
  }) async {
    final baseUrl = SBLinkGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SBLink Creator Profile',
      apiUrl: '${baseUrl}/user-profiles/${slug}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_user''',
      ));
  String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..fullname''',
      ));
  String? slug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..slug''',
      ));
  String? avatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..avatar_url''',
      ));
}

class ListProductsCall {
  Future<ApiCallResponse> call({
    String? mitraSlug = '',
  }) async {
    final baseUrl = SBLinkGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List Products',
      apiUrl: '${baseUrl}/mitra/${mitraSlug}/products',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'status': "ACTIVE",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidProduct(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_product''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..image''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..title''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_price''',
      ));
  String? productSlug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..product_slug''',
      ));
  String? typed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..type''',
      ));
}

class DetailProductCall {
  Future<ApiCallResponse> call({
    String? mitraSlug = '',
    String? uuidProduct = '',
  }) async {
    final baseUrl = SBLinkGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Detail Product',
      apiUrl: '${baseUrl}/mitra/${mitraSlug}/products/${uuidProduct}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uidProduct(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..uuid_product''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..image''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..title''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..description''',
      ));
  String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..type''',
      ));
  int? price(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..price''',
      ));
  int? promoPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..promo_price''',
      ));
  String? formattedPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..formatted_price''',
      ));
  String? formattedPromoPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..formatted_promo_price''',
      ));
  String? productSlug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..product_slug''',
      ));
  List? productBenefits(dynamic response) => getJsonField(
        response,
        r'''$..product_benefits''',
        true,
      ) as List?;
}

/// End SBLink Group Code

/// Start Scalev Group Code

class ScalevGroup {
  static String getBaseUrl() => 'https://api.scalev.id/v2';
  static Map<String, String> headers = {};
  static ListSBLinkProductsCall listSBLinkProductsCall =
      ListSBLinkProductsCall();
  static ListOrderCall listOrderCall = ListOrderCall();
}

class ListSBLinkProductsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ScalevGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List SBLink Products',
      apiUrl: '${baseUrl}/products/simplified',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$..results[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? uid(dynamic response) => (getJsonField(
        response,
        r'''$..results[:].uuid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$..results[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$..results[:].images[*]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$..results[:].variants..price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ListOrderCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ScalevGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List Order',
      apiUrl: '${baseUrl}/order',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Scalev Group Code

/// Start Supabase Group Code

class SupabaseGroup {
  static String getBaseUrl() =>
      'https://vagnvzvfcsyuicmsjjdy.supabase.co/rest/v1/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static InsertAppointmentNotificationCall insertAppointmentNotificationCall =
      InsertAppointmentNotificationCall();
  static InsertAppointmentDoneNotificationCall
      insertAppointmentDoneNotificationCall =
      InsertAppointmentDoneNotificationCall();
}

class InsertAppointmentNotificationCall {
  Future<ApiCallResponse> call({
    String? uuidUser = '',
    String? uuidProvider = '',
    String? emailClient = '',
    String? emailProvider = '',
    String? serviceName = '',
    String? nameClient = '',
    String? nameProvider = '',
    String? appointmentDate = '',
    String? appointmentTime = '',
    String? appointmentLocation = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "uuid_user": ${uuidUser == null ? 'null' : '"${escapeStringForJson(uuidUser)}"'},
  "uuid_provider": ${uuidProvider == null ? 'null' : '"${escapeStringForJson(uuidProvider)}"'},
  "email_client": ${emailClient == null ? 'null' : '"${escapeStringForJson(emailClient)}"'},
  "email_provider": ${emailProvider == null ? 'null' : '"${escapeStringForJson(emailProvider)}"'},
  "service_name": ${serviceName == null ? 'null' : '"${escapeStringForJson(serviceName)}"'},
  "name_client": ${nameClient == null ? 'null' : '"${escapeStringForJson(nameClient)}"'},
  "name_provider": ${nameProvider == null ? 'null' : '"${escapeStringForJson(nameProvider)}"'},
  "appointment_date": ${appointmentDate == null ? 'null' : '"${escapeStringForJson(appointmentDate)}"'},
  "appointment_time": ${appointmentTime == null ? 'null' : '"${escapeStringForJson(appointmentTime)}"'},
  "appointment_location": ${appointmentLocation == null ? 'null' : '"${escapeStringForJson(appointmentLocation)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Insert Appointment Notification',
      apiUrl: '${baseUrl}/appointment_notifications',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
      client: ApiManager.getClient(withCredentials: true),
    );
  }
}

class InsertAppointmentDoneNotificationCall {
  Future<ApiCallResponse> call({
    String? uuidUser = '',
    String? uuidProvider = '',
    String? emailClient = '',
    String? emailProvider = '',
    String? serviceName = '',
    String? nameClient = '',
    String? nameProvider = '',
    String? appointmentDate = '',
    String? appointmentTime = '',
    String? appointmentPrice = '',
    String? appointmentModule = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "uuid_user": ${uuidUser == null ? 'null' : '"${escapeStringForJson(uuidUser)}"'},
  "uuid_provider": ${uuidProvider == null ? 'null' : '"${escapeStringForJson(uuidProvider)}"'},
  "email_client": ${emailClient == null ? 'null' : '"${escapeStringForJson(emailClient)}"'},
  "email_provider": ${emailProvider == null ? 'null' : '"${escapeStringForJson(emailProvider)}"'},
  "service_name": ${serviceName == null ? 'null' : '"${escapeStringForJson(serviceName)}"'},
  "name_client": ${nameClient == null ? 'null' : '"${escapeStringForJson(nameClient)}"'},
  "name_provider": ${nameProvider == null ? 'null' : '"${escapeStringForJson(nameProvider)}"'},
  "appointment_date": ${appointmentDate == null ? 'null' : '"${escapeStringForJson(appointmentDate)}"'},
  "appointment_time": ${appointmentTime == null ? 'null' : '"${escapeStringForJson(appointmentTime)}"'},
  "appointment_price": ${appointmentPrice == null ? 'null' : '"${escapeStringForJson(appointmentPrice)}"'},
  "appointment_module": ${appointmentModule == null ? 'null' : '"${escapeStringForJson(appointmentModule)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Insert Appointment Done Notification',
      apiUrl: '${baseUrl}/appointment_done_notifications',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
      client: ApiManager.getClient(withCredentials: true),
    );
  }
}

/// End Supabase Group Code

class GetTransactionHistoryCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Transaction History',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/transaction',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidUserTransaction(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_user_transaction''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? transactionName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].transaction_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? transactionAmount(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].transaction_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? transactionInvoice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].transaction_invoice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? transactionTipe(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].transaction_tipe''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? transactionStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].transaction_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? transactionCreated(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].transaction_created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allTransaction(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? formattedAmount(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_transaction_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? feeTransaction(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].transaction_fees''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? formattedFee(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_transaction_fees''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RegisterCall {
  static Future<ApiCallResponse> call({
    String? fullName = '',
    String? userName = '',
    String? email = '',
    String? phoneNumber = '',
    String? password = '',
    String? passwordConfirmation = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user": {
    "full_name": ${fullName == null ? 'null' : '"${escapeStringForJson(fullName)}"'},
    "user_name": ${userName == null ? 'null' : '"${escapeStringForJson(userName)}"'},
    "email": ${email == null ? 'null' : '"${escapeStringForJson(email)}"'},
    "phone_number": ${phoneNumber == null ? 'null' : '"${escapeStringForJson(phoneNumber)}"'},
    "password": ${password == null ? 'null' : '"${escapeStringForJson(password)}"'},
    "password_confirmation": ${passwordConfirmation == null ? 'null' : '"${escapeStringForJson(passwordConfirmation)}"'}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: 'https://sbcareapi.sleepydev.net/auth',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static List<String>? errorUsername(dynamic response) => (getJsonField(
        response,
        r'''$.message.username_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? errorEmail(dynamic response) => (getJsonField(
        response,
        r'''$.message.email_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? errorPhone(dynamic response) => (getJsonField(
        response,
        r'''$.message.phone_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetListServicesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidUser = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get List Services',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/services/${uuidUser}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? nameProgram(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name_program''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].image_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nameProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? infoProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].info_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? campaignStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].campaign_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userClassEnd(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_class_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allServices(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? statusProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].status_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetListMitraCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? isProvider = 'true',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get List Mitra',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/list-mitra/${isProvider}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? avatarMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullnameMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? emailMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phoneMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? isProvider(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].is_provider''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? uidUserMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allMitra(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? addressMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchMitraCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? isProvider = 'true',
    String? keyword = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Mitra',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/list-mitra/${isProvider}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? avatarMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullnameMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? emailMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phoneMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? isProvider(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].is_provider''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? uidUserMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allMitra(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? addressMitra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetListModuleRegularCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? moduleId = 'uuid_modul',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get List Module Regular',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/modul/${moduleId}/regular',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidModul(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulImageReg(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulTitleReg(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? modulPriceReg(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? modulStatusReg(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allModulReg(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulEnd(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_modul_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userModulStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulDescription(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchModuleRegularCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? moduleId = 'uuid_modul',
    String? keyword = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Module Regular',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/modul/${moduleId}/regular',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidModul(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulImageReg(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulTitleReg(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? modulPriceReg(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? modulStatusReg(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allModulReg(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulEnd(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_modul_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userModulStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulDescription(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetListModulePracticeCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? moduleId = 'uuid_modul',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get List Module Practice',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/modul/${moduleId}/practice',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidModulPra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulImagePra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulTitlePra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? modulPricePra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? modulStatusPra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allModulPra(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulEnd(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_modul_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userModulStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? appointmentOnProgress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].total_appointment_in_progress''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? modulDescription(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchModulePracticeCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? moduleId = 'uuid_modul',
    String? keyword = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Module Practice',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/modul/${moduleId}/practice',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidModulPra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulImagePra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulTitlePra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? modulPricePra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? modulStatusPra(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allModulPra(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulEnd(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_modul_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userModulStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? appointmentOnProgress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].total_appointment_in_progress''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? modulDescription(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetCitiesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Cities',
      apiUrl: 'https://sbcareapi.sleepydev.net/tools/cities',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? nameCity(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? idCity(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? queryCity(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.id == 1)]''',
        true,
      ) as List?;
}

class GetListServicesMitraCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get List Services Mitra',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/services',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidProgramClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? campaignTitle(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].campaign_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userClassEnd(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_class_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userClassStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_class_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? campaignImage(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].campaign_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allListServices(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? uidCampaign(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_campaign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? activeLicence(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.user_class_status == 'actived')]''',
        true,
      ) as List?;
  static List? inactiveLicence(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.user_class_status == 'inactived')]''',
        true,
      ) as List?;
  static List<String>? uidUserClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_user_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userLearningStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].user_learning_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? expiredLicence(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.user_class_status == 'expired')]''',
        true,
      ) as List?;
  static List? openService(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.campaign_status == 'actived')]''',
        true,
      ) as List?;
  static List? closedService(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.campaign_status == 'disabled')]''',
        true,
      ) as List?;
  static List? expiredService(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.campaign_status == 'expired')]''',
        true,
      ) as List?;
  static List<String>? campaignStatus(dynamic response) => (getJsonField(
        response,
        r'''$..campaign_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetListModuleClientCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get List Module Client',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/modul',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidModuleClient(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? moduleImageClient(dynamic response) => (getJsonField(
        response,
        r'''$..modul_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? moduleTitleClient(dynamic response) => (getJsonField(
        response,
        r'''$..modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? modulePriceClient(dynamic response) => (getJsonField(
        response,
        r'''$..modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? moduleStatusClient(dynamic response) => (getJsonField(
        response,
        r'''$..modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allModuleClient(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? moduleEnd(dynamic response) => (getJsonField(
        response,
        r'''$..user_modul_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userModulStatus(dynamic response) => (getJsonField(
        response,
        r'''$..user_modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? uidUserModule(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_user_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulDescription(dynamic response) => (getJsonField(
        response,
        r'''$..modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchModuleClientCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? keyword = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Module Client',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/modul',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidModuleClient(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? moduleImageClient(dynamic response) => (getJsonField(
        response,
        r'''$..modul_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? moduleTitleClient(dynamic response) => (getJsonField(
        response,
        r'''$..modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? modulePriceClient(dynamic response) => (getJsonField(
        response,
        r'''$..modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? moduleStatusClient(dynamic response) => (getJsonField(
        response,
        r'''$..modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allModuleClient(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? moduleEnd(dynamic response) => (getJsonField(
        response,
        r'''$..user_modul_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userModulStatus(dynamic response) => (getJsonField(
        response,
        r'''$..user_modul_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? uidUserModule(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_user_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulDescription(dynamic response) => (getJsonField(
        response,
        r'''$..modul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetPayoutBanksCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Payout Banks',
      apiUrl: 'https://sbcareapi.sleepydev.net/tools/banks/payout',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? nameBankPayout(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? uidBankPayout(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_bank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetProvincesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Provinces',
      apiUrl: 'https://sbcareapi.sleepydev.net/tools/provinces',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? nameProvince(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? idProvince(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetTopupBanksCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Topup Banks',
      apiUrl: 'https://sbcareapi.sleepydev.net/tools/banks/topup',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? nameBank(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? uriBank(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uri_bank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? minTopup(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].min_topup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetAddressMitraCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Address Mitra',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/profile/address',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidUserAddress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_user_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? streetAddress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].street_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subdistrictAddress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].subdistrict_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? districtAddress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].district_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? cityAddress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].city_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? zipCode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].zip_postals_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? isDefaultAddress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].is_default_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allAddress(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? fullStreetAddress(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].full_street_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? countryState(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].country_state''',
      ));
  static String? uidDefaultPracticeAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..[?(@.is_default_address == true)].uuid_user_address''',
      ));
}

class GetListProgramWorkshopCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get List Program Workshop',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/program-workshops',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidProgramWorkshop(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_program_workshop''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? programWorkshopImage(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].program_workshop_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workshopName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].workshop_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? durationClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].duration_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? descClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].info_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? priceClass(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].price_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? allProgramWorkshop(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_price_program_class''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? workshopDate(dynamic response) => getJsonField(
        response,
        r'''$.data[:].workshop_date''',
        true,
      ) as List?;
  static List<String>? workshopTime(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].workshop_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetServiceDetailsMitraCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidCampaign = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Service Details Mitra',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/services/settings/${uuidCampaign}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidProgramClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_program_class''',
      ));
  static String? uidCampaign(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_campaign''',
      ));
  static String? uidUserAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user_address''',
      ));
  static String? campaignTitle(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.campaign_title''',
      ));
  static String? campaignStory(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.campaign_story''',
      ));
  static String? campaignAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.campaign_address''',
      ));
  static String? campaignTimezone(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.campaign_timezone''',
      ));
  static bool? campaignStatus(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.data.campaign_status''',
      ));
  static int? userClassPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.user_class_price''',
      ));
  static List? allSchedules(dynamic response) => getJsonField(
        response,
        r'''$.data.schedules''',
        true,
      ) as List?;
  static List<String>? scheduleDays(dynamic response) => (getJsonField(
        response,
        r'''$..schedules..schedule_days''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic allServicesDetails(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static List? sundaySubSchedules(dynamic response) => getJsonField(
        response,
        r'''$..schedules[0].sub_schedules''',
        true,
      ) as List?;
  static String? formattedPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.formatted_user_class_price''',
      ));
  static List? mondaySubSchedules(dynamic response) => getJsonField(
        response,
        r'''$..schedules[1].sub_schedules''',
        true,
      ) as List?;
  static List? tuesdaySubSchedules(dynamic response) => getJsonField(
        response,
        r'''$..schedules[2].sub_schedules''',
        true,
      ) as List?;
  static List? wednesdaySubSchedules(dynamic response) => getJsonField(
        response,
        r'''$..schedules[3].sub_schedules''',
        true,
      ) as List?;
  static List? thursdaySubSchedules(dynamic response) => getJsonField(
        response,
        r'''$..schedules[4].sub_schedules''',
        true,
      ) as List?;
  static List? fridaySubSchedules(dynamic response) => getJsonField(
        response,
        r'''$..schedules[5].sub_schedules''',
        true,
      ) as List?;
  static List? saturdaySubSchedules(dynamic response) => getJsonField(
        response,
        r'''$..schedules[6].sub_schedules''',
        true,
      ) as List?;
  static dynamic sundaySchedule(dynamic response) => getJsonField(
        response,
        r'''$..schedules[0]''',
      );
  static dynamic mondaySchedule(dynamic response) => getJsonField(
        response,
        r'''$..schedules[1]''',
      );
  static dynamic tuesdaySchedule(dynamic response) => getJsonField(
        response,
        r'''$..schedules[2]''',
      );
  static dynamic wednesdaySchedule(dynamic response) => getJsonField(
        response,
        r'''$..schedules[3]''',
      );
  static dynamic thursdaySchedule(dynamic response) => getJsonField(
        response,
        r'''$..schedules[4]''',
      );
  static dynamic fridaySchedule(dynamic response) => getJsonField(
        response,
        r'''$..schedules[5]''',
      );
  static dynamic saturdaySchedule(dynamic response) => getJsonField(
        response,
        r'''$..schedules[6]''',
      );
  static String? sundayUid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..schedules[0].uuid_schedule''',
      ));
  static String? mondayUid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..schedules[1].uuid_schedule''',
      ));
  static String? tuesdayUid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..schedules[2].uuid_schedule''',
      ));
  static String? wednesdayUid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..schedules[3].uuid_schedule''',
      ));
  static String? thursdayUid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..schedules[4].uuid_schedule''',
      ));
  static String? fridayUid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..schedules[5].uuid_schedule''',
      ));
  static String? saturdayUid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..schedules[6].uuid_schedule''',
      ));
  static String? uidUserClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..uuid_user_class''',
      ));
  static int? userClassLimit(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..user_class_limit''',
      ));
  static List<bool>? scheduleStatus(dynamic response) => (getJsonField(
        response,
        r'''$..schedules..is_schedule_opened''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static String? floorPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.formatted_floorprice_program_class''',
      ));
  static String? highPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.formatted_highprice_program_class''',
      ));
}

class GetServiceDetailsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidCampaign = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Service Details',
      apiUrl:
          'https://sbcareapi.sleepydev.net/user/services/settings/${uuidCampaign}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidProgramClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_program_class''',
      ));
  static String? uidCampaign(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_campaign''',
      ));
  static String? uidUserAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user_address''',
      ));
  static String? campaignTitle(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.campaign_title''',
      ));
  static String? campaignStory(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.campaign_story''',
      ));
  static String? campaignAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.campaign_address''',
      ));
  static String? campaignTimezone(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.campaign_timezone''',
      ));
  static int? userClassPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.user_class_price''',
      ));
  static List<String>? uidSubSchedules(dynamic response) => (getJsonField(
        response,
        r'''$.data.schedules[:].sub_schedules[:].uuid_subschedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allSchedules(dynamic response) => getJsonField(
        response,
        r'''$.data.schedules''',
        true,
      ) as List?;
  static List<String>? uidSchedules(dynamic response) => (getJsonField(
        response,
        r'''$.data.schedules[:].uuid_schedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allSubSchedules(dynamic response) => getJsonField(
        response,
        r'''$.data.schedules[:].sub_schedules''',
        true,
      ) as List?;
  static List<String>? scheduleDays(dynamic response) => (getJsonField(
        response,
        r'''$..schedules..schedule_days''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subSchedulesStarted(dynamic response) => (getJsonField(
        response,
        r'''$.data.schedules[:].sub_schedules[:].subschedule_started''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subSchedulesEnd(dynamic response) => (getJsonField(
        response,
        r'''$.data.schedules[:].sub_schedules[:].subschedule_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subSchedulesStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data.schedules[:].sub_schedules[:].subschedule_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic allServicesDetails(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static List<String>? sundaySessionStart(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[0]..subschedule_started''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? sundaySchedules(dynamic response) => getJsonField(
        response,
        r'''$..schedules[0]''',
        true,
      ) as List?;
  static List<String>? allUidSchedules(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_schedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sundaySessionEnd(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[0]..subschedule_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mondaySessionStart(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[1]..subschedule_started''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mondaySessionEnd(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[1]..subschedule_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tuesdaySessionStart(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[2]..subschedule_started''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tuesdaySessionEnd(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[2]..subschedule_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? wednesdaySessionStart(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[3]..subschedule_started''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? wednesdaySessionEnd(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[3]..subschedule_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? thursdaySessionStart(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[4]..subschedule_started''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? thursdaySessionEnd(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[4]..subschedule_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fridaySessionStart(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[5]..subschedule_started''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fridaySessionEnd(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[5]..subschedule_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? saturdaySessionStart(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[6]..subschedule_started''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? saturdaySessionEnd(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[6]..subschedule_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sessionTime(dynamic response) => (getJsonField(
        response,
        r'''$..schedules[0]..subschedule_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? sundaySubSchedules(dynamic response) => getJsonField(
        response,
        r'''$..schedules[0].sub_schedules''',
        true,
      ) as List?;
  static String? campaignImage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.campaign_image''',
      ));
  static String? formattedPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.formatted_user_class_price''',
      ));
  static String? infoProgramClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.info_program_class''',
      ));
}

class GetProgramWorkshopDetailsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? programWorkshopId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Program Workshop Details',
      apiUrl:
          'https://sbcareapi.sleepydev.net/user/program-workshops/${programWorkshopId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidProgramWorkshop(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_program_workshop''',
      ));
  static String? programWorkshopImage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.program_workshop_image''',
      ));
  static String? workshopName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.workshop_name''',
      ));
  static int? priceProgramClass(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.data.price_program_class''',
      ));
  static String? durationProgramClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.duration_program_class''',
      ));
  static String? infoProgramClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.info_program_class''',
      ));
  static String? workshopTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.workshop_time''',
      ));
  static dynamic allProgramWorkshopDetails(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? workshopDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.workshop_date''',
      ));
  static String? workshopLimit(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.workshop_limit''',
      ));
  static String? formattedPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.formatted_price_program_class''',
      ));
  static String? uidProgramClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_program_class''',
      ));
}

class GetAddressDetailsMitraCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidUserAddress = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Address Details Mitra',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/profile/address/${uuidUserAddress}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidUserAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user_address''',
      ));
  static String? streetName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.street_address''',
      ));
  static String? subdistrict(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.subdistrict_address''',
      ));
  static String? district(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.district_address''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.city_address''',
      ));
  static String? province(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.country_state''',
      ));
  static String? zipCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.zip_postals_code''',
      ));
  static bool? isDefaultAddress(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.data.is_default_address''',
      ));
  static dynamic allAddress(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? fullStreetAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.full_street_address''',
      ));
}

class UpdatePracticeAddressCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidUserAddress = '',
    String? streetAddress = '',
    String? subdistrictAddress = '',
    String? districtAddress = '',
    String? cityAddress = '',
    String? countryState = '',
    String? zipPostalsCode = '',
    bool? isDefaultAddress,
  }) async {
    final ffApiRequestBody = '''
{
  "street_address": ${streetAddress == null ? 'null' : '"${streetAddress}"'},
  "subdistrict_address": ${subdistrictAddress == null ? 'null' : '"${subdistrictAddress}"'},
  "district_address": ${districtAddress == null ? 'null' : '"${districtAddress}"'},
  "city_address": ${cityAddress == null ? 'null' : '"${cityAddress}"'},
  "country_state": ${countryState == null ? 'null' : '"${countryState}"'},
  "zip_postals_code": ${zipPostalsCode == null ? 'null' : '"${zipPostalsCode}"'},
  "is_default_address": ${isDefaultAddress}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Practice Address',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/address/${uuidUserAddress}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidUserAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user_address''',
      ));
  static String? streetAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.street_address''',
      ));
  static String? subdistrictAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.subdistrict_address''',
      ));
  static String? districtAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.district_address''',
      ));
  static String? cityAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.city_address''',
      ));
  static String? countyState(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.county_state''',
      ));
  static String? zipCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.zip_postals_code''',
      ));
  static String? isDefaultAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.is_default_address''',
      ));
  static dynamic allAddress(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class DeletePracticeAddressCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidUserAddress = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Practice Address',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/address/${uuidUserAddress}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidUserAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user_address''',
      ));
  static String? streetAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.street_address''',
      ));
  static String? subdistrictAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.subdistrict_address''',
      ));
  static String? districtAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.district_address''',
      ));
  static String? cityAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.city_address''',
      ));
  static String? countyState(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.county_state''',
      ));
  static String? zipCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.zip_postals_code''',
      ));
  static String? isDefaultAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.is_default_address''',
      ));
  static dynamic allAddress(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class AddPracticeAddressCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? streetAddress = '',
    String? subdistrictAddress = '',
    String? districtAddress = '',
    String? cityAddress = '',
    String? countryState = '',
    String? zipPostalsCode = '',
    String? isDefaultAddress = 'false',
  }) async {
    final ffApiRequestBody = '''
{
  "street_address": ${streetAddress == null ? 'null' : '"${escapeStringForJson(streetAddress)}"'},
  "subdistrict_address": ${subdistrictAddress == null ? 'null' : '"${escapeStringForJson(subdistrictAddress)}"'},
  "district_address": ${districtAddress == null ? 'null' : '"${escapeStringForJson(districtAddress)}"'},
  "city_address": ${cityAddress == null ? 'null' : '"${escapeStringForJson(cityAddress)}"'},
  "country_state": ${countryState == null ? 'null' : '"${escapeStringForJson(countryState)}"'},
  "zip_postals_code": ${zipPostalsCode == null ? 'null' : '"${escapeStringForJson(zipPostalsCode)}"'},
  "is_default_address": ${isDefaultAddress == null ? 'null' : '"${escapeStringForJson(isDefaultAddress)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Practice Address',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidUserAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user_address''',
      ));
  static String? streetAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.street_address''',
      ));
  static String? subdistrictAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.subdistrict_address''',
      ));
  static String? districtAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.district_address''',
      ));
  static String? cityAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.city_address''',
      ));
  static String? countyState(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.county_state''',
      ));
  static String? zipCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.zip_postals_code''',
      ));
  static String? isDefaultAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.is_default_address''',
      ));
  static dynamic allAddress(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetModuleRegularDetailsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidModul = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Module Regular Details',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/modul/${uuidModul}/regular/submodules',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidModul(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulTitle(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulDesc(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulUrl(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulDuration(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allModule(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? submodulTipe(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_tipe''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetModulePracticeDetailsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidModul = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Module Practice Details',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/modul/${uuidModul}/practice/submodules',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidModul(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulTitle(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulDesc(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulUrl(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulTipe(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_tipe''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulDuration(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allModule(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetModulePracticeDetailsByProgramClassCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidProgramClass = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Module Practice Details by Program Class',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/program-class/${uuidProgramClass}/practice/submodules',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidModul(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulTitle(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulDesc(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulUrl(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulTipe(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_tipe''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? submodulDuration(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].submodul_duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allModule(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class UpdateUserBankCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? bankAccountNumber = '',
    String? bankAccountName = '',
    String? uuidUserBank = '',
    String? uuidBank = '',
  }) async {
    final ffApiRequestBody = '''
{
  "bank": {
    "bank_account_number": ${bankAccountNumber == null ? 'null' : '"${bankAccountNumber}"'},
    "bank_account_name": ${bankAccountName == null ? 'null' : '"${bankAccountName}"'},
    "uuid_bank": ${uuidBank == null ? 'null' : '"${uuidBank}"'}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Bank',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/banks/${uuidUserBank}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidUserBank(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user_bank''',
      ));
  static String? uidBank(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_bank''',
      ));
  static String? uidUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user''',
      ));
  static String? bankName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.bank_name''',
      ));
  static String? bankOwner(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.bank_owner''',
      ));
  static String? bankNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.bank_number''',
      ));
  static dynamic allBank(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class AddUserBankCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? bankAccountNumber = '',
    String? bankAccountName = '',
    String? uuidBank = '',
  }) async {
    final ffApiRequestBody = '''
{
  "bank": {
    "bank_account_number": ${bankAccountNumber == null ? 'null' : '"${escapeStringForJson(bankAccountNumber)}"'},
    "bank_account_name": ${bankAccountName == null ? 'null' : '"${escapeStringForJson(bankAccountName)}"'},
    "uuid_bank": ${uuidBank == null ? 'null' : '"${escapeStringForJson(uuidBank)}"'}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add User Bank',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/banks',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidUserBank(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user_bank''',
      ));
  static String? uidBank(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_bank''',
      ));
  static String? uidUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user''',
      ));
  static String? bankName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.bank_name''',
      ));
  static String? bankOwner(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.bank_owner''',
      ));
  static String? bankNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.bank_number''',
      ));
  static dynamic allBank(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetInfoMitraCall {
  static Future<ApiCallResponse> call({
    String? uuidProvider = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Info Mitra',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/info-mitra/${uuidProvider}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user''',
      ));
  static String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.fullname''',
      ));
  static dynamic allInfo(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class UpdateDefaultProviderCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? defaultProvider = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user": {
    "default_provider": ${defaultProvider == null ? 'null' : '"${defaultProvider}"'}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Default Provider',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/profile',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid_user''',
      ));
  static String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.fullname''',
      ));
  static String? phoneNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.phone_number''',
      ));
  static String? dobUser(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.datebirth_user''',
      ));
  static dynamic allProfile(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ChangePasswordCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? currentPassword = '',
    String? newPassword = '',
    String? passwordConfirmation = '',
  }) async {
    final ffApiRequestBody = '''
{
  "current_password": ${currentPassword == null ? 'null' : '"${escapeStringForJson(currentPassword)}"'},
  "new_password": ${newPassword == null ? 'null' : '"${escapeStringForJson(newPassword)}"'},
  "password_confirmation": ${passwordConfirmation == null ? 'null' : '"${escapeStringForJson(passwordConfirmation)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Password',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/profile/change-password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message.new_password''',
      ));
}

class GetAvailableSchedulesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidCampaign = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Available Schedules',
      apiUrl:
          'https://sbcareapi.sleepydev.net/user/appointment/${uuidCampaign}/available-schedules',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? allSchedules(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List? sunday(dynamic response) => getJsonField(
        response,
        r'''$..[0].sub_schedules..full_schedule''',
        true,
      ) as List?;
  static List<String>? monday(dynamic response) => (getJsonField(
        response,
        r'''$..[1].sub_schedules..full_schedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tuesday(dynamic response) => (getJsonField(
        response,
        r'''$..[2].sub_schedules..full_schedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? wednesday(dynamic response) => (getJsonField(
        response,
        r'''$..[3].sub_schedules..full_schedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? thursday(dynamic response) => (getJsonField(
        response,
        r'''$..[4].sub_schedules..full_schedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? friday(dynamic response) => (getJsonField(
        response,
        r'''$..[5].sub_schedules..full_schedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? saturday(dynamic response) => (getJsonField(
        response,
        r'''$..[6].sub_schedules..full_schedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? idSunday(dynamic response) => (getJsonField(
        response,
        r'''$..[0].sub_schedules..id_subschedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? idMonday(dynamic response) => (getJsonField(
        response,
        r'''$..[1].sub_schedules..id_subschedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? idTuesday(dynamic response) => (getJsonField(
        response,
        r'''$..[2].sub_schedules..id_subschedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? idWednesday(dynamic response) => (getJsonField(
        response,
        r'''$..[3].sub_schedules..id_subschedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? idThursday(dynamic response) => (getJsonField(
        response,
        r'''$..[4].sub_schedules..id_subschedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? idFriday(dynamic response) => (getJsonField(
        response,
        r'''$..[5].sub_schedules..id_subschedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? idSaturday(dynamic response) => (getJsonField(
        response,
        r'''$..[6].sub_schedules..id_subschedule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetWalletHistoryCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Wallet History',
      apiUrl: 'https://sbcareapi.sleepydev.net/wallet/transaction/history',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? formattedAmount(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nameTransaction(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].created_wallet_transaction''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? statusTransaction(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? invoice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].invoice_transaction''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? transactionType(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].transaction_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? feeTransaction(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].wallet_fee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? formattedFee(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_wallet_fee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? amountTransaction(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class UpdateScheduleSessionsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidCampaign = '',
    String? uuidSchedule = '',
    int? idSubschedule,
    bool? subscheduleStatus,
    String? subscheduleStarted = '',
    String? subscheduleEnded = '',
  }) async {
    final ffApiRequestBody = '''
{
  "subschedule_status": ${subscheduleStatus},
  "subschedule_started": ${subscheduleStarted == null ? 'null' : '"${subscheduleStarted}"'},
  "subschedule_ended": ${subscheduleEnded == null ? 'null' : '"${subscheduleEnded}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Schedule Sessions',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/services/${uuidCampaign}/schedules/${uuidSchedule}/subschedules/${idSubschedule}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class UpdateScheduleDayStatusCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidCampaign = '',
    String? uuidSchedule = '',
    bool? scheduleStatus,
  }) async {
    final ffApiRequestBody = '''
{
  "schedule_status": ${scheduleStatus}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Schedule Day Status',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/services/${uuidCampaign}/schedules/${uuidSchedule}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class UpdateServiceSettingCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidUserClass = '',
    String? campaignTitle = '',
    String? campaignStory = '',
    bool? campaignStatus,
    String? campaignTimezone = '',
    String? uuidUserAddress = '',
    int? userClassLimit,
    int? userClassPrice,
  }) async {
    final ffApiRequestBody = '''
{
  "campaign": {
    "campaign_title": ${campaignTitle == null ? 'null' : '"${campaignTitle}"'},
    "campaign_story": ${campaignStory == null ? 'null' : '"${campaignStory}"'},
    "campaign_status": ${campaignStatus},
    "campaign_timezone": ${campaignTimezone == null ? 'null' : '"${campaignTimezone}"'},
    "uuid_user_address": ${uuidUserAddress == null ? 'null' : '"${uuidUserAddress}"'}
  },
  "user_class": {
    "user_class_limit": ${userClassLimit},
    "user_class_price": ${userClassPrice}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Service Setting',
      apiUrl:
          'https://sbcareapi.sleepydev.net/provider/services/${uuidUserClass}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class RegisterWorkshopCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidProgramClass = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Register Workshop',
      apiUrl:
          'https://sbcareapi.sleepydev.net/user/program-workshops/${uuidProgramClass}/register',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserLearningCodeCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidUserClass = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User Learning Code',
      apiUrl:
          'https://sbcareapi.sleepydev.net/user/learning-module/${uuidUserClass}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uidUserLearning(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..uuid_user_learning''',
      ));
  static String? userLearningCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..user_learning_code''',
      ));
  static String? userLearningStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..user_learning_status''',
      ));
}

class UploadPhotoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? filename = '',
    int? fileSize,
  }) async {
    final ffApiRequestBody = '''
{
  "filename": ${filename == null ? 'null' : '"${escapeStringForJson(filename)}"'},
  "file_size": ${fileSize}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Upload Photo',
      apiUrl: 'https://sbcareapi.sleepydev.net/uploads',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class IncomeHistoryMitraCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidProvider = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Income History Mitra',
      apiUrl: 'https://sbcareapi.sleepydev.net/wallet/histories',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'uuid_provider': uuidProvider,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? nettoIncome(dynamic response) => (getJsonField(
        response,
        r'''$..outcome_to_provider''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? typeTransaction(dynamic response) => (getJsonField(
        response,
        r'''$..transaction_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$..created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? formattedIncome(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_outcome_to_provider''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? appointmentIncome(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.transaction_type == 'Appointment')]''',
        true,
      ) as List?;
  static List? moduleIncome(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.transaction_type == 'Module')]''',
        true,
      ) as List?;
  static List? onlineClassIncome(dynamic response) => getJsonField(
        response,
        r'''$..[?(@.transaction_type == 'Online-Class')]''',
        true,
      ) as List?;
  static List<String>? fullnameClient(dynamic response) => (getJsonField(
        response,
        r'''$..user_fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteAccountRequestCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Account Request',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/profile/account-deletion',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetListClientsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get List Clients',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/client',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidUser(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullnameUser(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].fullname_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetELearningModulesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get ELearning Modules',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/modul/elearning',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidModule(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_modul''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? moduleInfo(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].modul_info''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GenerateELearningCodeCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidModul = '',
    String? notes = '',
    int? maxRedemptions,
  }) async {
    final ffApiRequestBody = '''
{
  "uuid_modul": ${uuidModul == null ? 'null' : '"${escapeStringForJson(uuidModul)}"'},
  "notes": ${notes == null ? 'null' : '"${escapeStringForJson(notes)}"'},
  "max_redemptions": ${maxRedemptions}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate ELearning Code',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/activation_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GenerateEBookCodeCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uuidEbook = '',
    String? notes = '',
    int? maxRedemptions,
  }) async {
    final ffApiRequestBody = '''
{
  "uuid_ebook": ${uuidEbook == null ? 'null' : '"${escapeStringForJson(uuidEbook)}"'},
  "notes": ${notes == null ? 'null' : '"${escapeStringForJson(notes)}"'},
  "max_redemptions": ${maxRedemptions}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate EBook Code',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/activation_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GenerateSBPayCodeCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? notes = '',
    int? maxRedemptions,
    int? sbpayAmount,
  }) async {
    final ffApiRequestBody = '''
{
  "notes": ${notes == null ? 'null' : '"${escapeStringForJson(notes)}"'},
  "max_redemptions": ${maxRedemptions},
  "sbpay_amount": ${sbpayAmount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate SBPay Code',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/activation_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GenerateContractionProCodeCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? notes = '',
    int? maxRedemptions,
    String? uuidProFeature = '',
  }) async {
    final ffApiRequestBody = '''
{
  "notes": ${notes == null ? 'null' : '"${escapeStringForJson(notes)}"'},
  "max_redemptions": ${maxRedemptions},
  "uuid_pro_feature": ${uuidProFeature == null ? 'null' : '"${escapeStringForJson(uuidProFeature)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Contraction Pro Code',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/activation_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_type''',
      ));
  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetVoucherCodeHistoryCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Voucher Code History',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/activation_code',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? moduleTitle(dynamic response) => (getJsonField(
        response,
        r'''$..modul_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modulePrice(dynamic response) => (getJsonField(
        response,
        r'''$..modul_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? code(dynamic response) => (getJsonField(
        response,
        r'''$..code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$..status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? notes(dynamic response) => (getJsonField(
        response,
        r'''$..notes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? redeemers(dynamic response) => getJsonField(
        response,
        r'''$..redeemers''',
        true,
      ) as List?;
  static List<String>? fullnameRedeemers(dynamic response) => (getJsonField(
        response,
        r'''$..redeemers..fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? redeemedAt(dynamic response) => (getJsonField(
        response,
        r'''$..redeemers..redeemed_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? eLearningHistory(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.activation_code_type == 'E-Learning')]''',
        true,
      ) as List?;
  static List? sbpayHistory(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.activation_code_type == 'SBPay')]''',
        true,
      ) as List?;
  static List? eBookHistory(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.activation_code_type == 'E-Book')]''',
        true,
      ) as List?;
  static List? contractionHistory(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.activation_code_type == 'Contraction Pro')]''',
        true,
      ) as List?;
  static List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? contractionName(dynamic response) => (getJsonField(
        response,
        r'''$..pro_feature_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ebookTitle(dynamic response) => (getJsonField(
        response,
        r'''$..ebook_title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ebookPrice(dynamic response) => (getJsonField(
        response,
        r'''$..ebook_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sbpayAmount(dynamic response) => (getJsonField(
        response,
        r'''$..formatted_sbpay_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contractionPrice(dynamic response) => (getJsonField(
        response,
        r'''$..pro_feature_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? codeType(dynamic response) => (getJsonField(
        response,
        r'''$..activation_code_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetOwnedEbookListCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Owned Ebook List',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/ebook',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidUserEbook(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_user_ebook''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? uidEbook(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_ebook''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expiredAt(dynamic response) => (getJsonField(
        response,
        r'''$..expired_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$..status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ebookCover(dynamic response) => (getJsonField(
        response,
        r'''$..ebook.cover''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ebookTitle(dynamic response) => (getJsonField(
        response,
        r'''$..ebook.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ebookDescription(dynamic response) => (getJsonField(
        response,
        r'''$..ebook.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchOwnedEbookListCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? keyword = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Owned Ebook List',
      apiUrl: 'https://sbcareapi.sleepydev.net/user/ebook',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidUserEbook(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_user_ebook''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? uidEbook(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid_ebook''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? formattedPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formatted_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expiredAt(dynamic response) => (getJsonField(
        response,
        r'''$..expired_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$..status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ebookCover(dynamic response) => (getJsonField(
        response,
        r'''$..ebook.cover''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ebookTitle(dynamic response) => (getJsonField(
        response,
        r'''$..ebook.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ebookDescription(dynamic response) => (getJsonField(
        response,
        r'''$..ebook.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AdvanceSearchMitraCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? keyword = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Advance Search Mitra',
      apiUrl: 'https://sbcareapi.sleepydev.net/search/mitra',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$..avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullname(dynamic response) => (getJsonField(
        response,
        r'''$..fullname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? email(dynamic response) => (getJsonField(
        response,
        r'''$..email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phone(dynamic response) => (getJsonField(
        response,
        r'''$..phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? uidUser(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$..address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetEbookTitlesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Ebook Titles',
      apiUrl: 'https://sbcareapi.sleepydev.net/provider/ebook',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? uidEbook(dynamic response) => (getJsonField(
        response,
        r'''$..uuid_ebook''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$..title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  final encoded = jsonEncode(input);
  return encoded.substring(1, encoded.length - 1);
}
