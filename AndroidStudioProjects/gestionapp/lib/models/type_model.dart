
class TypeModel {
  int? idType;
  late String nomType;

  TypeModel({this.idType, required this.nomType});

  Map<String, dynamic> toMap() {
    return {'idType': idType, 'nomType': nomType};
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) =>
      TypeModel( idType : map['idType'], nomType: map['nomType']);
}
