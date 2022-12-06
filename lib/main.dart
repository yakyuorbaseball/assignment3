import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'ホーム'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List photoImage = [
    'images/001.jpg',
    'images/002.jpg',
    'images/003.jpg',
  ];



  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(fontSize: 25,color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.white,size: 25,),
            onPressed: () {},
          ),
        ],
      ),
      body:SafeArea(child:
        Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('テキスト' * 8),
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 190.0,
                      width: 190.0,
                      child: Image.asset(photoImage[index]),
                    ),
                    Text('aaaa'),
                    Text('bbbbb'),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            height: 100,
            child: Text('テキスト' * 8),
          ),
          Flexible(
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                crossAxisCount: 2,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    color: Colors.deepOrange,
                    child: Text('クラシック'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    color: Colors.deepOrange,
                    child: Text('ジャズ'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    color: Colors.deepOrange,
                    child: Text('ロック'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    color: Colors.deepOrange,
                    child: Text('カントリー'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    color: Colors.deepOrange,
                    child: Text('ロック'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    color: Colors.deepOrange,
                    child: Text('ヒップホップ'),
                  ),
                ],
              )
          ),
        ],
          ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'お気に入り'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'お知らせ'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
          ],
          type: BottomNavigationBarType.fixed,
        )
    );
  }
}