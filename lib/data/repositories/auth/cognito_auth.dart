
import 'package:componente_prestamo/domain/entities/user.dart';
import 'package:componente_prestamo/domain/repositiries/abstract_auth.dart';

class CognitoAuth extends AbstractAuthRepository {
  @override
  Future<bool> checkAuthenticated() {
    // TODO: implement checkAuthenticated
    throw UnimplementedError();
  }

  @override
  Future<User> doLogin({required String username, required String password}) {
    // TODO: implement doLogin
    throw UnimplementedError();
  }

  @override
  Future<void> doLogout() {
    // TODO: implement doLogout
    throw UnimplementedError();
  }

  @override
  Future<User> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
