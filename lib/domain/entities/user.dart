import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class User {
  String? cognitoSub;
  String? id;
  String? email;
  String? phone;
  String? name;
  String? lastname;
  bool confirmed = false;
  bool hasAccess = false;

  User({
    this.cognitoSub,
    this.id,
    this.email,
    this.phone,
    this.name,
    this.lastname,
  });

  /// Decode user from API JSON
  factory User.fromJson(Map<String, dynamic> json) => User(
      cognitoSub: json["idAutenticacion"],
      id: json["id"],
      email: json["email"],
      phone: json["celular"],
      name: json["nombres"],
      lastname: json["apellidos"]);

  /// Decode user from Amplify Auth
  factory User.fromAmplifyUserAttributes(List<AuthUserAttribute> attributes) {
    final user = User();
    attributes.forEach((attribute) {
      if (attribute.userAttributeKey == 'email') {
        user.email = attribute.value;
      } else if (attribute.userAttributeKey == 'name') {
        user.name = attribute.value;
      }
    });
    return user;
  }

  Map<String, dynamic> toJson() => {
        "cognitoSub": cognitoSub,
        "id": id,
        "email": email,
        "phone": phone,
        "name": name,
        "lastname": lastname,
      };

}
