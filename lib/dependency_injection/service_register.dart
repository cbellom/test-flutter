import 'package:injector/injector.dart';
import 'package:componente_prestamo/data/services/mobile_channel.dart';
import 'package:componente_prestamo/data/services/web_channel.dart';
import 'package:componente_prestamo/domain/services/abstract_channel.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ServiceRegister {
  final injector = Injector.appInstance;

  ServiceRegister() {
    injector.registerDependency<AbstractChannelService>(() {
      if (kIsWeb) {
        return WebChannel();
      } else {
        return MobileChannel();
      }
    });
  }
}