import 'package:flutter/material.dart';
import 'package:moviesplus/screens/movies/entry_screen.dart';
import 'package:moviesplus/utils/essentials.dart';
import './utils/routes.dart' as rt;
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

Function duringSplash = () {
  //Write your code here
  print('loading');
};

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: new MoviesEntryScreen(),
          title: new Text(
            'Welcome In Movies Plus',
            style: AppTextStyles.bodyText
                .copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          // image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
          backgroundColor: AppColors.offWhite,
          loadingText: Text('Developed by Phemmyadot'),
          styleTextUnderTheLoader: AppTextStyles.bodyText,
          photoSize: 100.0,
          // onClick: () => print("Flutter Egypt"),
          loaderColor: AppColors.green_ming),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: '/movies-entry',
      routes: rt.routes,
    );
  }
}
