import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testapp/controller.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: kIsWeb ? webNav(): <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.settings),
              onTap: (){},
            )
          ],
        ),
      ),      
    );
  }

  List<Widget> webNav()
  {
    return [
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            children: <Widget>[
              Flexible(
                child: Image.asset('assets/images/logo.png'),
              ),
            ],
          ),
        ),
      ),
      ListTile(
        title: Text('All Jobs'),
        leading: Icon(Icons.work),
        onTap: (){
          Controller.selectedScreen = 0;
          setState(() {
            
          });
        },
      ),
      ListTile(
        title: Text('My Account'),
        leading: Icon(Icons.account_box),
        onTap: (){
          Controller.selectedScreen = 1;
          
          setState(() {
            
          });
        },
      ),
      ListTile(
        title: Text('Account History'),
        leading: Icon(Icons.history),
        onTap: (){
          Controller.selectedScreen = 2;
          setState(() {
            
          });
        },
      ),
      ListTile(
        title: Text('Contact Us'),
        leading: Icon(Icons.contact_mail),
        onTap: (){
          Controller.selectedScreen = 3;
          print(Controller.selectedScreen);
          setState(() {
            
          });
        },
      ),
    ];
  }
}