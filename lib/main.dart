import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nav_demo/new_page.dart';

void main() => runApp(new BaseApp());

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage(),
      routes: <String,WidgetBuilder>{
        "/detail": (BuildContext context) => NewPage("New Page") 
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Home Page"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("vathna@gmail.com"),
              accountName: Text("Vuthy Vathna"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("V"),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("R"),
                ),
              ],
            ),
            new ListTile(
              title: new Text("Page 1"),
              trailing: Icon(Icons.archive),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => NewPage("Page One")));
                // Navigator.of(context).pushNamed("/detail");
              },
            ),
            new ListTile(
              title: new Text("Page 2"),
              trailing: Icon(Icons.email),
            ),
            new ListTile(
              title: new Text("Page 3"),
              trailing: Icon(Icons.close),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: new Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
