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
  late bool lu ;

  infoNotif(this.titre, this.message, this.date, this.lu) {
    titre = titre;
    message = message;
    date = date;
    lu = lu;
  }
}
