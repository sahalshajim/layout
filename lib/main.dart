import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Dr. Praveena PJ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
                Text(
                  'BAMS, BSc, MSc Microbiology, BEd',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.lightBlue[500],
                  ),
                )
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton(color, Icons.chat, 'CHAT'),
          _buildButton(color, Icons.book, 'BOOK'),
          _buildButton(color, Icons.schedule, 'RECENTS'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Ayurveda Cardiac and Renal, Patturaikkal',
        style: TextStyle(
          fontSize: 18
        ),
      softWrap : true,
      ),
    );

    return MaterialApp(
      title: 'Doctor Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Doctor Info Layout'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'Images/doctor.jpg',
              width: 600,
              height: 240,
              fit : BoxFit.cover,
              ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
  Column _buildButton(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 69;
  @override 
  Widget build(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red,
            iconSize: 32,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 23,
          child: Container(
            child: Text(
              '$_favoriteCount',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
        ),
      ],
    );
  }
  void _toggleFavorite() {
    setState(() {
     if (_isFavorited){
       _favoriteCount -= 1;
       _isFavorited = false ;
     } 
     else {
       _favoriteCount += 1;
       _isFavorited = true ;
     }
    });
  }
}