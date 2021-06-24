import 'package:componente_prestamo/domain/services/abstract_channel.dart';

class ChannelBloc {
  final AbstractChannelService channelRespository;

  ChannelBloc(this.channelRespository);

  void sendMessage({required String event, required Object data }) {
    channelRespository.sendMessage(event: event, data: data);
  }
}

//sendMessage("SUCCESS")

//sendMessage("ERROR")