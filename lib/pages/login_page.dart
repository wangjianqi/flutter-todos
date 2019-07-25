import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/global_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String image = "";
  String accountName = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    final globalModel = Provider.of<GlobalModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("登录测试"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(accountName),
              accountEmail: Text(email),
              currentAccountPicture: Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  child: image.isEmpty ? SizedBox() : Image.network(image),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            Container(
              child: FlatButton(
                  onPressed: () async {
                    try {
                      final data = await globalModel.googleSignIn.signIn();
                      accountName = data.displayName;
                      email = data.email;
                      image = data.photoUrl;
                      setState(() {

                      });
                      print("谷歌登录:${data}");
                    } catch (error) {
                      print(error);
                    }

                  },
                  child: Text("Google登录")),
            ),
            Container(
              child: FlatButton(onPressed: () async {}, child: Text("微信登录")),
            ),
          ],
        ),
      ),
    );
  }
}
