import 'package:flutter/material.dart';


class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key, required this.photoImage}) : super(key: key);
  final String photoImage;

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  List photoImage = [
    'images/001.jpg',
    'images/002.jpg',
    'images/003.jpg',
  ];
  bool pressOn =false;
  double _value = 0.0;
  void _changeValu(double e) => setState(() => _value = e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        child: AppBar(),
        //appbarのサイズ0
        preferredSize: Size.fromHeight(0),
      ),
      body: SafeArea(
        child: Column(
          children: [
          Align(
              alignment: Alignment.topLeft,child:
             Padding(
                padding: const EdgeInsets.all(10.0),
               child: IconButton(
                 icon:Icon(Icons.chevron_left),
                    onPressed: ()=>Navigator.popUntil(context, (route) => route.isFirst),
                    iconSize: 40,
                    color: Colors.white,
               ),
             ),
          ),
          Image.asset(photoImage[0],
            fit: BoxFit.cover,
            width: 350,
            height: 350,
          ),
            Column(
              children: [
                Padding(padding: const EdgeInsets.all(10.0),),
                Text('aaaa',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                Text('bbbbb',style: TextStyle(color: Colors.white,fontSize: 15),),
              ],
            ),
            Slider(
              min: 0,
              max: 300,
              divisions: 300,
              value: _value,
              onChanged: _changeValu,
              activeColor: Colors.blue,
              thumbColor: Colors.white,
            ),
            Container(
              padding: EdgeInsets.only(top: 5.0,left: 20.0,right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0:00',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('5:00',style: TextStyle(fontSize: 15,color: Colors.white),),
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              IconButton(
                icon: Icon(Icons.skip_previous),
                    onPressed: () {},
                    iconSize: 70,
                    color: Colors.white,
              ),
                  ElevatedButton(
                    child: pressOn ? const Icon(Icons.play_circle,size: 70,color: Colors.white,):const Icon(Icons.pause_circle,size: 70,color: Colors.white,),
                    onPressed: () => {
                      setState((){
                        pressOn = !pressOn;
                      })
                    },
                  ),
              IconButton(
                icon: Icon(Icons.skip_next),
                    onPressed: () {},
                    iconSize: 70,
                    color: Colors.white,
              ),
                ],
            ),
          ]
        ),
      ),
    );
  }
}