import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:assignment3/musicplayer.dart';

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

  List textA = [
    'Aaaaa',
    'Bbbbb',
    'Ccccc',
  ];

  List textB = [
    'dddd dddd',
    'eeee eeee',
    'gggg gggg',
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(widget.title,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.white10,
          actions: [
            IconButton(
              icon: Icon(Icons.search,color: Colors.white,size: 35,),
              onPressed: () {},
            ),
          ],
        ),
        body:SafeArea(child:
          Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('あなたへのおすすめ',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                IconButton(
                  icon:Icon(Icons.chevron_right),
                    onPressed: ()=>Navigator.push,
                    iconSize: 40,
                    color: Colors.white,
                ),
            ],),
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context,index)=>const SizedBox(height: 10, width: 10,),
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(
                        height: 160.0,
                        width: 160.0,
                      child: Stack(children: [
                        Image.asset(photoImage[index]),
                        GestureDetector(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){return MusicPlayer(photoImage: photoImage[0]);
                          }));
                          },),
                      ],),
                    ),
                    Text(textA[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text(textB[index],style: TextStyle(color: Colors.white,)),
                    ],
                  );
                },
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('カテゴリー',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                  IconButton(
                    icon:Icon(Icons.chevron_right),
                    onPressed: ()=>Navigator.push,
                    iconSize: 40,
                    color: Colors.white,
                  ),
                ],),
            Flexible(
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(20.0),
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.purple, Colors.red],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('クラシック',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.yellow, Colors.amber],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('ジャズ',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.orange, Colors.pinkAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('ロック',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.indigo],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('カントリー',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.greenAccent, Colors.green],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('R&B',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.deepOrange, Colors.lime],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('ヒップホップ',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ],
                )
            ),
          ],
        ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite,), label: 'お気に入り'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications,), label: 'お知らせ'),
            BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'アカウント'),
          ],
          type: BottomNavigationBarType.fixed,
        )
    );
  }
}