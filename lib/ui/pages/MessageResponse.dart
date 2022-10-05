import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

MessageResponse(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Mensaje Informativo"),
            content: Text(name),
          ));
}
