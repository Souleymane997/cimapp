// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:gestionapp/models/categorie_model.dart';
import 'package:gestionapp/models/client_model.dart';
import 'package:gestionapp/models/produit_model.dart';
import 'package:gestionapp/models/type_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  AppDatabase._(); // constructeur privé

  static final AppDatabase instance =
      AppDatabase._(); // initialisation de l'instance

  // constantes
  static Database? _database;
  static const String tableCategorie = "categorie";
  static const String tableType = "type";
  static const String tableProduit = "produit";
  static const String tableClient = "client";

  // verifie si  la base de donnée existe deja ou pas  ..
  Future<Database?> get database async {
    // ignore: unnecessary_null_comparison
    // if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  static Future onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  // initialisation de la base de donnée ..
  Future<Database>initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
        join(await getDatabasesPath(), 'appdatabase.db'),
        onConfigure: onConfigure, onCreate: (db, version) async {
      // table Categories ..
      await db.execute('''
          CREATE TABLE $tableCategorie (
            idCategorie INTEGER PRIMARY KEY AUTOINCREMENT,
            nomCategorie TEXT 
          )
          ''');

      // table Type ...
      await db.execute('''
          CREATE TABLE $tableType (
            idType INTEGER PRIMARY KEY AUTOINCREMENT,
            nomType TEXT
          )
          ''');


      // table Client ...
      await db.execute('''
          CREATE TABLE $tableClient (
            idClient INTEGER PRIMARY KEY AUTOINCREMENT,
            nomClient TEXT,
            phoneClient TEXT,
            adresseClient TEXT
          )
          ''');

      // table  Produits ...
      await db.execute(''' CREATE TABLE $tableProduit (
      idProduit INTEGER PRIMARY KEY AUTOINCREMENT,
      nomProduit TEXT ,
      qteProduit INT ,
      prixProduit INT ,
      categorieProduit INTEGER ,
      typeProduit INTEGER ,
      FOREIGN KEY (categorieProduit) REFERENCES $tableCategorie (idCategorie) 
ON UPDATE CASCADE 
          ON DELETE CASCADE, 
      FOREIGN KEY (typeProduit) REFERENCES $tableType (idType) 
          ON UPDATE CASCADE 
          ON DELETE CASCADE
    ) 
    ''');
    }, version: 1 );
  }


  // fermer la base donnée en sortant de l'application
  void closeDatabase() async {
    final Database? db = await database;
    await db!.close();
  }

//* toutes les requetes de Categories *//

  // Insertion de Categorie
  void insertCategorie(CategorieModel categorie) async {
    final Database? db = await database;

    await db!.insert(tableCategorie, categorie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Modification de Categorie
  void updateCategorie(CategorieModel categorie) async {
    final Database? db = await database;
    await db!.update(tableCategorie, categorie.toMap(),
        where: 'idCategorie = ?', whereArgs: [categorie.idCategorie]);
  }

  // Suppression d'une Categorie
  void deleteCategorie(String nom) async {
    final Database? db = await database;
    await db!.delete(tableCategorie, where: 'nomCategorie = ?', whereArgs: [nom]);
  }

  // Suppression de toute les Categories ....
  void deleteAllCategorie() async {
    final Database? db = await database;
    await db!.delete(tableCategorie);
  }

  // liste des Categories
  Future<List<CategorieModel>> listCategorie() async {
    final Database? db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(tableCategorie);
    List<CategorieModel> recipes = List.generate(maps.length, (i) {
      return CategorieModel.fromMap(maps[i]);
    });

    if (recipes.isEmpty) {
      for (CategorieModel recipe in defaultCategories) {
        insertCategorie(recipe);
      }
      recipes = defaultCategories;
    }

    return recipes;
  }

  // obtenir les infos d'une Categories
  Future<CategorieModel?> oneCategorie(int i) async {
    final Database? db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(tableCategorie,
        columns: ['idCategorie', 'nomCategorie'],
        where: 'idCategorie = ?',
        whereArgs: [i]);

    if (maps.isNotEmpty) {
      return CategorieModel.fromMap(maps.first);
    }
    return null;
  }

  // liste par defaut
  final List<CategorieModel> defaultCategories = [
    CategorieModel(idCategorie:0,nomCategorie: "Alimentation2"),
    CategorieModel(idCategorie:1,nomCategorie: "Electronique2"),
  ];

//* Fin toutes les requetes de Categories *//

//* toutes les requetes de Types *//

  // Insertion de Types
  void insertType(TypeModel type) async {
    final Database? db = await database;

    await db!.insert(tableType, type.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Modification de Types
  void updateType(TypeModel type) async {
    final Database? db = await database;
    await db!.update(tableType, type.toMap(),
        where: 'idType = ?',
        whereArgs: [type.idType]);
  }

  // Suppression d'un Types
  void deleteType(String nom) async {
    final Database? db = await database;
    await db!.delete(tableType, where: 'nomType = ?', whereArgs: [nom]);
  }

  // Suppression de tous les Types ....
  void deleteAllTypes() async {
    final Database? db = await database;
    await db!.delete(tableType);
  }

  // liste des Types
  Future<List<TypeModel>> listTypes() async {
    final Database? db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(tableType);
    List<TypeModel> recipes = List.generate(maps.length, (i) {
      return TypeModel.fromMap(maps[i]);
    });

    if (recipes.isEmpty) {
      for (TypeModel recipe in defaultType) {
        insertType(recipe);
      }
      recipes = defaultType;
    }

    return recipes;
  }

  // obtenir les infos d'un Type
  Future<TypeModel?> oneType(int i) async {
    final Database? db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(tableType,
        columns: ['idType', 'nomType'], where: 'idType = ?', whereArgs: [i]);

    if (maps.isNotEmpty) {
      return TypeModel.fromMap(maps.first);
    }
    return null;
  }

  // liste par defaut
  final List<TypeModel> defaultType = [
    TypeModel(idType: 0,nomType: "Matiere Premiere"),
    TypeModel(idType: 1,nomType: "Produit Fini"),
  ];

  //* Fin toutes les requetes de Types *//

  //* toutes les requetes de Produit*//

  // Insertion de Produit
  void insertProduit(ProduitModel produit) async {
    final Database? db = await database;

    await db!.insert(tableProduit, produit.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Modification de produit
  void updateProduit(ProduitModel produit) async {
    final Database? db = await database;
    await db!.update(tableProduit, produit.toMap(),
        where: 'idProduit = ?', whereArgs: [produit.idProduit]);
  }

  // Suppression d'un Produit
  void deleteProduit(int i) async {
    final Database? db = await database;
    await db!.delete(tableProduit, where: 'idProduit = ?', whereArgs: [i]);
  }

  // Suppression de tous les Produits ....
  void deleteAllProduits() async {
    final Database? db = await database;
    await db!.delete(tableProduit);
  }

  // liste des Produits
  Future<List<ProduitModel>> listProduits() async {
    final Database? db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(tableProduit);
    List<ProduitModel> recipes = List.generate(maps.length, (i) {
      return ProduitModel.fromMap(maps[i]);
    });

    if (recipes.isEmpty) {
      for (ProduitModel recipe in defaultProduit) {
        insertProduit(recipe);
      }
      recipes = defaultProduit;
    }

    return recipes;
  }

  // obtenir les infos d'un Produit
  Future<ProduitModel?> oneProduit(int i) async {
    final Database? db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(tableType,
        columns: [
          'idProduit',
          'nomProduit',
          'qteProduit',
          'prixProduit',
          'categorieProduit',
          'typeProduit'
        ],
        where: 'idProduit = ?',
        whereArgs: [i]);

    if (maps.isNotEmpty) {
      return ProduitModel.fromMap(maps.first);
    }
    return null;
  }

  // liste par defaut
  final List<ProduitModel> defaultProduit = [
    ProduitModel(0, "Farine", 250, 500, 0, 0),
  ];

  //* Fin toutes les requetes de Produits *//




//* toutes les requetes de Client *//

  // Insertion de Client
  void insertClient(ClientModel client) async {
    final Database? db = await database;

    await db!.insert(tableClient, client.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Modification de Client
  void updateClient(ClientModel client) async {
    final Database? db = await database;
    await db!.update(tableClient, client.toMap(),
        where: 'idClient = ?',
        whereArgs: [client.idClient]);
  }

  // Suppression d'un Client
  void deleteClient(String nom) async {
    final Database? db = await database;
    await db!.delete(tableClient, where: 'nomClient = ?', whereArgs: [nom]);
  }

  // Suppression de tous les  Clients ....
  void deleteAllClients() async {
    final Database? db = await database;
    await db!.delete(tableClient);
  }

  // liste des  Clients
  Future<List<ClientModel>> listClients() async {
    final Database? db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(tableClient);
    List<ClientModel> recipes = List.generate(maps.length, (i) {
      return ClientModel.fromMap(maps[i]);
    });

    if (recipes.isEmpty) {
      for (ClientModel recipe in defaultClient) {
        insertClient(recipe);
      }
      recipes = defaultClient;
    }

    return recipes;
  }

  // obtenir les infos d'un  Client
  Future<ClientModel?> oneClient(int i) async {
    final Database? db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(tableType,
        columns: ['idClient', 'nomClient','phoneClient','adressePhone'], where: 'idClient = ?', whereArgs: [i]);

    if (maps.isNotEmpty) {
      return ClientModel.fromMap(maps.first);
    }
    return null;
  }

  // liste par defaut
  final List<ClientModel> defaultClient = [
    ClientModel(idClient:0,nomClient: "Souleymane ZONGO",phoneClient: "+226 67087547",adresseClient: "ouaga") ,
    ClientModel(idClient:1,nomClient: "Emmanuel SAWADOGO",phoneClient: "+226 71923044",adresseClient: "bobo") ,
  ];

  //* Fin toutes les requetes de Types *//
}
