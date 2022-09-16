class Materials {
  var name, credits, teacher, note;

  Materials({this.name, this.credits, this.note, this.teacher});
}

List<Materials> listMaterials = [
  Materials(
    name: 'programacion movil',
    credits: '4',
    note: '5',
    teacher: 'vacca',
  ),
  Materials(
    name: 'programacion web',
    credits: '2',
    note: '4',
    teacher: 'anya',
  ),
  Materials(
    name: 'software I',
    credits: '3',
    note: '4.5',
    teacher: 'eydy',
  ),
];
