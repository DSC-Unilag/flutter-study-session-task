import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}


class MyWidget extends StatelessWidget {
  final numList = new List<int>.generate(100, (i) => i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Custom Class'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: numList.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
                child:ListTile(
                title: Text("Student ${numList[position]}"),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WordView(word: numList[position]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class WordView extends StatelessWidget {
  final int word;

  const WordView({Key key, @required this.word}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    final int numberGenerated = rng.nextInt(60) + 40;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              Icon(Icons.arrow_back),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        title: Text("Student $word"),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Student $word scored $numberGenerated'),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DSC',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // change this guy below to [MyOtherWidget()] to see how ListViews/Rows/Columns work
      home: MyWidget(),
    );
  }
}