class Materia {
  var nombre, creditos, profesor, nota;

  Materia({this.nombre, this.creditos, this.nota, this.profesor});
}

List<Materia> listadoMaterias = [
  Materia(
    nombre: 'programacion movil',
    creditos: '4',
    nota: '5',
    profesor: 'vacca',
  ),
  Materia(
    nombre: 'programacion web',
    creditos: '2',
    nota: '4',
    profesor: 'anya',
  ),
  Materia(
    nombre: 'software I',
    creditos: '3',
    nota: '4.5',
    profesor: 'eydy',
  ),
];
