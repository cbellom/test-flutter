import 'package:componente_prestamo/domain/services/abstract_channel.dart';

class WebChannel extends AbstractChannelService {

  @override
  void sendMessage({required String event, required Object data}) {
    throw UnimplementedError();
  }

}
