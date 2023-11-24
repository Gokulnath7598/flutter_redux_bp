import 'package:flutter_redux_bp/data/api/api_client.dart';

class ApiRoutes {
  static const ApiConfig apiConfig = ApiConfig(
    scheme: 'https',
    host: 'api.uat.finobuddy.com',
    scope: scope,
  );

  //Scope
  static const String debugScope = '';
  static const String scope = '/api/v1';
}
