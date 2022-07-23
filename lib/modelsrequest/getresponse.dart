//* infos user coonected
class GetLoginReponse {
  int? codeCompteagent;
  String? identifiant;
  String? motDePasse;
  int? codeAgent;
  String? flagActif;
  String? flagMission;
  String? grade;
  String? matricule;
  String? genre;
  String? nomPrenom;
  int? codeStructure;
  int? codeTypeagent;

  GetLoginReponse(
      {this.codeCompteagent,
      this.identifiant,
      this.motDePasse,
      this.codeAgent,
      this.flagActif,
      this.flagMission,
      this.grade,
      this.matricule,
      this.genre,
      this.nomPrenom,
      this.codeStructure,
      this.codeTypeagent});

  GetLoginReponse.fromJson(Map<String, dynamic> json) {
    codeCompteagent = json['code_compteagent'];
    identifiant = json['identifiant'];
    motDePasse = json['mot_de_passe'];
    codeAgent = json['code_agent'];
    flagActif = json['flag_actif'];
    flagMission = json['flag_mission'];
    grade = json['grade'];
    matricule = json['matricule'];
    genre = json['genre'];
    nomPrenom = json['nom_prenom'];
    codeStructure = json['code_structure'];
    codeTypeagent = json['code_typeagent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code_compteagent'] = codeCompteagent;
    data['identifiant'] = identifiant;
    data['mot_de_passe'] = motDePasse;
    data['code_agent'] = codeAgent;
    data['flag_actif'] = flagActif;
    data['flag_mission'] = flagMission;
    data['grade'] = grade;
    data['matricule'] = matricule;
    data['genre'] = genre;
    data['nom_prenom'] = nomPrenom;
    data['code_structure'] = codeStructure;
    data['code_typeagent'] = codeTypeagent;
    return data;
  }
}

//* mission format element

class GetMissionUser {
  int? numMission;
  String? dateDepartPrevue;
  String? dateRetourPrevue;
  String? descriptionMission;
  int? dureeMission;
  String? objetMission;
  String? nomPrenom;
  String? matricule;
  String? libelleStructure;
  String? adresse;
  String? sigleStructure;
  String? siteWeb;
  String? email;
  String? telephone;
  String? libelleEtat;
  String? libelleTypeMission;
  String? libelleMotifMission;
  String? libelleType;

  GetMissionUser(
      {this.numMission,
      this.dateDepartPrevue,
      this.dateRetourPrevue,
      this.descriptionMission,
      this.dureeMission,
      this.objetMission,
      this.nomPrenom,
      this.matricule,
      this.libelleStructure,
      this.adresse,
      this.sigleStructure,
      this.siteWeb,
      this.email,
      this.telephone,
      this.libelleEtat,
      this.libelleTypeMission,
      this.libelleMotifMission,
      this.libelleType});

  GetMissionUser.fromJson(Map<String, dynamic> json) {
    numMission = json['num_mission'];
    dateDepartPrevue = json['date_depart_prevue'];
    dateRetourPrevue = json['date_retour_prevue'];
    descriptionMission = json['description_mission'];
    dureeMission = json['duree_mission'];
    objetMission = json['objet_mission'];
    nomPrenom = json['nom_prenom'];
    matricule = json['matricule'];
    libelleStructure = json['libelle_structure'];
    adresse = json['adresse'];
    sigleStructure = json['sigle_structure'];
    siteWeb = json['site_web'];
    email = json['email'];
    telephone = json['telephone'];
    libelleEtat = json['libelle_etat'];
    libelleTypeMission = json['libelle_type_mission'];
    libelleMotifMission = json['libelle_motif_mission'];
    libelleType = json['libelle_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num_mission'] = numMission;
    data['date_depart_prevue'] = dateDepartPrevue;
    data['date_retour_prevue'] = dateRetourPrevue;
    data['description_mission'] = descriptionMission;
    data['duree_mission'] = dureeMission;
    data['objet_mission'] = objetMission;
    data['nom_prenom'] = nomPrenom;
    data['matricule'] = matricule;
    data['libelle_structure'] = libelleStructure;
    data['adresse'] = adresse;
    data['sigle_structure'] = sigleStructure;
    data['site_web'] = siteWeb;
    data['email'] = email;
    data['telephone'] = telephone;
    data['libelle_etat'] = libelleEtat;
    data['libelle_type_mission'] = libelleTypeMission;
    data['libelle_motif_mission'] = libelleMotifMission;
    data['libelle_type'] = libelleType;
    return data;
  }
}



class GetNotifUser {
  int? numNotif;
  int? numMission;
  int? codeAgent;
  String? libelleNotif;
  String? dateNotif;
  bool? etatNotif;

  GetNotifUser(
      {this.numNotif,
      this.numMission,
      this.codeAgent,
      this.libelleNotif,
      this.dateNotif,
      this.etatNotif});

  GetNotifUser.fromJson(Map<String, dynamic> json) {
    numNotif = json['num_notif'];
    numMission = json['num_mission'];
    codeAgent = json['code_agent'];
    libelleNotif = json['libelle_notif'];
    dateNotif = json['date_notif'];
    etatNotif = json['etat_notif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num_notif'] = numNotif;
    data['num_mission'] = numMission;
    data['code_agent'] = codeAgent;
    data['libelle_notif'] = libelleNotif;
    data['date_notif'] = dateNotif;
    data['etat_notif'] = etatNotif;
    return data;
  }
}
