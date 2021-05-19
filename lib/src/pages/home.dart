import 'dart:io';

import 'package:band_names/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 3),
    Band(id: '3', name: 'Linkin Park', votes: 5),
    Band(id: '4', name: 'Bon Jovi', votes: 4),
    Band(id: '5', name: 'AC-DC', votes: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Band Name',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: ListView.builder(
            itemCount: bands.length,
            itemBuilder: (context, i) => _bandTile(bands[i])),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _addband,
        ));
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.only(left: 8),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Dismiss',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          band.votes.toString(),
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  _addband() {
    final textFieldController = new TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Add new Band'),
              content: TextField(
                controller: textFieldController,
              ),
              actions: [
                MaterialButton(
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.blue),
                    ),
                    elevation: 5,
                    onPressed: _bandToList(textFieldController.text))
              ],
            );
          });
    }

    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('Add new Band'),
              content: CupertinoTextField(
                controller: textFieldController,
              ),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text('Add'),
                  onPressed: _bandToList(textFieldController.text),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text('Dismiss'),
                  onPressed: _bandToList(textFieldController.text),
                )
              ],
            );
          });
    }
  }

  _bandToList(String name) {
    if (name.length > 1) {
      bands.add(Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
