import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:user_geze/screens/login.dart';
import 'package:user_geze/screens/signup.dart';

class Index extends StatelessWidget {
  const Index({super.key});
  static const route = "index";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                const Expanded(flex: 5, child: SizedBox()),
                Center(
                  child: Column(children: [
                    Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                          // border: Border.all(
                          //     color: Color.fromARGB(198, 255, 153, 0),
                          //     width: 10.0),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              // fit: BoxFit.cover,
                              image: AssetImage('images/mobile.jpg'))),
                    ),
                    const Text(
                      'Mobile Computing',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(96, 0, 0, 0),
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
                ),
                const Expanded(flex: 20, child: SizedBox()),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.width / 8,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, Login.route),
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.width / 8,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, Signup.route),
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
