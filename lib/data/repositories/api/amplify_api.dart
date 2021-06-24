import 'dart:convert';
import 'dart:typed_data';
// ignore: import_of_legacy_library_into_null_safe
import 'package:amplify_api/amplify_api.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:amplify_flutter/amplify.dart';
import 'package:componente_prestamo/domain/repositiries/abstract_api.dart';

class AmplifyApi extends AbstractApiRepository {

  @override
  Future<Map<String, dynamic>> get({required String url, Map<String, String>? queryParams, Map<String, String>? headers}) async {
    try {
      RestOptions options = RestOptions(
          path: url,
          // queryParameters: queryParams,
          // headers: headers
      );
      RestOperation restOperation = Amplify.API.get(
          restOptions: options
      );
      RestResponse response = await restOperation.response;
      return jsonDecode(new String.fromCharCodes(response.data));
    } on ApiException catch (e) {
      throw("[ERROR] Error doing get request, e: " + e.message);
    }
  }

  @override
  Future<Map<String, dynamic>> post({required String url, dynamic body, Map<String, String>? headers}) async {
    try {
      RestOptions options = RestOptions(
          path: url,
          // headers: headers,
          body: Uint8List.fromList(jsonEncode(body).codeUnits)
      );
      RestOperation restOperation = Amplify.API.post(
          restOptions: options
      );
      RestResponse response = await restOperation.response;
      return jsonDecode(new String.fromCharCodes(response.data));
    } on ApiException catch (e) {
      throw("[ERROR] Error doing post request, e: " + e.message);
    }
  }

}
