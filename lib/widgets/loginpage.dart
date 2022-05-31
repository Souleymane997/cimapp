import 'dart:async';
import 'package:cimapp/models/colors.dart';
import 'package:cimapp/models/textfield.dart';
import 'package:cimapp/modelsrequest/loginresponse.dart';
import 'package:cimapp/widgets/hompage.dart';
import 'package:cimapp/widgets/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../config.dart';
import '../models/bg.dart';
import '../models/custom_text.dart';
import '../models/slidepage.dart';
import 'package:http/http.dart' as http;
import '../models/dialoguetoast.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHidden = true;
  bool isInAsynCall = false;

  @override
  void initState() {
    isInAsynCall = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: isInAsynCall,
          child: SafeArea(
            child: Stack(
              children: [
                Background(),
                loginContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginContainer() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7.5,
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: bleuClaire(),
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    "images/logo.png",
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                CustomText(
                  "CIM",
                  tex: 1.5,
                  color: bleuClaire(),
                  family: "Captain",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 20),
              child: CustomText(
                'Se Connecter ',
                tex: 2.3,
                color: bleuClaire(),
                family: "Captain",
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
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
                        controller: passwordController,
                        onSaved: (onSavedval) {
                          passwordController.text = onSavedval!;
                        },
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
                    ElevatedButton(
                        child: CustomText("Login", color: blanc(), tex: 1.5),
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
                          Navigator.of(context).push(
                            SlideRightRoute(
                                child: const HomePage(),
                                page: const HomePage(),
                                direction: AxisDirection.left),
                          );
                          //login();
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          "Not registered yet ?",
                          color: noir(),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              SlideRightRoute(
                                  child: const RegisterPage(),
                                  page: const RegisterPage(),
                                  direction: AxisDirection.left),
                            );
                          },
                          child: CustomText(
                            ' Create an account',
                            color: bleuFonce(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //* verifie les champs de saisie

  bool validateAndSave() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  //* verifie l'email et le mot de passe dans la base de donnée
  login() async {
    if (validateAndSave()) {
      setState(() {
        isInAsynCall = true;
      });

      var client = http.Client();
      var url = Uri.parse(Config.apiURL +
          Config.loginAPI +
          emailController.text +
          "/" +
          passwordController.text);
      var response = await client.get(url);

      if (response.body.isNotEmpty) {
        DInfo.toastSuccess("Connecté avec success");

        setState(() {
          isInAsynCall = false;
        });

        Timer(
            const Duration(milliseconds: 100),
            () => {
                  Navigator.of(context).push(
                    SlideRightRoute(
                        child: const HomePage(),
                        page: const HomePage(),
                        direction: AxisDirection.left),
                  ),
                });
      } else {
        setState(() {
          isInAsynCall = false;
        });
        DInfo.toastError(" Invalid email or password ");
      }
    } else {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        DInfo.toastError("Invalid email or password ");
      } else {
        DInfo.toastError(" Remplissez les champs SVP ");
      }
    }
  }

  a() {
    Navigator.of(context).pushReplacement(
      SlideRightRoute(
          child: const HomePage(),
          page: const HomePage(),
          direction: AxisDirection.left),
    );
  }

  //DInfo.closeDialog(1000,durationBeforeClose: const Duration(seconds: 1) , actionAfterClose : a );

}
