import 'package:flutter/material.dart';
import 'package:gobexpress/src/Config/AppConstants.dart';
import 'package:gobexpress/src/presentation/WebView/MyHomePage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isConnected = true;
  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  checkInternet() async {
    bool result = await InternetConnection().hasInternetAccess;
    setState(() {
      isConnected = result;
    });
  }

  @override
  void dispose() {
    super.dispose();
    checkInternet().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.title,
      home: Scaffold(body: MyHomePage()
          // Visibility(
          //   visible: isConnected,
          //   replacement: const NoInternetPage(),
          //   child: const MyHomePage(),
          // ),
          ),
    );
  }
}
