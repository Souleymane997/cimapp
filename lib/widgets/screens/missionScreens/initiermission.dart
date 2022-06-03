import 'package:cimapp/models/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class InitierMissionPage extends StatefulWidget {
  const InitierMissionPage({Key? key}) : super(key: key);

  @override
  State<InitierMissionPage> createState() => _InitierMissionPageState();
}

class _InitierMissionPageState extends State<InitierMissionPage> {
  
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  String valueChanged = '';
  String valueToValidate = '';
  String valueSaved = '';
  TextEditingController typeMissionController = TextEditingController();
  TextEditingController motifMissionController = TextEditingController();
  TextEditingController demandeurController = TextEditingController();
  TextEditingController ordreMissionController = TextEditingController();
  TextEditingController initiateurController = TextEditingController();
  TextEditingController exerciceController = TextEditingController();

  bool checkbox = true;

  GlobalKey<FormState> oFormKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> motifMission = [
    {
      'value': 1,
      'label': 'Seminaire',
    },
    {
      'value': 2,
      'label': 'Colloque',
    },
    {
      'value': 3,
      'label': 'Formation',
    },
  ];

  final List<Map<String, dynamic>> initiateurMission = [
    {
      'value': 1,
      'label': 'Souleymane',
    },
    {
      'value': 2,
      'label': 'Mr Antoine',
    },
    {
      'value': 3,
      'label': 'Mr Soma',
    },
  ];

  final List<Map<String, dynamic>> ordreMission = [
    {
      'value': 1,
      'label': 'Individuel',
    },
    {
      'value': 2,
      'label': 'Groupé',
    },
  ];

  final List<Map<String, dynamic>> svecDemandeur = [
    {
      'value': 1,
      'label': 'DSA',
    },
    {
      'value': 2,
      'label': 'DSI',
    },
  ];

  final List<Map<String, dynamic>> typeMission = [
    {
      'value': 1,
      'label': 'Mission interne',
    },
    {
      'value': 2,
      'label': 'Mission externe',
    },
  ];

  @override
  void initState() {
    exerciceController = TextEditingController(text: "2022");
    initiateurController = TextEditingController(text: "1");

    _getValue();
    super.initState();
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        initiateurController.text = "Souleymane";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          "Initier Mission ",
          tex: 1.2,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: stepperType,
              physics: const ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: cancel,
              steps: <Step>[
                Step(
                  title: (_currentStep < 1)
                      ? const Text('Informations')
                      : const Text(''),
                  content: Form(
                    key: oFormKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SelectFormField(
                                type: SelectFormFieldType.dropdown,
                                controller: typeMissionController,
                                labelText: 'Type de Mission ',
                                items: typeMission,
                                onChanged: (val) => setState(() {
                                  typeMissionController.text = val;
                                  debugPrint(typeMissionController.text);
                                }),
                                validator: (val) {
                                  setState(() {
                                    typeMissionController.text = val ?? '';
                                  });

                                  return null;
                                },
                                onSaved: (val) => setState(() =>
                                    typeMissionController.text = val ?? ''),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SelectFormField(
                                type: SelectFormFieldType.dropdown,
                                controller: motifMissionController,
                                labelText: 'Motif de Mission ',
                                items: motifMission,
                                onChanged: (val) => setState(() {
                                  motifMissionController.text = val;
                                  debugPrint(motifMissionController.text);
                                }),
                                validator: (val) {
                                  setState(() {
                                    motifMissionController.text = val ?? '';
                                  });

                                  return null;
                                },
                                onSaved: (val) => setState(() =>
                                    motifMissionController.text = val ?? ''),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 10.0,
                        ),
                        TextFormField(
                          maxLines: 2,
                          decoration: const InputDecoration(
                              labelText: 'Objet de la Mission'),
                        ),
                        Container(
                          height: 10.0,
                        ),
                        TextFormField(
                          maxLines: 2,
                          decoration:
                              const InputDecoration(labelText: 'Description'),
                        ),
                        Container(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SelectFormField(
                                type: SelectFormFieldType.dropdown,
                                controller: demandeurController,
                                labelText: 'Svce. Demandeur',
                                items: svecDemandeur,
                                onChanged: (val) => setState(() {
                                  demandeurController.text = val;
                                  debugPrint(demandeurController.text);
                                }),
                                validator: (val) {
                                  setState(() {
                                    demandeurController.text = val ?? '';
                                  });

                                  return null;
                                },
                                onSaved: (val) => setState(
                                    () => demandeurController.text = val ?? ''),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SelectFormField(
                                type: SelectFormFieldType.dropdown,
                                controller: ordreMissionController,
                                labelText: 'Type ordre de Mission',
                                items: ordreMission,
                                onChanged: (val) => setState(() {
                                  ordreMissionController.text = val;
                                  debugPrint(ordreMissionController.text);
                                }),
                                validator: (val) {
                                  setState(() {
                                    ordreMissionController.text = val ?? '';
                                  });

                                  return null;
                                },
                                onSaved: (val) => setState(() =>
                                    ordreMissionController.text = val ?? ''),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: SelectFormField(
                                type: SelectFormFieldType.dropdown,
                                controller: initiateurController,
                                labelText: 'Initiateur',
                                items: initiateurMission,
                                onChanged: (val) => setState(() {
                                  initiateurController.text = val;
                                  debugPrint(initiateurController.text);
                                }),
                                validator: (val) {
                                  setState(() {
                                    initiateurController.text = val ?? '';
                                  });

                                  return null;
                                },
                                onSaved: (val) => setState(() =>
                                    initiateurController.text = val ?? ''),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: exerciceController,
                                decoration: const InputDecoration(
                                    labelText: 'Exer. budgetaire'),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Row(
                                children: [
                                  const Text('Avec incid. fin.'),
                                  Container(
                                    width: 10.0,
                                  ),
                                  Checkbox(
                                    value: checkbox,
                                    onChanged: (value) {
                                      setState(() {
                                        checkbox = !checkbox;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: (_currentStep > 0 && _currentStep < 2)
                      ? const Text('Budget')
                      : const Text(''),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Home Address'),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Postcode'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: (_currentStep > 1)
                      ? const Text('Participants')
                      : const Text(''),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Mobile Number'),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    child: const Icon(Icons.send),
                    onPressed: () {
                      debugPrint("hello");
                    },
                  ),
                  Container(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
