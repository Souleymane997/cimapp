
import 'package:flutter/material.dart';

class VentesPages extends StatefulWidget {
  const VentesPages({super.key});

  @override
  State<VentesPages> createState() => _VentesPagesState();
}

class _VentesPagesState extends State<VentesPages> {
  List<String> type = ["PF", "MB"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Liste des Ventes "),
      ),
      body: Center(
          child: Column(
        children:const [
          SizedBox(
            height: 5.0,
          ),
        ],
      )),
    );
  }
}

//   List<DataColumn> createColumns() {
//     return const [
//       DataColumn(
//           label: Text('ID',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//       DataColumn(
//           label: Text('Nom',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//       DataColumn(
//           label: Text('Prix (CFA)',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//       DataColumn(
//           label: Text('Quantité',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//       DataColumn(
//           label: Text('Prix Total (CFA)',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//       DataColumn(
//           label: Text('Category',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//       DataColumn(
//           label: Text('Type',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//       DataColumn(
//           label: Text('Fournisseur',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
//     ];
//   }

//   DataRow createRow(Product p) {
//     return DataRow(
//       cells: [
//         DataCell(
//           Text(p.productId.toString()),
//         ),
//         DataCell(
//           Text(p.productName.toString()),
//           onTap: () {
//             print('onTap');
//           },
//         ),
//         DataCell(Text(p.productPrice.toString())),
//         DataCell(
//           Text(p.productQuantit.toString()),
//         ),
//         DataCell(
//           Text( (p.productPrice* p.productQuantit).toString()),
//         ),
//         DataCell(
//           Text(cateProduct(i: p.productCategory).toString()),
//         ),
//         DataCell(
//           Text(typeProduct(i: p.productType).toString()),
//         ),
//         DataCell(
//           Text(suppLier(i: p.productSupplier).toString()),
//         ),
//       ],
//       // other arguments
//     );
//   }


//   String? suppLier({int? i}) {
//     int j = i ?? -1;
//     return (j == -1) ? "error" : listSupplier[j].supplierName;
//   }

//   String? typeProduct({int? i}) {
//     int j = i ?? -1;
//     return (j == -1) ? "error" : type[j];
//   }

//   String? cateProduct({int? i}) {
//     int j = i ?? -1;
//     return (j == -1) ? "error" : cateGories[j];
//   }

//   List<DataRow> listRow(List<Product> item) {
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
//         rows: listRow(listProduct),
//       ),
//     );
//   }
// }
