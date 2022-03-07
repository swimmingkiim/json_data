library json_data;

import 'dart:convert';

class JsonData {
  JsonData();

  static dynamic _convertValue(dynamic value,
      {bool wrapStringWithDoubleQuote = true}) {
    if (value is String) {
      if (wrapStringWithDoubleQuote) {
        if (value.startsWith('"') && value.endsWith('"')) {
          return value;
        } else {
          return '"$value"';
        }
      } else {
        if (value.startsWith('"') && value.endsWith('"')) {
          return value.substring(1, value.length);
        } else {
          return value.toString();
        }
      }
    } else if (value is List) {
      return _toJsonArray(value,
          wrapStringWithDoubleQuote: wrapStringWithDoubleQuote);
    } else if (value is Map) {
      return _toJson(value,
          wrapStringWithDoubleQuote: wrapStringWithDoubleQuote);
    } else if (value is bool) {
      return value;
    } else if (value == null) {
      return null;
    }
    return value;
  }

  static _toJson(Map<dynamic, dynamic> data,
      {bool wrapStringWithDoubleQuote = false}) {
    return data.map((key, value) => MapEntry(
        _convertValue(key,
            wrapStringWithDoubleQuote: wrapStringWithDoubleQuote),
        _convertValue(value,
            wrapStringWithDoubleQuote: wrapStringWithDoubleQuote)));
  }

  static String toJsonString(Map<String, Object?> data,
      {bool wrapStringWithDoubleQuote = true}) {
    return data
        .map((key, value) => MapEntry(
            _convertValue(key,
                wrapStringWithDoubleQuote: wrapStringWithDoubleQuote),
            _convertValue(value,
                wrapStringWithDoubleQuote: wrapStringWithDoubleQuote)))
        .toString();
  }

  static _toJsonArray(List<dynamic> dataList,
      {bool wrapStringWithDoubleQuote = false}) {
    return dataList
        .map((data) => _convertValue(data,
            wrapStringWithDoubleQuote: wrapStringWithDoubleQuote))
        .toList();
  }

  static String toJsonArrayString(List<dynamic> dataList,
      {bool wrapStringWithDoubleQuote = true}) {
    return dataList
        .map((data) => _convertValue(data,
            wrapStringWithDoubleQuote: wrapStringWithDoubleQuote))
        .toList()
        .toString();
  }

  static Map<String, dynamic> fromJsonString(String source) {
    var result = jsonDecode(source) as Map<String, dynamic>;
    for (var key in result.keys) {
      if (result[key] is String) {
        if (result[key].toString().startsWith('[') &&
            result[key].toString().endsWith(']')) {
          result[key] = JsonData.fromJsonArrayString(result[key].toString());
        } else if (result[key].toString().startsWith('{') &&
            result[key].toString().endsWith('}')) {
          result[key] = JsonData.fromJsonString(result[key]);
        } else {
          result[key] = JsonData._convertValue(result[key],
              wrapStringWithDoubleQuote: false);
        }
      } else {
        result[key] = JsonData._convertValue(result[key],
            wrapStringWithDoubleQuote: false);
      }
    }
    return Map<String, dynamic>.from(result);
  }

  static List<dynamic> fromJsonArrayString(String source) {
    var result = jsonDecode(source) as List<dynamic>;
    for (var i = 0; i < result.length; i++) {
      if (result[i] is String) {
        if (result[i].toString().startsWith('[') &&
            result[i].toString().endsWith(']')) {
          result[i] = JsonData.fromJsonArrayString(result[i].toString());
        } else if (result[i].toString().startsWith('{') &&
            result[i].toString().endsWith('}')) {
          result[i] = JsonData.fromJsonString(result[i].toString());
        } else {
          result[i] = JsonData._convertValue(result[i],
              wrapStringWithDoubleQuote: false);
        }
      } else {
        result[i] =
            JsonData._convertValue(result[i], wrapStringWithDoubleQuote: false);
      }
    }
    return List<dynamic>.from(result);
  }
}
