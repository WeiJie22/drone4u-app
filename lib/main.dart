import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:drone4u/constant/constant.dart';
import 'package:drone4u/constant/routes.dart';
import 'package:drone4u/screens/d4u_sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:drone4u/services/widget_tree.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: D4uRouter.generateRoute,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: d4uPrimaryColor),
      ),
      initialRoute: '/',
      home: const WidgetTree(),
      navigatorKey: navigatorKey,
    );
  }
}
