class ProduitModel {
  late int idProduit;
  late String nomProduit;
  late int qteProduit;
  late int prixProduit;
  late int categorieProduit;
  late int typeProduit;

  ProduitModel(this.idProduit, this.nomProduit, this.qteProduit,
      this.prixProduit, this.categorieProduit, this.typeProduit);

  Map<String, dynamic> toMap() {
    return {
      'idProduit': idProduit,
      'nomProduit': nomProduit,
      'qteProduit': qteProduit,
      'prixProduit': prixProduit,
      'categorieProduit': categorieProduit,
      'typeProduit': typeProduit,
    };
  }

  factory ProduitModel.fromMap(Map<String, dynamic> map) => ProduitModel(
      map['idProduit'],
      map['nomProduit'],
      map['qteProduit'],
      map['prixProduit'],
      map['categorieProduit'],
      map['typeProduit']);
}
