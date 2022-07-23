class Config {
  static const String appName = "Cim APP";

  static const String apiURL = "http://192.168.43.139:5000";

  static const String apiLogin = "/login/"; // + identifiant + mot de passe

  static const String apiMissionUser = "/mission_user/"; // + id

  static const String apiMissionUserEtat = "/mission_user_etat/"; // + id + etat

  static const String apiMissionEtat = "/mission_etat/"; // + etat

  static const String apiChangedEtat =
      "/changed_mission_etat/"; // + num_mission

  static const String apiMissionConsulter =
      "/mission_etat_consulter/"; //  consulter liste des missions

  static const String apiNotifnonLu =
      "/notif_etat_nonlu/"; // + code agent  notif lu

  static const String apiNotifLu =
      "/notif_etat_lu/"; // + code agent  notif non lu

  static const String apiNotifUpdate = "/changed_notif_etat/"; // +  num_motif

  static const String apiNotifInsert = "/notif/insert"; // +  corps de message

}
