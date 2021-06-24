import 'package:componente_prestamo/domain/entities/loan.dart';
import 'package:componente_prestamo/domain/repositiries/abstract_api.dart';

class LoanBloc {
  final AbstractApiRepository apiRepository;

  LoanBloc(this.apiRepository);

  Future<Loan> getLoanStatus(String userId) async {
    // TODO: implement get Loan
    var response = await apiRepository.get(url: "/ahorro/version");
    return Loan.fromJson(response);
  }

  Future<Loan> registerLoan(Loan loan) async {
    // TODO: implement register Loan
    var response = await apiRepository.post(
        url: "/ahorro/version",
        body: loan
    );
    return Loan.fromJson(response);
  }
}