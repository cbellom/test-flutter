import 'package:injector/injector.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:componente_prestamo/data/repositories/api/amplify_api.dart';
import 'package:componente_prestamo/data/repositories/api/apigw_api.dart';
import 'package:componente_prestamo/data/repositories/auth/amplify_auth.dart';
import 'package:componente_prestamo/data/repositories/auth/cognito_auth.dart';
import 'package:componente_prestamo/domain/repositiries/abstract_api.dart';
import 'package:componente_prestamo/domain/repositiries/abstract_auth.dart';

class RepositoryRegister {
  final injector = Injector.appInstance;

  RepositoryRegister() {
    injector.registerDependency<CognitoAuth>(() {
      return CognitoAuth();
    });

    injector.registerSingleton<AbstractApiRepository>(() {
      if (kIsWeb) {
        return ApigwApi();
      } else {
        return AmplifyApi();
      }
    });

    injector.registerSingleton<AbstractAuthRepository>(() {
      if (kIsWeb) {
        return CognitoAuth();
      } else {
        return AmplifyAuth();
      }
    });
  }
}