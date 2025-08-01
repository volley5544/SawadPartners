import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start TestSpringApi Group Code

class TestSpringApiGroup {
  static String getBaseUrl() => 'https://5c5f-223-27-201-20.ngrok-free.app';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetEmployeeCall getEmployeeCall = GetEmployeeCall();
  static GetSingleEmployeeCall getSingleEmployeeCall = GetSingleEmployeeCall();
  static AddEmployeeCall addEmployeeCall = AddEmployeeCall();
  static UpdateEmployeeCall updateEmployeeCall = UpdateEmployeeCall();
}

class GetEmployeeCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TestSpringApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getEmployee',
      apiUrl: '${baseUrl}/api/employees',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
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

class GetSingleEmployeeCall {
  Future<ApiCallResponse> call({
    String? employeeId = '',
  }) async {
    final baseUrl = TestSpringApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "employeeId": "${employeeId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getSingleEmployee',
      apiUrl: '${baseUrl}/api/employees/${employeeId}',
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

class AddEmployeeCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
  }) async {
    final baseUrl = TestSpringApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "firstName": "${firstName}",
  "lastName": "${lastName}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addEmployee',
      apiUrl: '${baseUrl}/api/employees/add-employee',
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

class UpdateEmployeeCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? id = '',
  }) async {
    final baseUrl = TestSpringApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "firstName": "${firstName}",
  "lastName": "${lastName}",
  "email": "${email}",
  "id": "${id}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateEmployee',
      apiUrl: '${baseUrl}/api/employees/update',
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

/// End TestSpringApi Group Code

class GetLeadDetailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadDetailAPI',
      apiUrl: '${apiUrl}/api/lead/getlead',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
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

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.DataLeadInfo.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataLeadInfo.message''',
      ));
  static String? level(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.DataLeadInfo.level''',
      ));
  static List<String>? leadID(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstName(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatus(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].call_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? createDate(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contractStatus(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].StatusContract''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? contractDate(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].contract_date''',
        true,
      ) as List?;
  static List<String>? callStatusDetail(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].statusCallOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carVehicleName(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].car_vehicle_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? amountRequest(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].amount_request''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leadChannel(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].channel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leadChannelCode(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].lead_system''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? branchCode(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].branch_code''',
        true,
      ) as List?;
  static List? employeeID(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].employee_id''',
        true,
      ) as List?;
}

class AuthenAPICall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? apiUrl = '',
    String? fcmToken = '',
    String? uid = '',
    String? check = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "password": "${password}",
  "api_url": "${apiUrl}",
  "fcm_token": "${fcmToken}",
  "uid": "${uid}",
  "check": "${check}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'authenAPI',
      apiUrl: '${apiUrl}/api/login',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
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

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.user.employee_id''',
      );
  static dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.user.mobile_phone''',
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.user.position''',
      );
  static dynamic level(dynamic response) => getJsonField(
        response,
        r'''$.user.level''',
      );
}

class AuthenAPINewCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? username = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "username": "${username}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'authenAPINew',
      apiUrl: '${apiUrl}/ssw_partner/public/api/login',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': '7a94c811-7499-4d17-aaab-6a0e7c7991cf',
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

  static String? accessToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  static int? apiKey(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.id''',
      ));
  static String? agentCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.agent_code''',
      ));
  static String? passwordChange(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.password_change''',
      ));
  static String? currentPassword(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.string_password''',
      ));
  static String? agentName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.agent_name_th''',
      ));
}

class GetLeadAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? apiKey = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "api_key": "${apiKey}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadAPI',
      apiUrl: '${apiUrl}/ssw_partner/public/api/partner-thailand-post/showlead',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': '${apiKey}',
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

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusInfo.responseCode''',
      ));
  static List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].fullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leadID(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].leadID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? loanType(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].loanType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? loanAmount(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].loanAmount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].empCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dateStamp(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].dateStamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusInfo.responseMessage''',
      ));
  static List<String>? statusLead(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].statusLead''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatus(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].callStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstName(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].firstName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].mobileNumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? reasonID(dynamic response) => getJsonField(
        response,
        r'''$.statusInfo.responseData[:].reasonID''',
        true,
      ) as List?;
  static List? reasonCode(dynamic response) => getJsonField(
        response,
        r'''$.statusInfo.responseData[:].reasonCode''',
        true,
      ) as List?;
}

class ChangePasswordPartnerAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? apiKey = '',
    String? token = '',
    String? currentPassword = '',
    String? newPassword = '',
    String? confirmPassword = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "api_key": "${apiKey}",
  "token": "${token}",
  "current_password": "${currentPassword}",
  "new_password": "${newPassword}",
  "confirm_password": "${confirmPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangePasswordPartnerAPI',
      apiUrl: '${apiUrl}/ssw_partner/public/api/partner-change-password',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': '${apiKey}',
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

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.meassage''',
      );
}

class ShowPinpointAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? apiKey = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "api_key": "${apiKey}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ShowPinpointAPI',
      apiUrl:
          '${apiUrl}/ssw_partner/public/api/partner-thailand-post/show-pinpoint',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': '${apiKey}',
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

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusInfo.responseCode''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusInfo.responseMessage''',
      ));
  static List<String>? statusPinpoint(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].StatusPinPoint''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? surveyor(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].Surveyor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carcolor(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].Color''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carBrand(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].CarBrand''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phone(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].Telephone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? zipcode(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].ZipCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? province(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].Province''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? district(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].District''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].Address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? costomerName(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].CustomerName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? thaiID1(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].ThaiID_1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? thaiID2(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].ThaiID_2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contract(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].Contract''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? refID(dynamic response) => (getJsonField(
        response,
        r'''$.statusInfo.responseData[:].refID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? responseData(dynamic response) => getJsonField(
        response,
        r'''$.statusInfo.responseData''',
        true,
      ) as List?;
  static dynamic statusInfo(dynamic response) => getJsonField(
        response,
        r'''$.statusInfo''',
      );
}

class SavePinpointAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? apiKey = '',
    String? token = '',
    String? id = '',
    String? contractNo = '',
    String? customerName = '',
    String? address = '',
    String? district = '',
    String? province = '',
    String? postCode = '',
    String? phoneNumber = '',
    String? brand = '',
    String? color = '',
    String? statusId = '',
    String? statusName = '',
    String? reasonId = '',
    String? reasonName = '',
    String? remarkReason = '',
    String? locationSeeId = '',
    String? locationSeeName = '',
    String? lat = '',
    String? long = '',
    String? remarkOther = '',
    String? urlImg = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "api_key": "${apiKey}",
  "token": "${token}",
  "id": "${id}",
  "contract_no": "${contractNo}",
  "customer_name": "${customerName}",
  "address": "${address}",
  "district": "${district}",
  "province": "${province}",
  "post_code": "${postCode}",
  "phone_number": "${phoneNumber}",
  "brand": "${brand}",
  "color": "${color}",
  "status_id": "${statusId}",
  "status_name": "${statusName}",
  "reason_id": "${reasonId}",
  "reason_name": "${reasonName}",
  "remark_reason": "${remarkReason}",
  "location_see_id": "${locationSeeId}",
  "location_see_name": "${locationSeeName}",
  "lat": "${lat}",
  "long": "${long}",
  "remark_other": "${remarkOther}",
  "url_img": "${urlImg}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SavePinpointAPI',
      apiUrl:
          '${apiUrl}/ssw_partner/public/api/partner-thailand-post/save-pinpoint',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': '${apiKey}',
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

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusInfo.responseCode''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusInfo.responseMessage''',
      ));
  static List? responseData(dynamic response) => getJsonField(
        response,
        r'''$.statusInfo.responseData''',
        true,
      ) as List?;
  static dynamic statusInfo(dynamic response) => getJsonField(
        response,
        r'''$.statusInfo''',
      );
  static dynamic contractNo(dynamic response) => getJsonField(
        response,
        r'''$.statusInfo.responseData.contractNo''',
      );
  static dynamic refID(dynamic response) => getJsonField(
        response,
        r'''$.statusInfo.responseData.refID''',
      );
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
  if (item is DocumentReference) {
    return item.path;
  }
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
