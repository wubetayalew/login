import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:user_geze/repositry/firebase/firebase_auth_method.dart';

import 'package:user_geze/screens/home_an.dart';
import 'package:user_geze/screens/index.dart';
import 'package:user_geze/screens/signup.dart';
import 'package:user_geze/utils/utils.dart';

import '../widget/Appbar Widget/appbar_button.dart';
import '../widget/fingerprint_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const route = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await FirebaseAuthMethod().loginUser(
        email: emailController.text.trim(), password: passwordController.text);

    setState(() {
      _isLoading = false;
    });
    if (res != "Success") {
      showSnackBar(res, context);
    } else {
      showSnackBar(res, context);
      Navigator.pushNamed(context, HomeAn.route);
      print("Should br logging");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: SafeArea(
            top: true,
            bottom: false,
            left: false,
            right: false,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      AppBarButton(
                        callback: () => Navigator.pushReplacementNamed(
                            context, Index.route),
                        icon: Icons.arrow_back_ios_new_sharp,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      const Text(
                        'Log In',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.orange,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 150,
                    height: 150,
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
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    // height: 280,
                    width: 370,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        // color: Colors.amber
                        border: Border.all(
                            color: const Color.fromARGB(47, 0, 0, 0),
                            width: 0.01,
                            style: BorderStyle.solid),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(19, 0, 0, 0),
                              offset: Offset(0.5, 0.5),
                              blurRadius: 0.5,
                              spreadRadius: 1),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0)
                        ]),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            autofocus: false,
                            decoration: const InputDecoration(
                              label: Text('Email or Phone Number'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            autofocus: false,
                            decoration: const InputDecoration(
                              label: Text('Password'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(color: Colors.orange),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 150,
                                height: MediaQuery.of(context).size.width / 8,
                                child: ElevatedButton(
                                    onPressed: loginUser,
                                    child: (_isLoading)
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text("Sign in")),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 370,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(
                                child: SizedBox(
                                    width: 40,
                                    child: Divider(
                                      thickness: 2,
                                    ))),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text('Or LogIn With'),
                            ),
                            Expanded(
                                child: SizedBox(
                                    width: 40,
                                    child: Divider(
                                      thickness: 2,
                                    )))
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.facebook),
                              color: Colors.orange,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook),
                                color: Colors.orange),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook),
                                color: Colors.orange),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook),
                                color: Colors.orange),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Don't Have An Account?",
                          style: TextStyle(color: Color.fromARGB(64, 0, 0, 0)),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, Signup.route),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:user_geze/login_control.dart';
// import 'package:user_geze/responsive.dart';
// import 'package:user_geze/screens/index.dart';
// import 'package:user_geze/screens/signup.dart';

// import '../widget/Appbar Widget/appbar_button.dart';
// import '../widget/fingerprint_login.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});
//   static const route = "login";

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();

//     super.dispose();
//   }

//   Future signIn() async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim());
//     } catch (e) {
//       print(e.toString());
//       showDialog(
//         context: context,
//         builder: (ctx) => AlertDialog(
//           title: const Text(
//             "Faild",
//             style: TextStyle(color: Colors.red),
//           ),
//           content: Text(e.toString().substring(30)),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 // FirebaseAuth.instance.signOut();
//                 Navigator.pushReplacementNamed(context, Login.route);
//               },
//               child: Container(
//                 // color: Colors.green,
//                 padding: const EdgeInsets.all(14),
//                 child: const Text("Okay"),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     // await FirebaseAuth.instance.signOut();

//     print('object');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.white,
//           child: SafeArea(
//             top: true,
//             bottom: false,
//             left: false,
//             right: false,
//             child: Container(
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       AppBarButton(
//                         callback: () => Navigator.pushReplacementNamed(
//                             context, Index.route),
//                         icon: Icons.arrow_back_ios_new_sharp,
//                       ),
//                       const SizedBox(
//                         width: 50,
//                       ),
//                       const Text(
//                         'Log In',
//                         style: TextStyle(
//                             decoration: TextDecoration.none,
//                             color: Colors.orange,
//                             fontSize: 27,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 100,
//                   ),
//                   Container(
//                     width: 150,
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                       color: Colors.orange,
//                       width: 3.0,
//                     )),
//                     child: const Center(
//                       child: Text(
//                         'Geze',
//                         style: TextStyle(
//                             decoration: TextDecoration.none,
//                             color: Colors.orange,
//                             fontSize: 50,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     'Geze Online Marketing',
//                     style: TextStyle(
//                         decoration: TextDecoration.none,
//                         color: Color.fromARGB(96, 0, 0, 0),
//                         fontSize: 15),
//                   ),
//                   const SizedBox(
//                     height: 60,
//                   ),
//                   Container(
//                     // height: 280,
//                     width: 370,
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(5)),
//                         // color: Colors.amber
//                         border: Border.all(
//                             color: const Color.fromARGB(47, 0, 0, 0),
//                             width: 0.01,
//                             style: BorderStyle.solid),
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Color.fromARGB(19, 0, 0, 0),
//                               offset: Offset(0.5, 0.5),
//                               blurRadius: 0.5,
//                               spreadRadius: 1),
//                           BoxShadow(
//                               color: Colors.white,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 0.0,
//                               spreadRadius: 0.0)
//                         ]),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 30, horizontal: 10),
//                       child: Column(
//                         children: [
//                           TextField(
//                             controller: emailController,
//                             autofocus: false,
//                             decoration: const InputDecoration(
//                               label: Text('Email or Phone Number'),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             controller: passwordController,
//                             obscureText: true,
//                             autofocus: false,
//                             decoration: const InputDecoration(
//                               label: Text('Password'),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const Align(
//                               alignment: Alignment.centerRight,
//                               child: Text(
//                                 "Forget Password?",
//                                 style: TextStyle(color: Colors.orange),
//                               )),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SizedBox(
//                                 width: 280,
//                                 height: 50,
//                                 child: ElevatedButton(
//                                     onPressed: () {
//                                       print(emailController.text.trim());
//                                       print(passwordController.text.trim());
//                                       signIn();
//                                       Navigator.pushNamed(
//                                           context, LoginControl.route);
//                                     },
//                                     child: const Text("Sign in")),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.fromLTRB(0, 0, 10, 13),
//                                 child: IconButton(
//                                   onPressed: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (_) =>
//                                             const FingerprintLogin());
//                                   },
//                                   icon: const Icon(
//                                     Icons.fingerprint,
//                                     size: 50,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   SizedBox(
//                     width: 370,
//                     child: Column(
//                       children: [
//                         Row(
//                           children: const [
//                             Expanded(
//                                 child: SizedBox(
//                                     width: 40,
//                                     child: Divider(
//                                       thickness: 2,
//                                     ))),
//                             Padding(
//                               padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
//                               child: Text('Or LogIn With'),
//                             ),
//                             Expanded(
//                                 child: SizedBox(
//                                     width: 40,
//                                     child: Divider(
//                                       thickness: 2,
//                                     )))
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconButton(
//                               onPressed: () {},
//                               icon: const Icon(Icons.facebook),
//                               color: Colors.orange,
//                             ),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.facebook),
//                                 color: Colors.orange),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.facebook),
//                                 color: Colors.orange),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.facebook),
//                                 color: Colors.orange),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         const Text(
//                           "Don't Have An Account?",
//                           style: TextStyle(color: Color.fromARGB(64, 0, 0, 0)),
//                         ),
//                         TextButton(
//                           onPressed: () => Navigator.pushReplacementNamed(
//                               context, Signup.route),
//                           child: const Text(
//                             "Sign Up",
//                             style: TextStyle(color: Colors.orange),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
