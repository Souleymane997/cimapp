import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import '../../../models/custom_text.dart';

class EvaluerMission extends StatefulWidget {
  const EvaluerMission({Key? key}) : super(key: key);

  @override
  State<EvaluerMission> createState() => _EvaluerMissionState();
}

class _EvaluerMissionState extends State<EvaluerMission> {
  String valueChanged = '';
  String valueToValidate = '';
  String valueSaved = '';
  TextEditingController? controller;
  GlobalKey<FormState> oFormKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> items = [
    {
      'value': 'boxValue',
      'label': 'Box Label',
    },
    {
      'value': 'circleValue',
      'label': 'Circle Label Loooooooooooooooooooong text',
    },
    {
      'value': 'starValue',
      'label': 'Star Label',
    },
  ];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '2');

    _getValue();
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        controller?.text = 'circleValue';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Evaluer Mission "),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: oFormKey,
          child: Column(
            children: <Widget>[
              SelectFormField(
                type: SelectFormFieldType.dropdown,
                controller: controller,
                labelText: 'Shape',
                items: items,
                onChanged: (val) => setState(() => valueChanged = val),
                validator: (val) {
                  setState(() => valueToValidate = val ?? '');
                  return null;
                },
                onSaved: (val) => setState(() => valueSaved = val ?? ''),
              ),
              SelectableText(valueChanged),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final loForm = oFormKey.currentState;

                  if (loForm?.validate() == true) {
                    loForm?.save();
                    debugPrint(valueSaved);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
