import 'package:flutter/material.dart';

class TestKeysFixed extends StatelessWidget {
  const TestKeysFixed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  List<Widget> listOfItems = [
    StatefulTile(
      Colors.red,
      key: UniqueKey(),
    ),
    StatefulTile(
      Colors.blue,
      key: UniqueKey(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      ElevatedButton(
        child: (const Text('Swap squares')),
        onPressed: () {
          setState(() {
            listOfItems.insert(1, listOfItems.removeAt(0));
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listOfItems,
      ),
    ]);
  }
}

class StatefulTile extends StatefulWidget {
  final Color color;

  const StatefulTile(this.color, {super.key});

  @override
  StatefulTileState createState() => StatefulTileState();
}

class StatefulTileState extends State<StatefulTile> {
  late Color color;

  @override
  void initState() {
    color = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 200,
      height: 200,
    );
  }
}
