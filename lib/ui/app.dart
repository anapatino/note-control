import 'package:crud/ui/content/List.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Materias',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const ListMaterials(),
      debugShowCheckedModeBanner: false,
    );
  }
}
