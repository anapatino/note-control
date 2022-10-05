import 'package:crud/domain/model/Users.dart';
import 'package:crud/ui/app.dart';
import 'package:crud/ui/pages/List.dart';
import 'package:crud/ui/pages/Login/Register.dart';
import 'package:crud/ui/pages/MessageResponse.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controlUser = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/light-1.png'))),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/light-2.png'))),
                      ),
                    ),
                    Positioned(
                      left: 350,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/clock.png'))),
                      ),
                    ),
                    Positioned(
                        child: Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Center(
                          child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromRGBO(255, 189, 189, .2)))),
                          child: TextField(
                            controller: controlUser,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "User",
                                hintStyle: TextStyle(color: Colors.grey[600])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromRGBO(143, 189, 189, .2)))),
                          child: TextField(
                            controller: controlPassword,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[600])),
                          ),
                        ),
                      ]),
                    ),
                    Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {
                          if (findUser(context, controlUser, controlPassword) ==
                              true) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => App()));
                          }
                          ;
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(143, 148, 251, .9),
                          onPrimary: Colors.white,
                          shadowColor: Color.fromRGBO(143, 148, 251, .6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          minimumSize: Size(500, 50),
                          elevation: 7,
                          padding: EdgeInsets.all(5),
                        ),
                        child: Text('Login'),
                      ),
                    ),
                    Builder(
                      builder: (context) => Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Register();
                              }));
                            },
                            child: Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, .9),
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  findUser(BuildContext context, TextEditingController controlUser,
      TextEditingController controlPassword) {
    String user = controlUser.text;
    String password = controlPassword.text;
    if (user.isNotEmpty && password.isNotEmpty) {
      for (var element in listUsers) {
        if (element.user == user && element.password == password) {
          return true;
        } else {
          MessageResponse(context, "El usuario o contraseña no es correcto");
        }
      }
      ;
    } else {
      MessageResponse(context, "El usuario o contraseña no ha sido ingresado");
    }
    return false;
  }
}
