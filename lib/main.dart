import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String input = "";
  List list = List();

  @override
  void initState() {
    super.initState();
    list.add("Nomor 1");
    list.add("Nomor 2");
    list.add("Nomor 3");
    list.add("Nomor 4");
    list.add("Nomor 5");
  }

  // bool checkInput = false;

  // int gender = 1;
  // printData(String input) {
  //   print(input);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.lime,
          brightness: Brightness.dark,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Belajar Udemy'),
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.beenhere),
            //     onPressed: () {
            //       print('AppBar Klik');
            //     },
            //   ),
            //   IconButton(
            //     icon: Icon(Icons.map),
            //     onPressed: () {
            //       print('AppBar Klik');
            //     },
            //   ),
            // ],
          ),
          // drawer: Drawer(
          //   child: Column(
          //     children: <Widget>[
          //       UserAccountsDrawerHeader(
          //         accountName: Text("Raka"),
          //         accountEmail: null,
          //       ),
          //     ],
          //   ),
          // ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Add ToDo"),
                      content: TextField(
                        onChanged: (String value) {
                          input = value;
                        },
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              list.add(input);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Add"),
                        )
                      ],
                    );
                  });
            },
          ),
          body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                child: ListTile(
                  title: Text(list[index]),
                ),
                key: Key(list[index]),
                onDismissed: (direction) {
                  setState(() {
                    list.removeAt(index);
                  });
                },
              );
            },
          ),
          // Column(
          //   children: <Widget>[
          //     TextFormField(
          //       decoration: InputDecoration(
          //           icon: Icon(Icons.person), hintText: "Masukan Nama"),
          //       onChanged: (input) {
          //         print(input);
          //       },
          //     ),
          //     Checkbox(
          //       value: checkInput,
          //       onChanged: (bool value) {
          //         setState(() {
          //           print(value);
          //           checkInput = value;
          //         });
          //       },
          //     ),
          //     ButtonBar(
          //       children: <Widget>[
          //         Radio(
          //           value: 1,
          //           groupValue: gender,
          //           onChanged: (int value) {
          //             setState(() {
          //               print(value);
          //               gender = value;
          //             });
          //           },
          //         ),
          //         Radio(
          //           value: 2,
          //           groupValue: gender,
          //           onChanged: (int value) {
          //             setState(() {
          //               print(value);
          //               gender = value;
          //             });
          //           },
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ));
  }
}
