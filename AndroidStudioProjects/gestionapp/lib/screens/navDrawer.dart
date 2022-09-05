// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../component/custom_text.dart';


class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key, required this.choix}) : super(key: key);
  final int choix;

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/logo.jpg'),
                            fit: BoxFit.contain,
                          )),
                    ),
                  ),
                  Container(height: 5.0),
                  CustomText(
                    "Gestion de Stock",
                    color: Colors.white,
                    tex: 1.2,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
            ),
          ),
          (widget.choix == 1)
              ? ListTile(
                  title: const Text("A propos"),
                  leading: const Icon(Icons.info),
                  onTap: () {},
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (widget.choix == 1)
              ? const Divider(
                  color: Colors.teal,
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (widget.choix == 0)
              ? ListTile(
                  onTap: () {},
                  title: const Text("Se connecter"),
                  leading: const Icon(Icons.login),
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (widget.choix == 0)
              ? const Divider(
                  color: Colors.teal,
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (widget.choix == 1)
              ? ListTile(
                  onTap: () {},
                  title: const Text(
                    "Se deconnecter",
                    style: TextStyle(color: Colors.red),
                  ),
                  leading: const Icon(
                    Icons.login,
                    color: Colors.red,
                  ),
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (widget.choix == 1)
              ? const Divider(
                  color: Colors.teal,
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
        ],
      ),
    );
  }
}
