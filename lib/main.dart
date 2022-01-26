import 'package:carrolla/models/google_sign_in.dart';
import 'package:carrolla/models/mapdata.dart';

import 'package:flutter/material.dart';
import 'package:carrolla/views/Sign up/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

bool guestUser = false;
Mapdata mapdata = Mapdata();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUp(),
        ),
      );
}
