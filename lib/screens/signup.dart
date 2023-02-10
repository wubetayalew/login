import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_geze/main.dart';
import 'package:user_geze/models/user_model.dart';
import 'package:user_geze/repositry/firebase/firebase_auth_method.dart';
import 'package:user_geze/repositry/firebase/firebase_storage_methods.dart';
import 'package:user_geze/repositry/firebase/firebase_user_repo.dart';

import 'package:user_geze/screens/home_an.dart';
import 'package:user_geze/screens/index.dart';
import 'package:user_geze/screens/login.dart';

import 'package:user_geze/utils/utils.dart';
import 'package:user_geze/widget/figerprint_signup.dart';
import 'package:uuid/uuid.dart';

import '../widget/Appbar Widget/appbar_button.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  static const route = "signup";

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();

    super.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await FirebaseAuthMethod().signUpUser(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      password: passwordController.text,
      email: emailController.text.trim(),
    );
    setState(() {
      _isLoading = false;
    });
    if (res != "success") {
      showSnackBar(res, context);
    } else {
      showSnackBar(res, context);
      Navigator.pushNamed(context, HomeAn.route);
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
                        'Sign Up',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.orange,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      (_image != null)
                          ? Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white38, width: 5.0),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: MemoryImage(_image!))),
                            )
                          : Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white38, width: 5.0),
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('images/person6.jpg'))),
                            ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(
                              Icons.camera,
                              size: 30,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 405,
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
                            controller: firstNameController,
                            autofocus: false,
                            decoration: const InputDecoration(
                              label: Text('First Name'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: lastNameController,
                            autofocus: false,
                            decoration: const InputDecoration(
                              label: Text('Last Name'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
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
                            autofocus: false,
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text('Password'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: repasswordController,
                            autofocus: false,
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text('Re-Password'),
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
                                    onPressed: signUpUser,
                                    child: _isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : const Text("Sign up")),
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
                              child: Text('Or Sign Up With'),
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
                          "Already Have An Account?",
                          style: TextStyle(color: Color.fromARGB(64, 0, 0, 0)),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, Login.route),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'dart:typed_data';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:user_geze/main.dart';
// import 'package:user_geze/models/user_model.dart';
// import 'package:user_geze/repositry/firebase/firebase_storage_methods.dart';
// import 'package:user_geze/repositry/firebase/firebase_user_repo.dart';
// import 'package:user_geze/screens/index.dart';
// import 'package:user_geze/screens/login.dart';
// import 'package:user_geze/signup_control.dart';
// import 'package:user_geze/utils/utils.dart';
// import 'package:user_geze/widget/figerprint_signup.dart';
// import 'package:uuid/uuid.dart';

// import '../widget/Appbar Widget/appbar_button.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});
//   static const route = "signup";

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final repasswordController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   Uint8List? _image;
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     repasswordController.dispose();

//     super.dispose();
//   }

//   void selectImage() async {
//     Uint8List im = await pickImage(ImageSource.gallery);
//     setState(() {
//       _image = im;
//     });
//   }

//   Future signUp() async {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => const Center(
//               child: CircularProgressIndicator(),
//             ));

//     try {
//       // await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       //     email: emailController.text.trim(),
//       //     password: passwordController.text.trim());

//       UserModel user = UserModel(
//           identification: FirebaseAuth.instance.currentUser!.uid,
//           firstName: firstNameController.text.trim(),
//           lastName: lastNameController.text.trim(),
//           email: emailController.text.trim(),
//           userCreated: DateTime.now().toString()..substring(0, 10));

//       print(user.toJson());
//       // await FirebaseUserRepo().registerNewUser(user);
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
//                 Navigator.pushReplacementNamed(context, Signup.route);
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
//     // navigatorKey.currentState!.popUntil((route) => route.isFirst);

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
//                         'Sign Up',
//                         style: TextStyle(
//                             decoration: TextDecoration.none,
//                             color: Colors.orange,
//                             fontSize: 27,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 70,
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
//                     height: 40,
//                   ),
//                   Stack(
//                     alignment: AlignmentDirectional.bottomEnd,
//                     children: [
//                       (_image != null)
//                           ? Container(
//                               width: 150,
//                               height: 150,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: Colors.white38, width: 5.0),
//                                   shape: BoxShape.circle,
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: MemoryImage(_image!))),
//                             )
//                           : Container(
//                               width: 150,
//                               height: 150,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: Colors.white38, width: 5.0),
//                                   shape: BoxShape.circle,
//                                   image: const DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: AssetImage('images/person6.jpg'))),
//                             ),
//                       Container(
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                         child: IconButton(
//                             onPressed: selectImage,
//                             icon: const Icon(
//                               Icons.camera,
//                               size: 30,
//                             )),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     // height: 405,
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
//                             controller: firstNameController,
//                             autofocus: false,
//                             decoration: const InputDecoration(
//                               label: Text('First Name'),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             controller: lastNameController,
//                             autofocus: false,
//                             decoration: const InputDecoration(
//                               label: Text('Last Name'),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
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
//                             autofocus: false,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               label: Text('Password'),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             controller: repasswordController,
//                             autofocus: false,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               label: Text('Re-Password'),
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
//                                       signUp();

//                                       Navigator.pushNamed(
//                                           context, SignupControl.route);
//                                     },
//                                     child: const Text("Sign up")),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.fromLTRB(0, 0, 10, 13),
//                                 child: IconButton(
//                                   onPressed: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (_) =>
//                                             const FingerprintSignup());
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
//                               child: Text('Or Sign Up With'),
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
//                           "Already Have An Account?",
//                           style: TextStyle(color: Color.fromARGB(64, 0, 0, 0)),
//                         ),
//                         TextButton(
//                           onPressed: () => Navigator.pushReplacementNamed(
//                               context, Login.route),
//                           child: const Text(
//                             "Sign In",
//                             style: TextStyle(color: Colors.orange),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
