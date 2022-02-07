library app_lovepeople.globals;

import 'dart:io';

class Globals {
  static String token = '';

  static Map<String, String> headerWithToken = {
    HttpHeaders.authorizationHeader: 'Bearer $token',
  };
}
