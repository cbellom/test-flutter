import 'package:componente_prestamo/domain/repositiries/abstract_api.dart';

class ApigwApi extends AbstractApiRepository {
  @override
  Future<Map<String, dynamic>> get({required String url, Map<String, String>? queryParams, Map<String, String>? headers}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> post({required String url, body, Map<String, String>? headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }

}
