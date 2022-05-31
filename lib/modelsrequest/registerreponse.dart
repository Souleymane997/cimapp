import 'dart:convert';

RegisterResponseModel registerResponseJson(String str ) =>
    RegisterResponseModel.fromJson(json.decode(str));


class RegisterResponseModel {
  String? nom;
  String? prenom;
  String? email;
  String? pass;

  RegisterResponseModel({this.nom, this.prenom, this.email, this.pass});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['email'] = email;
    data['pass'] = pass;
    return data;
  }
}