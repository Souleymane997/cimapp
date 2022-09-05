import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  void checkLogin() async {
    Timer(
        const Duration(seconds: 3),
        () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()))
            });
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.teal[300],
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: MediaQuery.of(context).size.height * 0.18),
                Center(
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/logo.jpg'),
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                Container(height: MediaQuery.of(context).size.height * 0.20),
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  progressCircular() async {
    Timer(
        const Duration(milliseconds: 50),
        () => {
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            });
  }
}
