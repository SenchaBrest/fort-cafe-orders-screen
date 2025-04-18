import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetCompletedOrdersCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'get completed orders',
      apiUrl:
          'https://jlmloumyvhgookwojsvq.supabase.co/rest/v1/orders?select=number,name,surname&status=eq.completed&order=created_at.asc',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsbWxvdW15dmhnb29rd29qc3ZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2MTgwNDQsImV4cCI6MjA1MDE5NDA0NH0.QO27Ta13r2-vN-87LVKYzqs4JwHYgI9SA_cDfWss5vo',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsbWxvdW15dmhnb29rd29qc3ZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2MTgwNDQsImV4cCI6MjA1MDE5NDA0NH0.QO27Ta13r2-vN-87LVKYzqs4JwHYgI9SA_cDfWss5vo',
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

class GetOrdersInProgreeAndPendingCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'get orders in progree and pending',
      apiUrl:
          'https://jlmloumyvhgookwojsvq.supabase.co/rest/v1/orders?select=number,name,surname&status=in.(pending,inProgress)&order=created_at.asc',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsbWxvdW15dmhnb29rd29qc3ZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2MTgwNDQsImV4cCI6MjA1MDE5NDA0NH0.QO27Ta13r2-vN-87LVKYzqs4JwHYgI9SA_cDfWss5vo',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsbWxvdW15dmhnb29rd29qc3ZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2MTgwNDQsImV4cCI6MjA1MDE5NDA0NH0.QO27Ta13r2-vN-87LVKYzqs4JwHYgI9SA_cDfWss5vo',
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
