import 'package:crud/domain/model/Users.dart';
import 'package:crud/ui/content/MessageResponse.dart';
import 'package:flutter/material.dart';
import 'package:crud/ui/app.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final List<Users> listUserNew = listUsers;
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
                        child: Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Center(
                          child: Text(
                        "Register",
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
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(children: [
                        Container(
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
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
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
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                      ]),
                    ),
                    Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {
                          if (validation(
                                  context, controlUser, controlPassword) ==
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

  validation(BuildContext context, TextEditingController controlUser,
      TextEditingController controlPassword) {
    String user = controlUser.text;
    String password = controlPassword.text;
    if (user.isNotEmpty && password.isNotEmpty) {
      listUserNew.add(Users(user: user, password: password));
      MessageResponse(context, "El usuario registrado");
      for (var element in listUsers) {
        print(element.user);
      }
      return true;
    } else {
      MessageResponse(context, "El usuario o contraseña no ha sido ingresado");
    }
    return false;
  }
}