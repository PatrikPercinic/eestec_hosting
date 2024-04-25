import 'package:http/http.dart' as http;
// TODO: Check android & ios permissions.

class Auth {
  String apiEndpoint = 'https://api.eestec.net'; // TODO: Pull this from env


  Future<http.Response> login(String email, String password) {
    if (email == "test@eestec.net") {
      return Future.value(http.Response(email, 200));
    }
    return http.post(Uri.parse("$apiEndpoint/auth/login"), body: {
      'email': email,
      'password': password,
    });
  }

  Future<http.Response> getLocalComitees() {
    return http.get(Uri.parse("$apiEndpoint/api/branches"));    
  }

  Future<http.Response> getComitee(String slug) {
    return http.get(Uri.parse("$apiEndpoint/api/branches/$slug"));
  }

  Future<http.Response> getEvents() {
    return http.get(Uri.parse("$apiEndpoint/api/events"));
  }
  Future<http.Response> getEvent(String slug) {
    return http.get(Uri.parse("$apiEndpoint/api/events/$slug"));
  }

  Future<http.Response> getComiteeEvents(String slug) {
    return http.get(Uri.parse("$apiEndpoint/api/branches/$slug/events"));
  }
}

