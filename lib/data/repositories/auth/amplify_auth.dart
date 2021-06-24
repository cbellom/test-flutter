// ignore: import_of_legacy_library_into_null_safe
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:amplify_flutter/amplify.dart';
import 'package:componente_prestamo/domain/entities/user.dart';
import 'package:componente_prestamo/domain/repositiries/abstract_auth.dart';

class AmplifyAuth extends AbstractAuthRepository {

  @override
  Future<bool> checkAuthenticated() async {
    try {
      var res = await Amplify.Auth.fetchAuthSession();
      return res.isSignedIn;
    } on AuthException catch (e) {
      return false;
    }
  }

  @override
  Future<User> getCurrentUser() async {
    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      res.forEach((element) {
        print('key: ${element.userAttributeKey}; value: ${element.value}');
      });
      return User.fromAmplifyUserAttributes(res);
    } on AuthException catch (e) {
      throw("[ERROR] Cant get current user, e:" + e.message);
    }
  }

  @override
  Future<User> doLogin({required String username, required String password}) async {
    try {
      await Amplify.Auth.signIn(
        username: username,
        password: password,
      );
      var user = await getCurrentUser();
      if(user != null) {
        return user;
      } else {
        throw("[ERROR] Cant get current user on singin");
      }
    } on AuthException catch (e) {
      print(e.message);
      throw("[ERROR] Cant do login, e:" + e.message);
    }
  }

  @override
  Future<void> doLogout() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
      throw("[ERROR] Cant do logout, e:" + e.message);
    }
  }

}
