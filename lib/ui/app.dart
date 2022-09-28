import 'package:crud/ui/content/List.dart';
import 'package:flutter/material.dart';

/*class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Materias',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const ListMaterials(),
      debugShowCheckedModeBanner: false,
    );
  }
}*/

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Materias',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const ListMaterials(),
      debugShowCheckedModeBanner: false,
    );
  }
}
