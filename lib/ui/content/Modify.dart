import 'package:crud/domain/model/Materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:crud/ui/content/TextBox.dart';
import 'package:flutter/services.dart';

class Modify extends StatefulWidget {
  final Materials material;
  Modify(this.material);

  @override
  State<Modify> createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  TextEditingController controlname = TextEditingController();
  TextEditingController controlnote = TextEditingController();
  TextEditingController controlcredits = TextEditingController();
  TextEditingController controlteacher = TextEditingController();

  @override
  void initState() {
    Materials mat = widget.material;
    controlname = new TextEditingController(text: mat.name);
    controlnote = new TextEditingController(text: mat.note);
    controlcredits = new TextEditingController(text: mat.credits);
    controlteacher = new TextEditingController(text: mat.teacher);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Materia"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          TextBox(controlname, "Nombre"),
          TextBox(controlnote, "Nota"),
          TextBox(controlcredits, "Credito"),
          TextBox(controlteacher, "Profesor"),
          ElevatedButton(
              onPressed: () {
                String name = controlname.text;
                String teacher = controlteacher.text;
                String credits = controlcredits.text;
                String note = controlnote.text;
                if (name.isNotEmpty &&
                    teacher.isNotEmpty &&
                    credits.isNotEmpty &&
                    note.isNotEmpty) {
                  Navigator.pop(
                      context,
                      new Materials(
                          name: name,
                          teacher: teacher,
                          credits: credits,
                          note: note));
                }
              },
              child: Text('Modificar Materia'))
        ],
      ),
    );
  }
}
