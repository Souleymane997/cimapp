import 'package:flutter/material.dart';
import 'package:gestionapp/models/type_model.dart';
import '../../component/constants.dart';
import '../../component/custom_text.dart';
import '../../component/dialoguetoast.dart';
import '../../services/appDatabase.dart';

class TypePage extends StatefulWidget {
  const TypePage({super.key});

  @override
  State<TypePage> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  late Future<List<TypeModel>> feedType;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  TypeModel verType = TypeModel(nomType: "choix");
  bool see = false;
  bool modify = false;
  String labelContainer = "Ajouter un Type";

  @override
  void initState() {
    feedType = AppDatabase.instance.listTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Liste des Types"),
        actions: [
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
          listGenerate(),
          (see)
              ? InkWell(
                  onTap: () {
                    setState(() {
                      see = !see;
                      controller.text = "";
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black87.withOpacity(0.3),
                  ),
                )
              : Container(),
          (see) ? ajoutType(verType) : Container()
        ],
      )),
      floatingActionButton: (!see)
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  see = !see;
                  modify = false;
                  labelContainer = "Ajouter un Type";
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

  Widget listGenerate() {
    return FutureBuilder<List<TypeModel>>(
        future: feedType,
        builder:
            (BuildContext context, AsyncSnapshot<List<TypeModel>> snapshot) {
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
          List<TypeModel>? data = snapshot.data;
          return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                TypeModel item = data[index];
                return cardWidget(item);
              });
        });
  }

  Widget cardWidget(TypeModel type) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(left: 0.5, right: 0.5),
          child: ListTile(
            onTap: () {
              setState(() {
                see = !see;
                labelContainer = "Modifier un Type";
                modify = true;
                verType = type;
                ajoutType(verType);
              });
            },
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    type.nomType,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                    textScaleFactor: 1.05,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "Id : ${type.idType}",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black87,
        ),
      ],
    );
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
                                AppDatabase.instance.deleteAllTypes();
                                setState(() {
                                  feedType = AppDatabase.instance.listTypes();
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

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Widget ajoutType(TypeModel type) {
    if (modify) {
      controller.text = type.nomType;
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
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                                AppDatabase.instance.deleteType(type.nomType);
                                DInfo.toastSuccess(
                                    "Suppression effectuée avec Success");
                                feedType = AppDatabase.instance.listTypes();
                                see = !see;
                                controller.text = "";
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
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextFormField(
                      maxLines: 1,
                      controller: controller,
                      onSaved: (onSavedval) {
                        controller.text = onSavedval!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return " entrer un Type svp !! ";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Type de Produit ",
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
                                  TypeModel newType = TypeModel(
                                      idType: type.idType,
                                      nomType: controller.text.toString());
                                  AppDatabase.instance.updateType(newType);
                                  DInfo.toastSuccess(
                                      "Modification effectué avec Success");
                                } else {
                                  TypeModel newType = TypeModel(
                                      nomType: controller.text.toString());
                                  AppDatabase.instance.insertType(newType);
                                  DInfo.toastSuccess(
                                      "Ajout effectué avec Success");
                                }
    
                                setState(() {
                                  feedType = AppDatabase.instance.listTypes();
                                  see = !see;
                                  controller.text = "";
                                });
                              } else {
                                DInfo.toastError(" Remplissez les champs SVP ");
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
}
