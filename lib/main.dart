import 'package:ecom_app/consts/weboptions.dart';
import 'package:ecom_app/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'consts/consts.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    //intialize the web
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Weboptions.apiKey,
            appId: Weboptions.appId,
            messagingSenderId: Weboptions.messagingSenderId,
            projectId: Weboptions.projectId));
  } else {
    // initialize for android and ios
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //we are using getx so we have to change this material app into getmaterialapp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            //to set appbar icons color
            iconTheme: IconThemeData(
              color: darkFontGrey,
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
