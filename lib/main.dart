// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'package:flutter/material.dart';

// Code written in Dart starts exectuting from the main function. runApp is part of
// Flutter, and requires the component which will be our app's container. In Flutter,
// every component is known as a "widget".
void main() => runApp(new TodoApp());

// Every component in Flutter is a widget, even the whole app itself

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'To-do List';
    return new MaterialApp(
        title: title,
        theme: ThemeData(
          backgroundColor: Colors.black,
          primarySwatch: Colors.deepPurple,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white),
            bodyText1: TextStyle(color: Colors.white),
          ),
        ),
        home: new TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

/*
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    var materialApp = new MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(children: <Widget>[
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "Type task",
                hintStyle:
                    TextStyle(fontWeight: FontWeight.w100, color: Colors.grey)),
          ),
          ListTile(
            leading: Icon(Icons.favorite_border, color: Colors.white),
            title: Text(
              'todo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, size: 19),
          shape: _CustomBorder(),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
    );
    return materialApp;
  }
}

*/

class TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
          title: new Text('To-do List'),
        ));
  }
}

//shape
class _CustomBorder extends ShapeBorder {
  const _CustomBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(0.5 * rect.width, rect.height * 0.35)
      ..cubicTo(0.2 * rect.width, rect.height * 0.01, -0.25 * rect.width,
          rect.height * 0.55, 0.5 * rect.width, rect.height)
      ..moveTo(0.5 * rect.width, rect.height * 0.35)
      ..cubicTo(0.8 * rect.width, rect.height * 0.01, 1.25 * rect.width,
          rect.height * 0.55, 0.5 * rect.width, rect.height)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
