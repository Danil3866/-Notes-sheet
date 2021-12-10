import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mainPage(),
    );
  }
}

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  String enteredData = '';
  List todoList = [
    'Убраться в комноте',
    'Покушать',
    'Сделать приложение'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список дел'),
      ),
      body: Scrollbar(
          isAlwaysShown: true,
          child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(todoList[index]),
                  child: Card(
                    child: Container(
                            height: 75,
                            color: Colors.white,
                            child: Text(
                                        todoList[index],
                                        style: TextStyle(fontSize: 30),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),                                                     
                    color: Colors.blue,
                  ),
                  background: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 50,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    color: Colors.green,
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Добавить заметку'),
                  content: TextFormField(
                      autofocus: true,
                      onChanged: (String value) {
                        enteredData = value;
                      }),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                              todoList.add(enteredData);
                          });

                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.check)),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
