import 'dart:async';
import 'package:cimapp/models/colors.dart';
import 'package:cimapp/widgets/hompage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart';
import '../models/bg.dart';
import '../models/custom_text.dart';
import '../models/infos.dart';
import '../models/slidepage.dart';
import 'package:http/http.dart' as http;
import '../models/dialoguetoast.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SharedPreferences? saveDataUser ;
  late SharedPreferences loginData;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool newUser;

  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  late var Response;

  bool isHidden = true;
  bool isInAsynCall = false;

  @override
  void initState() {
    isInAsynCall = false;
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    saveDataUser = await SharedPreferences.getInstance();
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login') ?? true);

    if (newUser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    clearData(saveDataUser!) ;
    super.dispose();
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
                bgGround(context),
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
                  tex: TailleText(context).titre + 0.3,
                  color: bleuClaire(),
                  family: "Captain",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 20),
              child: CustomText(
                'Se Connecter ',
                tex: TailleText(context).titre * 1.8,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          onChanged: (value) {},
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'entrer votre identifiant SVP !!';
                            }
                            return null;
                          },
                          maxLines: 1,
                          onSaved: (onSavedval) {
                            emailController.text = onSavedval!;
                          },
                          style: TextStyle(color: bleuClaire()),
                          decoration: const InputDecoration(
                              hintText: "identifiant",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(70.0)))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          maxLines: 1,
                          controller: passwordController,
                          onSaved: (onSavedval) {
                            passwordController.text = onSavedval!;
                          },
                          obscureText: isHidden,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'entrer votre mot de passe SVP !!';
                            }
                            return null;
                          },
                          style: TextStyle(color: bleuClaire()),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              prefixIconColor: bleuClaire(),
                              hintText: 'mot de passe',
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
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(70.0)))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        child: CustomText("Login",
                            color: blanc(),
                            tex: TailleText(context).titre + 0.3),
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
                          login();
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
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

  //* verifie l'identifiant et le mot de passe dans la base de donnée
  login() async {
    if (validateAndSave()) {
      setState(() {
        isInAsynCall = true;
      });

      var client = http.Client();
      var url = Uri.parse(Config.apiURL +
          Config.apiLogin +
          emailController.text +
          "/" +
          passwordController.text);

      var response = await client.get(url);
      Response = response;

      if (response.body.isNotEmpty) {

        saveData(saveDataUser!,Response);

        DInfo.toastSuccess("Connecté avec success");


        setState(() {
          isInAsynCall = false;
          loginData.setBool('login',false) ;
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
        DInfo.toastError(" identifiant ou mot de passe invalide ");
      }
    } else {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        DInfo.toastError(" identifiant ou mot de passe invalide ");
      } else {
        DInfo.toastError(" Remplissez les champs SVP ");
      }
    }
  }

}
