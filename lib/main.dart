import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  int _counter = 0;
  List<Widget> _list = new List<Widget>();

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  void _onClicked() {
    Widget child = _newItem(_counter);
    setState(() => _list.add(child));
  }

  Widget _newItem(int i) {
    Key key = new Key("item_${i}");
    Container child = Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text("$i Name here"),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: "Delete",
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: new Text(i.toString()),
        ),
      ),
    );

    _counter++;
    return child;
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('examm1'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onClicked,
        child: new Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
            //singlechildscrollview to solve bottom overflowing
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: _list,
              ),
            )),
      ),
    );
  }
}
