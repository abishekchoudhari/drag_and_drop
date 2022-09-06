import 'package:drag_and_drop/drag_and_drop.dart';
import 'package:drag_and_drop/model/draggable_list_items.dart';
import 'package:flutter/material.dart';

class DragAndDropExample extends StatelessWidget {
  const DragAndDropExample({Key? key}) : super(key: key);

  final String _title = "Drag And Drop";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: _title,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final List<DraggableListItems> items = [];

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    generateList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 350.0,
            height: 250.0,
            margin: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 10.0,
            ),
            padding: const EdgeInsets.only(
              left: 5.0,
              right: 5.0,
            ),
            color: Colors.orange,
            child: DragAndDrop(context: context).generateDragTargetList(),
          ),
          const SizedBox(height: 5),
          DragAndDrop(context: context).generateList(items: items),
        ],
      ),
    );
  }

  void generateList() {
    for (int i = 0; i <= 10; i++) {
      items.add(
        DraggableListItems(item: "Index: $i"),
      );
    }
  }
}
