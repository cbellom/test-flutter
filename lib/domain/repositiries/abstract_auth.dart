import 'package:componente_prestamo/domain/entities/user.dart';

abstract class AbstractAuthRepository {
  Future<bool> checkAuthenticated();

  Future<User> getCurrentUser();

  Future<User> doLogin({required String username, required String password});

  Future<void> doLogout();

}