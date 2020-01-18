import 'package:animations/keys.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Examples"),
            elevation: 0.0,
          ),
          ListTile(
            title: Text(
              "Implicit animations",
              style: TextStyle(
                color: Keys.DEFAULT_COLOR,
              ),
            ),
            leading: Icon(
              Icons.code,
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/implicit');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Staggered animations",
              style: TextStyle(
                color: Keys.DEFAULT_COLOR,
              ),
            ),
            leading: Icon(
              Icons.code,
            ),
            onTap: (){
              Navigator.pushNamed(context, '/staggered');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Rive animations",
              style: TextStyle(
                color: Keys.DEFAULT_COLOR,
              ),
            ),
            leading: Icon(
              Icons.code,
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/rive');
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
