import 'package:flutter/material.dart';
import 'package:gestionapp/models/client_model.dart';

import '../component/constants.dart';
import '../component/custom_text.dart';
import '../component/dialoguetoast.dart';
import '../services/appDatabase.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  bool showSearch = false;
  String changed = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController editingController = TextEditingController();

  late Future<List<ClientModel>> feedClient;

  bool see = false;
  bool modify = false;
  String labelContainer = "Ajouter un Client ";

  ClientModel verType = ClientModel(
      idClient: 5, nomClient: "", phoneClient: "", adresseClient: "");

  TextEditingController nomController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController adresseController = TextEditingController();

  String nomClient = " ";
  String phoneClient = " ";
  String adresseClient = " ";

  @override
  void initState() {
    feedClient = AppDatabase.instance.listClients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vos Clients "),
        actions: [
          InkWell(
            onTap: () {
              debugPrint("show zone search");
              setState(() {
                showSearch = !showSearch;
              });
            },
            child: (!showSearch)
                ? const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25.0,
                  )
                : const Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: 25.0,
                  ),
          ),
          Container(
            width: 15,
          ),
          IconButton(
            onPressed: () {
              confirmDialogue();
            },
            icon: const Icon(Icons.delete),
            iconSize: 25,
          ),
          Container(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
          child: Stack(
        children: [
          listClientElement(),
          (see)
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black87.withOpacity(0.3),
                )
              : Container(),
          (see) ? ajoutClient(verType) : Container()
        ],
      )),
      floatingActionButton: (!see)
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  see = !see;
                  modify = false;
                  labelContainer = "Ajouter un Client";
                });
              },
              elevation: 10.0,
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: const Icon(Icons.add))
          : Container(),
    );
  }

  Widget listClientElement() {
    return Center(
        child: Column(
      children: [
        const SizedBox(
          height: 5.0,
        ),
        (showSearch)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 15),
                      child: TextField(
                        controller: editingController,
                        onChanged: (value) {
                          changed = value;
                          if (changed.isNotEmpty) {
                            setState(() {});
                          } else {
                            setState(() {});
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0.0),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: changed.isNotEmpty
                              ? GestureDetector(
                                  child: const Icon(Icons.close),
                                  onTap: () {
                                    editingController.clear();
                                    changed = '';
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                )
                              : null,
                          hintText: " rechercher un client",
                          // border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox(
                width: 0.0,
                height: 0.0,
              ),
        const SizedBox(
          height: 5.0,
        ),
        Expanded(child: listGenerate()),
      ],
    ));
  }

  Widget listGenerate() {
    return FutureBuilder<List<ClientModel>>(
        future: feedClient,
        builder:
            (BuildContext context, AsyncSnapshot<List<ClientModel>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No Connection"),
            );
          }
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No data"),
            );
          }
          List<ClientModel>? data = snapshot.data;
          return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                ClientModel item = data[index];
                return cardWidget(item);
              });
        });
  }

  Widget cardWidget(ClientModel element) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(left: 0.5, right: 0.5),
        child: ListTile(
          onTap: () {
            setState(() {
              see = !see;
              labelContainer = "Modifier une Categorie";
              modify = true;
              verType = element;
              ajoutClient(verType);
            });
          },
          leading: const CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Center(
                child: Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.grey,
            )),
          ),
          title: Row(
            children: [
              Expanded(
                child: CustomText(
                  element.nomClient,
                  tex: TailleText(context).soustitre * 0.8,
                  color: Colors.black87,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CustomText(
                'Adresse : ${element.adresseClient}',
                tex: TailleText(context).contenu,
                color: Colors.black87,
                textAlign: TextAlign.right,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                CustomText(
                  'Contact : ${element.phoneClient}',
                  tex: TailleText(context).contenu,
                  color: Colors.black87,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ajoutClient(ClientModel client) {

    if (modify) {
      nomController.text = client.nomClient;
       phoneController.text= client.phoneClient;
      adresseController.text = client.adresseClient;
      
    }

    return Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          child: Card(
            color: blanc(),
            elevation: 30.0,
            shadowColor: Colors.black87,
            margin: const EdgeInsets.all(0.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              side: BorderSide(color: Colors.transparent, width: 1.0),
            ),
            child: Form(
              key: formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: CustomText(
                          labelContainer,
                          tex: TailleText(context).titre,
                          color: teal(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    (modify)
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                AppDatabase.instance
                                    .deleteClient(client.nomClient);
                                DInfo.toastSuccess(
                                    "Suppression effectuée avec Success");
                                feedClient =
                                    AppDatabase.instance.listClients();
                                see = !see;
                                nomController.text = "";
                                phoneController.text = "";
                                adresseController.text = "";
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 25,
                            ))
                        : Container(),
                    Container(
                      width: 15,
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextFormField(
                      maxLines: 1,
                      controller: nomController,
                      onSaved: (onSavedval) {
                        nomController.text = onSavedval!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return " entrer un Nom  svp !! ";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Nom Complet",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.teal, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.teal, width: 0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextFormField(
                      maxLines: 1,
                      enabled: true,
                      controller: phoneController,
                      
                      onSaved: (onSavedval) {
                        phoneController.text = onSavedval!;
                      },
                      
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return " entrer un phone svp !! ";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Telephone",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.teal, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.teal, width: 0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextFormField(
                      maxLines: 1,
                      controller: adresseController,
                      onSaved: (onSavedval) {
                        adresseController.text = onSavedval!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return " entrer une Adresse svp !! ";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Adresse",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.teal, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.teal, width: 0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.teal.shade700,
                              shadowColor: Colors.teal.shade300,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 15.0),
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              if (validateAndSave()) {
                                if (modify) {
                                  ClientModel newClient = ClientModel(
                                      idClient: client.idClient,
                                      nomClient:
                                          nomController.text.toString(),
                                      phoneClient:
                                          phoneController.text.toString(),
                                      adresseClient: adresseController
                                          .text
                                          .toString());
                                  AppDatabase.instance
                                      .updateClient(newClient);
                                  DInfo.toastSuccess(
                                      "Modification effectué avec Success");
                                } else {
                                  ClientModel newClient = ClientModel(
                                    nomClient:
                                        nomController.text.toString(),
                                    phoneClient:
                                        phoneController.text.toString(),
                                    adresseClient:
                                        adresseController.text.toString(),
                                  );
                                  AppDatabase.instance
                                      .insertClient(newClient);
                                  DInfo.toastSuccess(
                                      "Ajout effectué avec Success");
                                }

                                setState(() {
                                  feedClient =
                                      AppDatabase.instance.listClients();
                                  see = !see;
                                  nomController.text = "";
                                  phoneController.text = "";
                                  adresseController.text = "";
                                });
                              } else {
                                DInfo.toastError(
                                    " Remplissez les champs SVP ");
                              }
                            },
                            child: const Text(
                              "soumettre",
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
              ]),
            ),
          ),
        ));
  }

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  /* boite de Dialogue de recherche */
  Future<void> confirmDialogue() async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (dialogcontext) => StatefulBuilder(
            builder: (sftcontext, stfsetState) => SimpleDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  contentPadding: const EdgeInsets.only(top: 2.0),
                  backgroundColor: Colors.white,
                  title: CustomText(
                    "Confirmez vous la suppression ?",
                    tex: 0.9,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                  children: [
                    Container(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red.shade700,
                                shadowColor: Colors.red.shade300,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Annuller",
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                AppDatabase.instance.deleteAllClients();
                                setState(() {
                                  feedClient =
                                      AppDatabase.instance.listClients();
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Confirmer",
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                )));
  }
}
