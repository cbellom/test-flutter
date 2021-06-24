import 'package:componente_prestamo/domain/entities/user.dart';
import 'package:componente_prestamo/domain/repositiries/abstract_api.dart';
import 'package:componente_prestamo/domain/repositiries/abstract_auth.dart';

class UserBloc {
  final AbstractAuthRepository authRepository;
  final AbstractApiRepository apiRepository;

  UserBloc(this.authRepository, this.apiRepository);

  Future<User> doLogin({required String username, required String password }) {
    return authRepository.doLogin(username: username, password: password);
  }

  void doLogout() {
    authRepository.doLogout();
  }
}