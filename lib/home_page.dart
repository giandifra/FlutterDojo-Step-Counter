import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Passi da mostrare
  int _steps = 0;

  // Data corrente
  final _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatore passi'),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              _date.toString(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Spacer(),
            Text(
              '$_steps\npassi',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Container(
              color: Colors.red,
              height: 250,
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text('Sommario settimanale'),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          //leggo i passi
          var newSteps = readSteps();

          // Aggiorno l'interfaccia
          setState(() {
            _steps = newSteps;
          });
        },
      ),
    );
  }

  // Metodo per leggere i passi effettuati
  int readSteps() {
    int steps = Random().nextInt(20000);
    return steps;
  }
}
