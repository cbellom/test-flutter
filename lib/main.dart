// @dart=2.9
import 'dart:convert';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dependency_injection/bloc_register.dart';
import 'dependency_injection/repository_register.dart';
import 'dependency_injection/service_register.dart';
import 'ui/pages/form_solicitud.dart';
import 'amplifyconfiguration.dart';

void main() async {
  //await dotenv.load(fileName: ".env");
  ServiceRegister();
  RepositoryRegister();
  BlocRegister();
  await configureAmplify();
  runApp(MyApp());
}

Future<void> configureAmplify() async {
  var jsonC = jsonDecode(amplifyconfig);
  print(jsonC);
  Amplify.addPlugins([AmplifyAuthCognito(), AmplifyAPI()]);
  try {
    // var configAmplifyDotEnv = dotenv.env['APP_AMPLIFY_CONFIG'];
    // var configAmplify = configAmplifyDotEnv != null ? configAmplifyDotEnv : localAmplifyConfig;
    await Amplify.configure(amplifyconfig);
  } catch (e) {
    print("[Error] Cant configure amplify, e:" + e.toString());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiip',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: 'Bariol',
      ),
      home: FormSolicitud(),
    );
  }
}
