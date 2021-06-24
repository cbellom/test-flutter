import 'package:injector/injector.dart';
import 'package:componente_prestamo/domain/blocs/channel_bloc.dart';
import 'package:componente_prestamo/domain/blocs/loan_bloc.dart';
import 'package:componente_prestamo/domain/blocs/user_bloc.dart';
import 'package:componente_prestamo/domain/repositiries/abstract_api.dart';
import 'package:componente_prestamo/domain/repositiries/abstract_auth.dart';
import 'package:componente_prestamo/domain/services/abstract_channel.dart';

class BlocRegister {
  final injector = Injector.appInstance;

  BlocRegister(){
    injector.registerSingleton<ChannelBloc>(() {
      return ChannelBloc(
        injector.get<AbstractChannelService>(),
      );
    });

    injector.registerSingleton<LoanBloc>(() {
      return LoanBloc(
        injector.get<AbstractApiRepository>(),
      );
    });

    injector.registerSingleton<UserBloc>(() {
      return UserBloc(
        injector.get<AbstractAuthRepository>(),
        injector.get<AbstractApiRepository>(),
      );
    });
  }
}