import 'package:flutter/material.dart';

class StockPages extends StatefulWidget {
  const StockPages({super.key});

  @override
  State<StockPages> createState() => _StockPagesState();
}

class _StockPagesState extends State<StockPages> {
//   List<String> cateGories = ["Tout", "Electronique", "Alimentation"];
//   String cate = "Tout";

//   List<String> cateGoriesDial = ["Electronique", "Alimentation"];
//   String cate1 = "Electronique";

//   int choix = 1;
//   late int tri = 0;

//   // List<ProductSimple> listProductSimple = [];

//   // List<ProductSimple> LProductSimple = [
//   //   ProductSimple(
//   //       productName: "Keyboaord",
//   //       productQuantity: 50,
//   //       productPrice: 5000,
//   //       productCategory: 1),
//   //   ProductSimple(
//   //       productName: "Sac de Riz",
//   //       productQuantity: 40,
//   //       productPrice: 12500,
//   //       productCategory: 2),
//   //   ProductSimple(
//   //       productName: "Télévision",
//   //       productQuantity: 150,
//   //       productPrice: 90000,
//   //       productCategory: 1),
//   //   ProductSimple(
//   //       productName: "Boisson",
//   //       productQuantity: 250,
//   //       productPrice: 6000,
//   //       productCategory: 2),
//   //   ProductSimple(
//   //       productName: "Moto",
//   //       productQuantity: 25,
//   //       productPrice: 800000,
//   //       productCategory: 1),
//   // ];

//   bool showSearch = false;
//   String changed = '';
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   TextEditingController editingController = TextEditingController();
//   TextEditingController nomProductController = TextEditingController();
//   TextEditingController prixProductController = TextEditingController();
//   TextEditingController qteProductController = TextEditingController();

//   checkList(int t , List<ProductSimple> lPP ) {
//     List<ProductSimple> l = [];
//     setState(() {
//       debugPrint("tri init : $tri");
//       if (t == 0) {
//         debugPrint(" lppp : ${lPP.length}");
//         l = LProductSimple;
//       }
//        if (t == 1) {
//         debugPrint(" lppp : ${lPP.length}");
//         for (var i = 0; i < lPP.length; i++) {
//           if (lPP[i].productCategory == 1) {
//             l.add(lPP[i]);
//           }
//           debugPrint(" longueur : ${l.length}");
//         }
//         debugPrint(" error");
//       }

//       if (t == 2) {
//         debugPrint(" lppp : ${lPP.length}");
//         for (var i = 0; i < lPP.length; i++) {
//           if (lPP[i].productCategory == 2) {
//             l.add(lPP[i]);
//           }
//           debugPrint(" longueur : ${l.length}");
//         }
//         debugPrint(" error");
//       }

//       listProductSimple = l;
//     });

//     debugPrint(" longueur ad : ${listProductSimple.length}");
//   }

//   @override
//   void initState() {
//     checkList(tri,LProductSimple);

//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Liste des Stocks "),
      ),
      body: Center(
          child: Column(
        children: const [
          SizedBox(
            height: 5.0,
          ),
        ],
      )),
    );
  }
}

//   /* drop dow menu pour le select */
//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//       value: item,
//       child: CustomText(
//         item,
//         color: Colors.black87,
//         textAlign: TextAlign.center,
//       ));

// /* fin */

//   List<DataColumn> createColumns() {
//     return const [
//       DataColumn(
//           label: Text('Nom',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//       DataColumn(
//           label: Text('Prix (CFA)',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//       DataColumn(
//           label: Text('Quantité',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//     ];
//   }

//   DataRow createRow(ProductSimple p) {
//     return DataRow(
//       cells: [
//         DataCell(
//           Text(p.productName.toString()),
//         ),
//         DataCell(Text(p.productPrice.toString())),
//         DataCell(
//           Text(p.productQuantity.toString()),
//         ),
//       ],
//       // other arguments
//     );
//   }

//   String? cateProduct({int? i}) {
//     int j = i ?? -1;
//     return (j == -1) ? "error" : cateGories[j];
//   }

//   List<DataRow> listRow(List<ProductSimple> item) {
//     return List.generate(item.length, (index) {
//       return createRow(item[index]);
//     });
//   }

//   Widget table() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         sortAscending: true,
//         sortColumnIndex: 0,
//         columns: createColumns(),
//         rows: listRow(listProductSimple),
//       ),
//     );
//   }

// /* boite de Dialogue de recherche */
//   Future<void> searchDialogue() async {
//     return await showDialog(
//         context: context,
//         barrierDismissible: true,
//         builder: (dialogcontext) => StatefulBuilder(
//             builder: (stfcontext, stfsetState) => SimpleDialog(
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                   contentPadding: const EdgeInsets.only(top: 2.0),
//                   backgroundColor: Colors.white,
//                   title: CustomText(
//                     "Enregistrer un Produit ",
//                     tex: 1.3,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.teal,
//                   ),
//                   children: [
//                     const Divider(
//                       color: Colors.teal,
//                       endIndent: 30,
//                       indent: 30,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Form(
//                         key: formKey,
//                         child: Column(
//                           children: [
//                             Container(
//                               margin:
//                                   const EdgeInsets.only(left: 15, right: 15),
//                               width: MediaQuery.of(context).size.width * 0.5,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: Center(
//                                 child: TextFormField(
//                                   maxLines: 1,
//                                   controller: nomProductController,
//                                   onSaved: (onSavedval) {
//                                     nomProductController.text = onSavedval!;
//                                   },
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return " entrer un Nom de Produit svp !! ";
//                                     }
//                                     return null;
//                                   },
//                                   decoration: const InputDecoration(
//                                     labelText: "Nom de Produit",
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Colors.teal, width: 1),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(10.0))),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Colors.teal, width: 0),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(10.0))),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 10,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Container(
//                                   margin: const EdgeInsets.only(left: 15),
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.23,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: Center(
//                                     child: TextFormField(
//                                       maxLines: 1,
//                                       controller: prixProductController,
//                                       onSaved: (onSavedval) {
//                                         prixProductController.text =
//                                             onSavedval!;
//                                       },
//                                       keyboardType: TextInputType.number,
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return " prix !! ";
//                                         }
//                                         return null;
//                                       },
//                                       decoration: const InputDecoration(
//                                         labelText: "Prix",
//                                         focusedBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.teal, width: 1),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(10.0))),
//                                         border: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.teal, width: 0),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(10.0))),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: const EdgeInsets.only(right: 15),
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.23,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: Center(
//                                     child: TextFormField(
//                                       maxLines: 1,
//                                       controller: qteProductController,
//                                       onSaved: (onSavedval) {
//                                         qteProductController.text = onSavedval!;
//                                       },
//                                       keyboardType: TextInputType.phone,
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return "Qte";
//                                         }
//                                         return null;
//                                       },
//                                       decoration: const InputDecoration(
//                                         labelText: "Quantité",
//                                         focusedBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.teal, width: 1),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(10.0))),
//                                         border: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.teal, width: 0),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(10.0))),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               height: 15,
//                             ),
//                             Container(
//                                 margin:
//                                     const EdgeInsets.only(left: 15, right: 15),
//                                 padding: const EdgeInsets.only(left: 15),
//                                 height: 50,
//                                 width: MediaQuery.of(context).size.width * 0.53,
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey.shade200,
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: DropdownButton<String>(
//                                     underline: Container(),
//                                     icon: const Icon(Icons.arrow_drop_down,
//                                         color: Colors.blueGrey),
//                                     value: cate1,
//                                     isExpanded: true,
//                                     items: cateGoriesDial
//                                         .map(buildMenuItem)
//                                         .toList(),
//                                     iconSize: 30,
//                                     iconEnabledColor: Colors.blueGrey,
//                                     onChanged: ((value) {
//                                       stfsetState(() {
//                                         cate1 = value!;
//                                       });
//                                       setState(() {
//                                         cate1 = value!;

//                                         if (cate1 == cateGoriesDial[0]) {
//                                           choix = 1;
//                                         } else {
//                                           choix = 2;
//                                         }

//                                         debugPrint("choix : $choix");
//                                       });
//                                     }))),
//                           ],
//                         )),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 foregroundColor: Colors.white,
//                                 backgroundColor: Colors.red.shade700,
//                                 shadowColor: Colors.red.shade300,
//                                 elevation: 5.0,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text(
//                                 "retour",
//                               )),
//                           ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 foregroundColor: Colors.white,
//                                 backgroundColor: Colors.teal.shade700,
//                                 shadowColor: Colors.teal.shade300,
//                                 elevation: 5.0,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 if (nomProductController.text.isNotEmpty &&
//                                     prixProductController.text.isNotEmpty &&
//                                     qteProductController.text.isNotEmpty) {
//                                   ProductSimple v = ProductSimple(
//                                       productName: nomProductController.text,
//                                       productQuantity:
//                                           int.parse(qteProductController.text),
//                                       productPrice:
//                                           int.parse(prixProductController.text),
//                                       productCategory: choix);

//                                   setState(() {
//                                     LProductSimple.add(v);
//                                     DInfo.toastSuccess("Produit enrgistré ");
//                                   });

//                                   Navigator.of(context).pop();
//                                 } else {
//                                   DInfo.toastError(
//                                       "Remplissez tous les champ svp");
//                                 }
//                               },
//                               child: const Text(
//                                 "soumettre",
//                               )),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 )));
//   }
// }
