import 'package:flutter/material.dart';
import 'package:crud/ui/content/TextBox.dart';
import 'package:crud/domain/model/Materials.dart';

class AddMaterial extends StatefulWidget {
  const AddMaterial({super.key});

  @override
  State<AddMaterial> createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  final List<Materials> addmaterials = [];
  TextEditingController controlname = TextEditingController();
  TextEditingController controlnote = TextEditingController();
  TextEditingController controlcredits = TextEditingController();
  TextEditingController controlteacher = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar materia'),
      ),
      body: Column(
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
                  addmaterials.add(Materials(
                      name: name,
                      teacher: teacher,
                      credits: credits,
                      note: note));
                  Navigator.pop(context, addmaterials);
                }
              },
              child: Text('Adicionar Materia'))
        ],
      ),
    );
  }
}
