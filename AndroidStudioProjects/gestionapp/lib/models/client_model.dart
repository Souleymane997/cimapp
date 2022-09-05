class ClientModel {
  int? idClient;
  late String nomClient;
  late String phoneClient;
  late String adresseClient;

  ClientModel(
      {this.idClient,
      required this.nomClient,
      required this.phoneClient,
      required this.adresseClient});

  Map<String, dynamic> toMap() {
    return {
      'idClient': idClient,
      'nomClient': nomClient,
      'phoneClient': phoneClient,
      'adresseClient': adresseClient
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) => ClientModel(
        idClient: map['idClient'],
        nomClient: map['nomClient'],
        phoneClient: map['phoneClient'],
        adresseClient: map['adresseClient'],
      );
}
