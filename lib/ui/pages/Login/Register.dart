import 'package:crud/domain/model/Users.dart';
import 'package:crud/ui/pages/MessageResponse.dart';
import 'package:flutter/material.dart';
import 'package:crud/ui/app.dart';

import '../../widgets/Input.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final List<Users> listUserNew = listUsers;
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
                    Positioned(
                        child: Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Center(
                          child: Text(
                        "Create account",
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
                          if (validation(context, controlName, controlUser,
                                  controlPassword) ==
                              true) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => App()));
                          }
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
                        child: Text('Save'),
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

  validation(
      BuildContext context,
      TextEditingController controlName,
      TextEditingController controlUser,
      TextEditingController controlPassword) {
    String name = controlName.text;
    String user = controlUser.text;
    String password = controlPassword.text;
    if (user.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
      listUserNew.add(Users(name: name, user: user, password: password));
      MessageResponse(context, "El usuario registrado");
      for (var element in listUsers) {
        print(element.user);
      }
      return true;
    } else {
      MessageResponse(context, "El usuario o contrase??a no ha sido ingresado");
    }
    return false;
  }
}
