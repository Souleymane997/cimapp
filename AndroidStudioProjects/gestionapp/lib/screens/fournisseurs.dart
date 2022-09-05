// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../component/custom_text.dart';


class FournisseursPage extends StatefulWidget {
  const FournisseursPage({super.key});

  @override
  State<FournisseursPage> createState() => _FournisseursPageState();
}

class _FournisseursPageState extends State<FournisseursPage> {
  // final SupplierController supplierController = Get.put(SupplierController());
  // List<Supplier> feed = [];

  bool showSearch = false;
  String changed = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController editingController = TextEditingController();
  TextEditingController supplierNameController = TextEditingController();
  TextEditingController supplierPhoneController = TextEditingController();
  TextEditingController supplierAdresseController = TextEditingController();
  TextEditingController supplierCommentController = TextEditingController();
  // DBHelper base = DBHelper();

  // List<Supplier> listSupplier = [
  //   Supplier(
  //       supplierName: "Alpha Barry",
  //       supplierPhone: "00226 67087547",
  //       supplierAdresse: "Ouagadougou",
  //       supplierComment: " j'adore faire des achats "),
  //   Supplier(
  //       supplierName: "Konate Moussa ",
  //       supplierPhone: "00226 67087547",
  //       supplierAdresse: "Ouagadougou",
  //       supplierComment: " j'adore faire des achats "),
  //   Supplier(
  //       supplierName: "Cisse Oumar ",
  //       supplierPhone: "00226 67087547",
  //       supplierAdresse: "Ouagadougou",
  //       supplierComment: " j'adore faire des achats "),
  // ];

  @override
  void initState() {
    //getAllSupplier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vos Fournisseurs"),
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
        ],
      ),
      body: SafeArea(
        child: Center(
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
                              hintText: " rechercher un fournisseur",
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
              height: 10.0,
            ),
            const Expanded(child: Text("Hello")),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            searchDialogue();
          },
          elevation: 10.0,
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: const Icon(Icons.add)),
    );
  }

  // Widget elemntInList() {
  //   return ListView.builder(
  //       itemCount: listSupplier.length,
  //       itemBuilder: (context, index) {
  //         Supplier data = listSupplier[index];
  //         return cardWidget(data);
  //       });
  // }

  Widget cardWidget() {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(left: 0.5, right: 0.5),
        child: ListTile(
          onTap: () {
            // Navigator.of(context).push(
            //   SlideRightRoute(
            //       child:  DetailsElevePage(eleve: element,),
            //       page: DetailsElevePage(eleve: element,),
            //       direction: AxisDirection.left),
            // );
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
                  "element.supplierName",
                  tex: TailleText(context).soustitre * 0.8,
                  color: Colors.black87,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CustomText(
                "element.supplierAdresse",
                tex: TailleText(context).contenu * 0.7,
                color: Colors.black87,
                textAlign: TextAlign.right,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                CustomText(
                  'Contact : ',
                  tex: TailleText(context).contenu * 0.8,
                  color: Colors.black87,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w300,
                ),
                Expanded(
                  child: Text(
                    'Commentaire : ',
                    textScaleFactor: TailleText(context).contenu * 0.7,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* boite de Dialogue de recherche */
  Future<void> searchDialogue() async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => SimpleDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  contentPadding: const EdgeInsets.only(top: 2.0),
                  backgroundColor: Colors.white,
                  title: CustomText(
                    "Enregistrer un Fournisseur ",
                    tex: 1.3,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal,
                  ),
                  children: [
                    const Divider(
                      color: Colors.teal,
                      endIndent: 30,
                      indent: 30,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: MediaQuery.of(context).size.width * 0.55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: supplierNameController,
                                  onSaved: (onSavedval) {
                                    supplierNameController.text = onSavedval!;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return " entrer un Nom & Prenom SVP !! ";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: "Nom & Prenom",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal, width: 0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: MediaQuery.of(context).size.width * 0.55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: supplierPhoneController,
                                  onSaved: (onSavedval) {
                                    supplierPhoneController.text = onSavedval!;
                                  },
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return " entrer un Telephone svp !! ";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: "Telephone",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal, width: 0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: MediaQuery.of(context).size.width * 0.55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: supplierAdresseController,
                                  onSaved: (onSavedval) {
                                    supplierAdresseController.text =
                                        onSavedval!;
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
                                        borderSide: BorderSide(
                                            color: Colors.teal, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal, width: 0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: MediaQuery.of(context).size.width * 0.55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: TextFormField(
                                  maxLines: 3,
                                  controller: supplierCommentController,
                                  onSaved: (onSavedval) {
                                    supplierCommentController.text =
                                        onSavedval!;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return " entrer un Commentaire svp !! ";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: "Commentaire",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal, width: 0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 25,
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
                                "retour",
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.teal.shade700,
                                shadowColor: Colors.teal.shade300,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                //enregistreSupplier();
                              },
                              child: const Text(
                                "soumettre",
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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

  void cleanController() {
    // Clean up the controller when the widget is disposed.
    supplierAdresseController.text = "";
    supplierCommentController.text = "";
    supplierNameController.text = "";
    supplierPhoneController.text = "";
  }

  // //* verifie l'identifiant et le mot de passe dans la base de donnée
  // enregistreSupplier() {
  //   if (validateAndSave()) {
  //     addSupplierToDb();
  //     Navigator.of(context).pop();
  //   } else {
  //     DInfo.toastError(" Remplissez les champs SVP ");
  //   }
  // }

  // addSupplierToDb() async {
  //   int value = await supplierController.addSupplier(
  //       supplier: Supplier(
  //     supplierName: supplierNameController.text,
  //     supplierPhone: supplierPhoneController.text,
  //     supplierAdresse: supplierAdresseController.text,
  //     supplierComment: supplierCommentController.text,
  //   ));
  //   DInfo.toastError(" Success ");
  //   cleanController();
  //   print("My id is $value");
  // }

  // getAllSupplier() async {
  //   List<Supplier> resSupplier =
  //       (await DBHelper.querySupplier()).cast<Supplier>();

  //   setState(() {
  //     feed = resSupplier;
  //   });
  //   debugPrint(" longueur : ${feed.length}");

    //List<Map<String, dynamic>> clients = await DBHelper.queryClient();
    //clientList.assignAll(clients.map((data) => Client.fromJson(data)).toList());
  //}
}
