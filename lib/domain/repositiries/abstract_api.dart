abstract class AbstractApiRepository {

  Future<Map<String, dynamic>> get({required String url, Map<String, String> queryParams, Map<String, String> headers});

  Future<Map<String, dynamic>> post({ required String url, required dynamic body, Map<String, String> headers});

}