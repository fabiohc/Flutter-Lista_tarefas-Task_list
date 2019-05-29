import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = [];

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/dados_tarefa.json");
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("Lista de Tarefas"),
      backgroundColor: Colors.black26,
      centerTitle: true,
    );

    TextFormField textFormField = TextFormField(
      decoration: InputDecoration(
          labelText: "Nova Tarefa", labelStyle: TextStyle(color: Colors.black)),
    );

    RaisedButton btnAdd = RaisedButton(onPressed: null,
    color: Colors.black,
    child: Text("ADD"),
      textColor: Colors.white,
    );

    Row row = Row(
      children: <Widget>[
        Expanded(
       child: textFormField,
        ),
        btnAdd
      ],
    );

    Container containerTop = Container(
      padding: EdgeInsets.fromLTRB(18.0, 1.0, 6.0, 1.0),
      child: row,
    );

    Column column = Column(
      children: <Widget>[containerTop],
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
    );
    return scaffold;
  }
}
