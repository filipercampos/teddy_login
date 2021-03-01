import 'package:flutter/material.dart';
import 'package:teddylogin/app/app_module.dart';
import 'package:teddylogin/app/pages/login/login_module.dart';
import 'package:teddylogin/app/shared/services/navigate_service.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppModule.to.get<NavigateService>().globalKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginModule(),
    );
  }
}
