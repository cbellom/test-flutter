enum StatusLoan {
  EnProceso,
  Completado
}

class Loan {
  String userId;
  double amount;
  StatusLoan status;

  Loan({
    required this.userId,
    required this.amount,
    required this.status
  });

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
    userId: json["idUsuario"],
    amount: json["monto"],
    status: StatusLoan.values.elementAt(json['estado'])
  );

  Map<String, dynamic> toJson() => {
    "idUsuario": userId,
    "monto": amount,
    "estado": status
  };
}