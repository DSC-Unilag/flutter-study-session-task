import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyWidget extends StatelessWidget{
    final facList = new List<int>.generate(100, (i) => i);

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Generator Class'),
        ),

        body: Center(
          child: ListView.builder(
            itemCount: facList.length,
            itemBuilder: (BuildContext context, int position){
              return Card(
                child: ListTile(
                  title: Text('Student ${facList[position]}'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: (){
                    Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context) => WordView(word: facList[position]),
                    ),
                  );
                  },
                )
              );
            }
          ),
        ),
      );
    }

}

class WordView extends StatelessWidget{
  final int word;

  const WordView({Key key, @required this.word}) : super (key: key);
  @override
  Widget build(BuildContext context){
    var rmd = new Random();
    final int generatedFigure = rmd.nextInt(53) + 47;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              Icon(Icons.arrow_back),
              SizedBox(
                width: 5
              ),
            ],
          ),
        ),
        title: Text('Student $word'),
        centerTitle: true,
      ),

      body: Center(
        child: Text('Student $word scored $generatedFigure'),
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

    home: MyWidget(),
    );
  }
}
