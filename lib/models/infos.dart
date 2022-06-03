// ignore: camel_case_types
class infoMission {
  String titre = '';
  String direction = '';
  String initiateur = '';
  int duree = 0;

  infoMission(this.titre, this.direction, this.duree, this.initiateur) {
    titre = titre;
    direction = direction;
    initiateur = initiateur;
    duree = duree;
  }
}

// ignore: camel_case_types
class infoNotif {
  String titre = '';
  String message = '';
  String date = '';
  late bool lu;

  infoNotif(this.titre, this.message, this.date, this.lu) {
    titre = titre;
    message = message;
    date = date;
    lu = lu;
  }
}

// ignore: camel_case_types
class infoParticpant {
  String nom = '';
  String prenom = '';
  String matricule = '';
  String service = '';
  String role = '';

  infoParticpant(
      this.nom, this.prenom, this.matricule, this.service, this.role) {
    nom = nom;
    prenom = prenom;
    matricule = matricule;
    service = service;
    role = role;
  }
}

// ignore: camel_case_types
class infoItineraire {
  String localite = '';
  int duree = 0;
  late poSition statut;

  infoItineraire(this.localite, this.duree, this.statut) {
    localite = localite;
    duree = duree;
    statut = statut;
  }
}

enum poSition { depart, escale, fin }
