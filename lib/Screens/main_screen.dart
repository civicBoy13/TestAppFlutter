import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testapp/CustomComponents/customDrawer.dart';
import 'package:testapp/Screens/accountHistory_screen.dart';
import 'package:testapp/Screens/alljobs_screen.dart';
import 'package:testapp/Screens/contactUs_screen.dart';
import 'package:testapp/Screens/myAccount_screen.dart';

import '../controller.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Size size;
  double _width , _height;  
  List<StatefulWidget> _screens = [];
  Color contact, allgigs, account, history;
  bool contactHover = false, accountHover = false, historyHover = false, gigshover = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initScreens();
  }

  initScreens(){
    _screens.add(AllJobsScreen());
    _screens.add(MyAccountScreen());
    _screens.add(AccountHistoryScreen());
    _screens.add(ContactUsScreen());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _width = size.width ;
    _height = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _width < 730 && kIsWeb ? AppBar(
        backgroundColor:Colors.white ,
        elevation:  0,
        iconTheme: IconThemeData(
          color:Color(0xff4456F3)
        ),
      ) : kIsWeb ? null : AppBar(
        backgroundColor: Color(0xff4456F3),
      ),
      drawer: _width < 730 ?  Drawer(
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
      ):null,
      body: _width > 730 && kIsWeb ? layout(): _width < 730 ?  _screens[Controller.selectedScreen] : null,
      bottomNavigationBar: !kIsWeb ? bottomAppBar(): null,
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
          Navigator.pop(context);
          setState(() {
            
          });
        },
      ),
      ListTile(
        title: Text('My Account'),
        leading: Icon(Icons.account_box),
        onTap: (){
          Controller.selectedScreen = 1;
          Navigator.pop(context);
          setState(() {
            
          });
        },
      ),
      ListTile(
        title: Text('Account History'),
        leading: Icon(Icons.history),
        onTap: (){
          Controller.selectedScreen = 2;
          Navigator.pop(context);
          setState(() {
            
          });
        },
      ),
      ListTile(
        title: Text('Contact Us'),
        leading: Icon(Icons.contact_mail),
        onTap: (){
          Controller.selectedScreen = 3;
          Navigator.pop(context);
          setState(() {
            
          });
        },
      ),
    ];
  }

  Widget bottomAppBar()
  {
    return BottomAppBar(
      elevation: 10,
      shape: CircularNotchedRectangle(),
      notchMargin: 4,
      child: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar()
  {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      items: bottomNavigationBarItekms(),
      currentIndex: Controller.selectedScreen,
      onTap: (int index){
        setState(() {
          Controller.selectedScreen = index;
        });
      },
      selectedItemColor: Color(0xff4456F3),
      unselectedItemColor: Colors.grey,
    );
  }

  bottomNavigationBarItekms()
  {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.work),
        title: Text('All Gigs'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_box),
        title: Text('My Account'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.history),
        title: Text('Account History'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.contact_mail),
        title: Text('Contact Us'),
      ),
    ];
  }

  layout(){
    return Column(
      children: <Widget>[
        Expanded(
          flex: _height < 615 && _height > 385 ? 2 : _height < 385 ? 3 : 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset("assets/images/logoSide.png", height: 100, width: 300, fit:BoxFit.contain),
                Row(
                  children: <Widget>[
                    InkWell(
                       onHover:(bool value){
                        if(value){
                          allgigs = Colors.white;
                          gigshover = true;
                        }else{
                          allgigs = Colors.black;
                          gigshover = false;
                        }
                        setState(() {
                          
                        });
                      } ,
                      onTap: (){},
                      child: FlatButton(
                          hoverColor: Color(0xff4456F3),
                          textColor: Controller.selectedScreen == 0 && !gigshover ? Color(0xff4456F3):allgigs, 
                          child: Text("All Gigs"), 
                          onPressed: () {
                            Controller.selectedScreen = 0;
                            setState(() {
                            
                            });
                          },
                      ),
                    ),
                    InkWell(
                       onHover:(bool value){
                        if(value){
                          account = Colors.white;
                          accountHover = true;
                        }else{
                          account = Colors.black;
                          accountHover = false;
                        }
                        setState(() {
                          
                        });
                      } ,
                      onTap: (){},
                        child: FlatButton(
                        textColor: Controller.selectedScreen == 1 && !accountHover ? Color(0xff4456F3):account,
                        hoverColor: Color(0xff4456F3), 
                        child: Text("My Account"), 
                        onPressed: () {
                          Controller.selectedScreen = 1;
                          setState(() {
                          
                          });
                        },
                      ),
                    ),
                    InkWell(
                       onHover:(bool value){
                        if(value){
                          history = Colors.white;
                          historyHover = true;
                        }else{
                          history = Colors.black;
                          historyHover = false;
                        }
                        setState(() {
                          
                        });
                      } ,
                      onTap: (){},
                      child: FlatButton(
                        textColor: Controller.selectedScreen == 2 && !historyHover? Color(0xff4456F3):history,
                        hoverColor: Color(0xff4456F3), 
                        child: Text("Account History"), 
                        onPressed: () {
                          Controller.selectedScreen = 2;
                          setState(() {
                          
                          });
                        },
                      ),
                    ),
                    InkWell(
                      onHover:(bool value){
                        if(value){
                          contact = Colors.white;
                          contactHover = true;
                        }else{
                          contact = Colors.black;
                          contactHover = false;
                        }
                        setState(() {
                          
                        });
                      } ,
                      onTap: (){},
                      child: FlatButton(
                        textColor: Controller.selectedScreen == 3  && !contactHover? Color(0xff4456F3) : contact,
                        child: Text("Contact Us"),
                        hoverColor: Color(0xff4456F3), 
                        onPressed: () {
                          Controller.selectedScreen = 3;
                          setState(() {
                          
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: _height < 615 && _height > 385 ? 9 : _height < 385 ? 10:  8,
          child: _screens[Controller.selectedScreen],
        )
      ],
    );
  }
}