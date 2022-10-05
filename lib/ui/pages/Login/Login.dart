import 'package:crud/domain/model/Users.dart';
import 'package:crud/ui/app.dart';
import 'package:crud/ui/pages/List.dart';
import 'package:crud/ui/pages/Login/Register.dart';
import 'package:crud/ui/pages/MessageResponse.dart';
import 'package:crud/ui/widgets/Input.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controlUser = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  TextEditingController controlName = TextEditingController();
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
                    Position(
                        left: 30, width: 80, height: 200, image: 'light-1.png'),
                    Position(
                        left: 140,
                        width: 80,
                        height: 150,
                        image: 'light-2.png'),
                    Position(
                        left: 350,
                        top: 40,
                        width: 80,
                        height: 150,
                        image: 'clock.png'),
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
                        Input(
                            controlName,
                            "Name",
                            EdgeInsets.fromLTRB(0, 0, 0, 10),
                            EdgeInsets.all(8.0),
                            Color.fromRGBO(255, 189, 189, .2),
                            Colors.grey),
                        Input(
                            controlUser,
                            "User",
                            EdgeInsets.fromLTRB(0, 0, 0, 10),
                            EdgeInsets.all(8.0),
                            Color.fromRGBO(255, 189, 189, .2),
                            Colors.grey),
                        Input(
                            controlPassword,
                            "Password",
                            EdgeInsets.fromLTRB(0, 0, 0, 10),
                            EdgeInsets.all(8.0),
                            Color.fromRGBO(143, 189, 189, .2),
                            Colors.grey),
                      ]),
                    ),
                    Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {
                          if (findUser(context, controlName, controlUser,
                                  controlPassword) ==
                              true) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => App()));
                          } else {
                            MessageResponse(context,
                                "El usuario o contraseña no es correcto");
                          }
                          controlUser.clear();
                          controlPassword.clear();
                          controlName.clear();
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

  findUser(
      BuildContext context,
      TextEditingController controlName,
      TextEditingController controlUser,
      TextEditingController controlPassword) {
    String name = controlName.text;
    String user = controlUser.text;
    String password = controlPassword.text;
    bool findUser = false;
    if (user.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
      for (var element in listUsers) {
        if (element.user == user &&
            element.password == password &&
            element.name == name) {
          return true;
        } else {
          findUser = false;
        }
      }
    } else {
      MessageResponse(
          context, "El nombre/usuario/contraseña no ha sido ingresado");
    }

    return false;
  }
}
