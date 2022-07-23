import 'dart:convert';
import 'package:cimapp/modelsrequest/getresponse.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'config.dart';

class Parser with ChangeNotifier {
  var data = [];

  List<GetMissionUser> result = [];
  List<GetNotifUser> reSult = [];
  List<GetNotifUser> reSulT = [];

  //  liste des missions liées a l'utilisateur
  Future<List<GetMissionUser>> loadFeed({String? query, int? id}) async {
    final client = http.Client();
    final response = await client
        .get(Uri.parse(Config.apiURL + Config.apiMissionUser + id.toString()));

    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        data = json.decode(response.body);
        result = data.map((e) => GetMissionUser.fromJson(e)).toList();

        if (query != null) {
          query = query.toLowerCase();
          result = result
              .where((element) =>
                  element.objetMission!.toLowerCase().contains(query!) ||
                  element.descriptionMission!.toLowerCase().contains(query) ||
                  element.libelleMotifMission!.toLowerCase().contains(query) ||
                  element.libelleStructure!.toLowerCase().contains(query))
              .toList();
        }
      } else {
        debugPrint("fectch error");
      }
      notifyListeners();
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      debugPrint("fectch error");
    }

    return result;
  }

  //  liste des missions liées a l'utilisateur et leur etat
  Future<List<GetMissionUser>> loadFeedEtat(
      {String? query, int? id, int? etat}) async {
    final client = http.Client();
    final response = await client.get(Uri.parse(Config.apiURL +
        Config.apiMissionUserEtat +
        id.toString() +
        "/" +
        etat.toString()));

    try {
      // ignore: unrelated_type_equality_checks, unnecessary_null_comparison
      if (response.statusCode == 200 && response.body != []) {
        data = json.decode(response.body);
        result = data.map((e) => GetMissionUser.fromJson(e)).toList();

        if (query != null) {
          query = query.toLowerCase();
          result = result
              .where((element) =>
                  element.objetMission!.toLowerCase().contains(query!) ||
                  element.descriptionMission!.toLowerCase().contains(query) ||
                  element.libelleMotifMission!.toLowerCase().contains(query) ||
                  element.libelleStructure!.toLowerCase().contains(query))
              .toList();
        }
      } else {
        debugPrint("fectch error");
      }
      notifyListeners();
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      debugPrint("fectch error");
    }

    return result;
  }

  //  liste des missions et leur etat ... coté gestion des missions
  Future<List<GetMissionUser>> loadFeedMissionEtat(
      {String? query, int? etat}) async {
    final client = http.Client();
    final response = await client.get(
        Uri.parse(Config.apiURL + Config.apiMissionEtat + etat.toString()));

    try {
      // ignore: unrelated_type_equality_checks, unnecessary_null_comparison
      if (response.statusCode == 200 && response.body != []) {
        data = json.decode(response.body);
        result = data.map((e) => GetMissionUser.fromJson(e)).toList();

        if (query != null) {
          query = query.toLowerCase();
          result = result
              .where((element) =>
                  element.objetMission!.toLowerCase().contains(query!) ||
                  element.descriptionMission!.toLowerCase().contains(query) ||
                  element.libelleMotifMission!.toLowerCase().contains(query) ||
                  element.libelleStructure!.toLowerCase().contains(query))
              .toList();
        }
      } else {
        debugPrint("fectch error");
      }
      notifyListeners();
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      debugPrint("fectch error");
    }

    return result;
  }

  //  liste des missions et leur etat ... coté gestion des missions
  Future<List<GetMissionUser>> loadFeedMissionConsulter({String? query}) async {
    final client = http.Client();
    final response =
        await client.get(Uri.parse(Config.apiURL + Config.apiMissionConsulter));

    try {
      // ignore: unrelated_type_equality_checks, unnecessary_null_comparison
      if (response.statusCode == 200 && response.body != []) {
        data = json.decode(response.body);
        result = data.map((e) => GetMissionUser.fromJson(e)).toList();

        if (query != null) {
          query = query.toLowerCase();
          result = result
              .where((element) =>
                  element.objetMission!.toLowerCase().contains(query!) ||
                  element.descriptionMission!.toLowerCase().contains(query) ||
                  element.libelleMotifMission!.toLowerCase().contains(query) ||
                  element.libelleStructure!.toLowerCase().contains(query))
              .toList();
        }
      } else {
        debugPrint("fectch error");
      }
      notifyListeners();
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      debugPrint("fectch error");
    }

    return result;
  }

  Future putData(int numMission, int codeEtat, String observation) async {
    final client = http.Client();

    final response = await client.put(
        Uri.parse(Config.apiURL +
            Config.apiChangedEtat +
            numMission.toString() +
            "/" +
            codeEtat.toString()),
        body: {"observation": observation});

    try {
      notifyListeners();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      debugPrint("fectch error $e");
    }
    return false;
  }

//  liste des Notifs non lu .....
  Future<List<GetNotifUser>> loadFeedNotifNonLu(int codeAgent) async {
    final client = http.Client();
    final respons = await client.get(
        Uri.parse(Config.apiURL + Config.apiNotifnonLu + codeAgent.toString()));

    try {
      // ignore: unrelated_type_equality_checks, unnecessary_null_comparison
      if (respons.statusCode == 200 && respons.body != []) {
        data = json.decode(respons.body);
        reSulT = data.map((e) => GetNotifUser.fromJson(e)).toList();
      } else {
        debugPrint("fectch error");
      }
      notifyListeners();
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      debugPrint("fectch error");
    }

    return reSulT;
  }

  //  liste des Notifs non lu .....
  Future<List<GetNotifUser>> loadFeedNotifLu(int codeAgent) async {
    final client = http.Client();
    final response = await client.get(
        Uri.parse(Config.apiURL + Config.apiNotifLu + codeAgent.toString()));

    try {
      // ignore: unrelated_type_equality_checks, unnecessary_null_comparison
      if (response.statusCode == 200 && response.body != []) {
        data = json.decode(response.body);

        reSult = data.map((e) => GetNotifUser.fromJson(e)).toList();
      } else {
        debugPrint("fectch error");
      }
      notifyListeners();
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      debugPrint("fectch error");
    }

    return reSult;
  }

  Future putDataNotif(int numNotif) async {
    final client = http.Client();

    final response = await client.put(
        Uri.parse(Config.apiURL + Config.apiNotifUpdate + numNotif.toString()),
        body: {});

    try {
      notifyListeners();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      debugPrint("fectch error $e");
    }
    return false;
  }

  Future postDataNotif(int numNotif, int codeAgent, String libelle) async {
    final client = http.Client();

    final response =
        await client.post(Uri.parse(Config.apiURL + Config.apiNotifInsert),
            body: jsonEncode({
              "num_mission": numNotif.toString(),
              "code_agent": codeAgent.toString(),
              "libelle_notif": libelle,
            }),
            headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Some token"
        });

    try {
      notifyListeners();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      debugPrint("fectch error $e");
    }
    return false;
  }
}
