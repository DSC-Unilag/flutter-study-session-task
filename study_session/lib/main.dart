/*
  Run this code in your preferred editor.
  Be sure to add this package [list_english_words: ^0.1.1+2]
  to your pubspec.yaml file as we've used it in this snippet below.
  Add it just below cupertino_icons. Make sure your indentation is right.
  Once you get how to use packages now, you've gotten it for life.
  Change the home parameter to see how Columns/Rows work in the 
  other view below i.e. MyOtherWidget().
  Be sure to reach out on the group if you face any challenges(and I'm
  quite sure that you will🌚, you guys can prove me wrong sha).
  I'm already talking too much😂😂😂, oya go and have fun. 
 */

import 'package:flutter/material.dart';
import 'package:list_english_words/list_english_words.dart';

void main() {
  runApp(MyApp());
}


class MyWidget extends StatelessWidget {
  final wordList = list_english_words.sublist(660, 860);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Words'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: wordList.length,
          itemBuilder: (BuildContext context, int position) {
            return ListTile(
              title: Text(wordList[position]),
              subtitle: Text('DSC flutter study session'),
              leading: Icon(Icons.book),
              trailing: Column(
                children: [
                  Icon(Icons.more_vert_rounded),
                  SizedBox(height: 10),
                  Text('11:45pm')
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WordView(word: wordList[position]),
                  ),
                );
              },
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
              Icon(Icons.arrow_back),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.person_pin),
            ],
          ),
        ),
        title: Text(word),
        centerTitle: true,
      ),
      body: Center(
        child: Text('You clicked on ${word.toUpperCase()}'),
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
                    bottom: 40,
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
