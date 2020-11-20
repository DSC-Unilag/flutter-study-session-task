import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

Random random = new Random();

List stlist(){
  List stud = [];
  for (var i = 0; i<100; i++)
    stud.add("Student $i");
  return stud;
}


class MyWidget extends StatelessWidget {
  final wordList = stlist();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Class'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: wordList.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              child: ListTile(
                title: Text(wordList[position]),
                dense: true,
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WordView(word: wordList[position]),
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
  final String word;

  const WordView({Key key, @required this.word}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.arrow_back),
            ],
          ),
        ),
        title: Text(word),
        centerTitle: true,
      ),
      body: Center(
        child: Text('$word scored ${random.nextInt(100)}'),
      ),
    );
  }
}

class MyOtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myContainer = Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            )),
        decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle
        ));
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            myContainer,
            //the stack below is just another way of implementing the variable "myContainer" above
            Stack(
                overflow: Overflow.visible,
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle)),
                  Positioned(
                    //bottom: 40, //uncomment this to see how it works
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle)),
                  ),
                ])
          ],
        ),
        ListView(
          scrollDirection: Axis.horizontal, // this makes the list scroll horizontally
          children: [
            myContainer,
            myContainer,
            myContainer,
            myContainer,
            myContainer,
            myContainer,
            myContainer,
            myContainer,
            myContainer,
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // play around with this property
          children: [
            myContainer,
            myContainer,
            myContainer,
            myContainer,
            myContainer,
            myContainer,
            myContainer,
            myContainer,
            myContainer,
          ],
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // change this guy below to [MyOtherWidget()] to see how ListViews/Rows/Columns work
      home: MyWidget(),
    );
  }
}