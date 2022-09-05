
class CategorieModel {
  int? idCategorie;
  late String nomCategorie;

  CategorieModel({this.idCategorie, required this.nomCategorie});

  Map<String, dynamic> toMap() {
    return {'idCategorie': idCategorie, 'nomCategorie': nomCategorie};
  }

  factory CategorieModel.fromMap(Map<String, dynamic> map) => CategorieModel(idCategorie: map['idCategorie'], nomCategorie: map['nomCategorie']);
}
