import 'package:flutter/material.dart';
import 'package:teddylogin/app/pages/login/login_module.dart';
import 'package:teddylogin/app/shared/blocs/auth_bloc.dart';
import 'package:teddylogin/app/shared/models/user_model.dart';
import 'package:teddylogin/app/shared/services/navigate_service.dart';

import '../../../app_module.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = AppModule.to.bloc();
    NavigateService service = AppModule.to.get();

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Finalizar sessão?"),
            content: new Text("Deseja sair da sessão?"),
            actions: <Widget>[
              FlatButton(
                child: new Text("NÂO"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text("SIM"),
                onPressed: () async {
                  authBloc.logoff();
                  Navigator.pop(context);
                  await Future.delayed(Duration(seconds: 1));
                  service.pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginModule(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          StreamBuilder<UserModel>(
            stream: authBloc.userOut,
            initialData: UserModel(email: "", name: ""),
            builder: (context, snapshot) {
              return UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(93, 142, 155, 1.0)),
                accountEmail: Text(snapshot?.data?.email ?? ""),
                accountName: Text(snapshot?.data?.name ?? ""),
              );
            },
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              _showDialog();
            },
          )
        ],
      ),
    );
  }
}
