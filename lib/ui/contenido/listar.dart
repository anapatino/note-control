import 'package:crud/dominio/modelo/materia.dart';
import 'package:flutter/material.dart';
import 'package:crud/ui/contenido/crear.dart';

class ListarMaterias extends StatefulWidget {
  const ListarMaterias({super.key});

  @override
  State<ListarMaterias> createState() => _ListarMateriasState();
}

class _ListarMateriasState extends State<ListarMaterias> {
  final List<Materia> materias = listadoMaterias;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de materias'),
      ),
      body: ListView.builder(
        itemCount: materias.length,
        itemBuilder: (context, pos) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(materias[pos].nota.toString()),
            ),
            title: Text(materias[pos].nombre),
            subtitle: Text(materias[pos].profesor),
            trailing: CircleAvatar(
              radius: 10,
              child: Text(materias[pos].creditos),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AdicionarMaterias(), //Llamar la Vista
            ),
          ).then((resultado) //Espera por un Resultado
              {
            materias.addAll(
                resultado); //Adiciona a la lista lo que recupera de la vista TextoEjercicio
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
