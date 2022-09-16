import 'package:crud/domain/model/Materials.dart';
import 'package:crud/ui/content/Modify.dart';
import 'package:flutter/material.dart';
import 'package:crud/ui/content/Add.dart';
import 'package:crud/ui/content/MessageResponse.dart';

class ListMaterials extends StatefulWidget {
  const ListMaterials({super.key});

  @override
  State<ListMaterials> createState() => _ListMaterialsState();
}

class _ListMaterialsState extends State<ListMaterials> {
  final List<Materials> materials = listMaterials;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de materias'),
      ),
      body: ListView.builder(
        itemCount: materials.length,
        itemBuilder: (context, pos) {
          return ListTile(
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Modify(materials[pos])))
                  .then((resultado) {
                if (resultado != null) {
                  setState(() {
                    materials.removeAt(pos);
                    materials.insert(pos, resultado);
                    MessageResponse(context, " ha sido actualizada");
                  });
                }
              });
            },
            onLongPress: () {
              removeMaterial(context, materials[pos]);
            },
            leading: CircleAvatar(
              child: Text(materials[pos].note.toString()),
            ),
            title: Text(materials[pos].name),
            subtitle: Text(materials[pos].teacher),
            trailing: CircleAvatar(
              radius: 10,
              child: Text(materials[pos].credits),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddMaterial(), //Llamar la Vista
            ),
          ).then((resultado) //Espera por un Resultado
              {
            if (resultado != null) {
              setState(() {
                materials.addAll(resultado);
                MessageResponse(context, " ha sido guardada");
              });
            }
            //Adiciona a la lista lo que recupera de la vista TextoEjercicio
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  removeMaterial(BuildContext context, Materials material) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar materia"),
              content: Text("Esta seguro de eliminar  " + material.name + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.materials.remove(material);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ));
  }
}
