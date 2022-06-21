import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '改进的计数器'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text("计数清零"),
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text("打开一个新的界面"),
                  onPressed: () {
                    //导航到新路由
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return NewRoute();
                      }),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class NewRoute extends StatelessWidget {
  final _floatingActioButoon = FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.blue,
    //修改为矩形
    // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Expanded(
                  flex: 1,
                  child: TabBar(tabs: <Widget>[
                    Tab(text: "新闻"),
                    Tab(text: "历史"),
                    Tab(
                      text: "图片",
                    )
                  ]),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.home), onPressed: _onAdd),
                const SizedBox(), //中间位置空出
                IconButton(
                  icon: const Icon(Icons.backspace),
                  onPressed: () {
                    Navigator.pop(context); //从第二个界面返回
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
            ),
          ),
          floatingActionButton: _floatingActioButoon,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: const <Widget>[
                  ListTile(
                      title: Text(
                        '新闻',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.red),
                      ),
                      tileColor: Color.fromARGB(255, 196, 192, 192)),
                  Image(
                    image: AssetImage('images/Zombatar_1.png'),
                    width: 200.0,
                    height: 200.0,
                  )
                ],
              ),
              ListView(
                children: const <Widget>[
                  ListTile(
                    title: Text(
                      '历史',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                    tileColor: Color.fromARGB(255, 196, 192, 192),
                  ),
                  Image(
                    image: AssetImage('images/tree.png'),
                    width: 200.0,
                    height: 200.0,
                  )
                ],
              ),
              ListView(
                children: const <Widget>[
                  ListTile(
                    title: Text(
                      '图片',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                    tileColor: Color.fromARGB(255, 196, 192, 192),
                  ),
                  Image(
                    image: AssetImage('images/sight.png'),
                    width: 200.0,
                    height: 200.0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAdd() {}
}
