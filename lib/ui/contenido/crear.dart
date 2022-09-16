import 'package:flutter/material.dart';
import 'package:crud/dominio/modelo/materia.dart';

class AdicionarMaterias extends StatefulWidget {
  const AdicionarMaterias({super.key});

  @override
  State<AdicionarMaterias> createState() => _AdicionarMateriasState();
}

class _AdicionarMateriasState extends State<AdicionarMaterias> {
  final List<Materia> addmateria = [];
  TextEditingController controlnombre = TextEditingController();
  TextEditingController controlnota = TextEditingController();
  TextEditingController controlcredito = TextEditingController();
  TextEditingController controlprofesor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar materia'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controlnombre,
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'Nombres',
                  // suffix: Icon(Icons.access_alarm),
                  suffix: GestureDetector(
                    child: const Icon(Icons.close),
                    onTap: () {
                      controlnombre.clear();
                    },
                  )
                  //probar suffix
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controlprofesor,
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'Profesor',
                  // suffix: Icon(Icons.access_alarm),
                  suffix: GestureDetector(
                    child: const Icon(Icons.close),
                    onTap: () {
                      controlnombre.clear();
                    },
                  )
                  //probar suffix
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controlnota,
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'Nota',
                  // suffix: Icon(Icons.access_alarm),
                  suffix: GestureDetector(
                    child: const Icon(Icons.close),
                    onTap: () {
                      controlnombre.clear();
                    },
                  )
                  //probar suffix
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controlcredito,
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'Credito',
                  // suffix: Icon(Icons.access_alarm),
                  suffix: GestureDetector(
                    child: const Icon(Icons.close),
                    onTap: () {
                      controlnombre.clear();
                    },
                  )
                  //probar suffix
                  ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addmateria.add(Materia(
                    nombre: controlnombre.text,
                    profesor: controlprofesor.text,
                    creditos: controlcredito.text,
                    nota: controlnota.text));

                Navigator.pop(context, addmateria);
              },
              child: Text('Adicionar Materia'))
        ],
      ),
    );
  }
}
