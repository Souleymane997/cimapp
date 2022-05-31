import 'dart:async';
import 'dart:convert';
import 'package:cimapp/widgets/loginpage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../config.dart';
import '../models/bg.dart';
import '../models/colors.dart';
import '../models/custom_text.dart';
import '../models/dialoguetoast.dart';
import '../models/slidepage.dart';
import '../models/textfield.dart';
import 'package:http/http.dart' as http;

import '../modelsrequest/loginresponse.dart';
import '../modelsrequest/registerreponse.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  bool isHidden = true;
  bool isHiddenconfirm = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Background(),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: registerContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerContainer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: CustomText(
              'Créer un Compte ',
              tex: 2.3,
              family: "Captain",
              color: bleuClaire(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputContainer(
                    child: TextFormField(
                      controller: nomController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      maxLines: 1,
                      onSaved: (onSavedval) {
                        nomController.text = onSavedval!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        prefixIcon: const Icon(Icons.person),
                        prefixIconColor: bleuClaire(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputContainer(
                    child: TextFormField(
                      controller: prenomController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your lastname';
                        }
                        return null;
                      },
                      maxLines: 1,
                      onSaved: (onSavedval) {
                        prenomController.text = onSavedval!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your lastname',
                        prefixIcon: const Icon(Icons.person),
                        prefixIconColor: bleuClaire(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputContainer(
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Please enter a valid email",
                      maxLines: 1,
                      onSaved: (onSavedval) {
                        emailController.text = onSavedval!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        prefixIcon: const Icon(Icons.email),
                        prefixIconColor: bleuClaire(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputContainer(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      maxLines: 1,
                      onSaved: (onSavedval) {
                        passwordController.text = onSavedval!;
                      },
                      controller: passwordController,
                      obscureText: isHidden,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        prefixIconColor: bleuClaire(),
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                          color: bleuClaire(),
                          icon: Icon(isHidden
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputContainer(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value != passwordController.text) {
                          return 'Please confirm your password';
                        }
                        return null;
                      },
                      maxLines: 1,
                      controller: confirmpasswordController,
                      onSaved: (onSavedval) {
                        confirmpasswordController.text = onSavedval!;
                      },
                      obscureText: isHiddenconfirm,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        prefixIconColor: bleuClaire(),
                        hintText: 'Confirm your password',
                        suffixIcon: IconButton(
                          color: bleuClaire(),
                          icon: Icon(isHiddenconfirm
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isHiddenconfirm = !isHiddenconfirm;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    child: CustomText("Sign up", color: blanc(), tex: 1.5),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15.0),
                      primary: bleuClaire(),
                      onPrimary: Colors.white,
                      shadowColor: bleuFonce(),
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      register();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        "Already registered?",
                        color: noir(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: CustomText(
                          'Sign in',
                          color: bleuClaire(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  register() async {
    if (validateAndSave()) {
      var client = http.Client();
      var url = Uri.parse(Config.apiURL + Config.registerAPI);
      var response = await client.post(
        url,
        body: jsonEncode({
          'nom': nomController.text,
          'prenom': prenomController.text,
          'email': emailController.text,
          'pass': passwordController.text
        }),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        // ignore: unused_local_variable
        RegisterResponseModel resPonse1 =
            registerResponseJson(response.body.toString());
        DInfo.toastSuccess("Compte crée avec success");

        Timer(
            const Duration(milliseconds: 250),
            () => {
                  Navigator.of(context).push(
                    SlideRightRoute(
                        child: const LoginPage(),
                        page: const LoginPage(),
                        direction: AxisDirection.right),
                  )
                });
      }
    } else {
      DInfo.toastError(" Remplissez les champs SVP ");
    }
  }
}
