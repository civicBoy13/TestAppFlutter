import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Screens/main_screen.dart';

class LoginScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() =>LoginScreenState();
}
class LoginScreenState extends State<LoginScreen>{
  Size size;
  double _width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _width = size.width ;
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: form() + buttons(),
            ),
          ),
        ),
      ),
    );
  }


   List<Widget> form()
  {
    return [
      logo(),
      SizedBox(height: 15,),
      email(),
      SizedBox(height: 15,),
      password(),
      SizedBox(height: 40,),
    ];
  }

  List<Widget> buttons()
  {
    return [
      signInButton(),
      SizedBox(height: 15,),
      createAccountButton(),
      SizedBox(height: 2,),
      forgotPasswordButton()
    ];
  }

  Widget logo()
  {
    
    return Image.asset("assets/images/logo.png", height: _width > 600 ? 450: 300,width: _width > 600 ? 450 : 300,);
  }

  Widget email()
  {
    return Container(
      width: _width > 600 ? 600 : double.infinity ,
      child: TextFormField(
       
        decoration: InputDecoration(
          fillColor:  Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff4456F3)
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey
            )
          ),
          hintText: "Email",
        ),
        // validator: (val)=> !val.contains("@") ? "Invalid Email": null,
        // onSaved: (val) => _email = val,
      ),
    );
  }

  Widget password()
  {
    return Container(
      width: _width > 600 ? 600 : double.infinity ,
      child: TextFormField(
        
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTapDown: (_){},
            onTapUp: (_){},
            child: Icon(Icons.remove_red_eye),
          ),
          fillColor:  Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff4456F3)
            ),
          ),
            border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey
            )
          ),
          hintText: "Password",
        ),
        // validator: (val) => val.length < 6 ? "Password is too short":null,
        // onSaved: (val) => _password = val,
      ),
    );
  }

  Widget signInButton()
  {
    return RaisedButton(
      color: Color(0xff4456F3),
      onPressed: () {
        //validateAndSubmit();
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainScreen()));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(15),
      child: Container(
        
        width: _width > 600 ? 575 : double.infinity,
    
        child: Center(
          child: Text('Sign In',style: TextStyle(color: Colors.white, fontFamily: "ModernSans"),),
        ),
      )
    );
  }

  Widget createAccountButton()
  {
    return FlatButton(
      splashColor:Color(0xff4456F3),
      child: Text("Don't have an account? Create account",
        style: TextStyle(
          color: Colors.black
        ),
      ), 
      onPressed: () {
       // Navigator.push(context, MaterialPageRoute(builder: (context) =>  AccountChoiceScreen(auth: widget.auth)));
      },
    );
  }

  Widget forgotPasswordButton()
  {
    return FlatButton(
      splashColor:Color(0xff4456F3),
      child: Text("Forgot Password?",
        style: TextStyle(
          color: Colors.black
        ),
      ),
      onPressed: (){
        
      },
    );
  }



}