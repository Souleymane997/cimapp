import 'dart:convert';
import 'package:cimapp/modelsrequest/getresponse.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Parser with ChangeNotifier {
  var data = [];
  List<getReponse> resultat = [];

  String getAPILien = "https://jsonplaceholder.typicode.com/users";

  Future<List<getReponse>> loadFeed({String? query}) async {
    final client = http.Client();
    final response = await client.get(Uri.parse(getAPILien));

    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        data = json.decode(response.body);
        resultat = data.map((e) => getReponse.fromJson(e)).toList();

        if (query != null) {
          query = query.toLowerCase();
          resultat = resultat
              .where((element) =>
                  element.name!.toLowerCase().contains(query!) ||
                  element.username!.toLowerCase().contains(query))
              .toList();
        }
      } else {
        debugPrint("fectch error");
      }
      notifyListeners();
    } on Exception catch (e) {
      debugPrint("fectch error");
    }

    return resultat;
  }
}
