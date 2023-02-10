import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_geze/providers/user_provider.dart';

import 'package:flutter/foundation.dart';

import 'package:provider/provider.dart';
import 'package:user_geze/constants.dart';
import 'package:user_geze/screens/home_an.dart';

import 'package:user_geze/screens/index.dart';
import 'package:user_geze/screens/login.dart';

import 'package:user_geze/services/app_routes.dart';
import 'package:user_geze/services/app_theme.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
// void main(List<String> args) {
//   runApp(MyApp(appRouter: AppRouter()));
// }

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Geze Online Marketing',
        theme: AppThemes.appThemeData[AppTheme.lightTheme],
        // home: Index(),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const HomeAn();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                );
              }
              return const Index();
            }),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
