import 'package:flutter/material.dart';


class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key, required this.photoImage, required this.textA, required this.textB,}) : super(key: key);
  final String photoImage;
  final String textA;
  final String textB;
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {


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
      body: SingleChildScrollView(
        child :SafeArea(
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
            Image.asset(widget.photoImage,
              fit: BoxFit.cover,
              width: 350,
              height: 350,
            ),
            Column(
              children: [
                Padding(padding: const EdgeInsets.all(10.0),),
                Text(widget.textA,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                Text(widget.textB,style: TextStyle(color: Colors.white,fontSize: 15),),
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
               IconButton(
                 icon: Icon(pressOn ? Icons.pause_circle : Icons.play_circle),
                      onPressed: (){
                        setState(()=>pressOn = !pressOn);
                      },
                      iconSize: 70,
                      color: Colors.white,
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
      ),
    );
  }
}