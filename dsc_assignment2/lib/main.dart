import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DSC ASSIGNMENT 2',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('MY CLASS'),
          centerTitle: true,
        ),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person_outline_rounded),
              trailing: Icon(Icons.keyboard_arrow_right_rounded),
              title: Text('Student ${index + 1}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StudentPressed(studentId: 'Student ${index + 1}'),
                  ),
                );
              },
            ),
          );
        });
  }
}

class StudentPressed extends StatefulWidget {
  final String studentId;
  const StudentPressed({Key key, @required this.studentId}) : super(key: key);

  @override
  _StudentPressedState createState() => _StudentPressedState();
}

class _StudentPressedState extends State<StudentPressed> {
  int score = Random().nextInt(60) + 40; //range of 40 to 99

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {}); // re-generates 'score'
          },
          child: Icon(Icons.arrow_back_rounded),
        ),
        title: Text(widget.studentId),
        centerTitle: true,
      ),
      body: Center(
        child: Text('${widget.studentId} scored $score'),
      ),
    );
  }
}
