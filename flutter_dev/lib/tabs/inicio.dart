//import 'dart:ui';

import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                width: 400,
                height: 350,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage("assets/imagenes/medioambiente.jpg"),
                    //image: AssetImage("assets/imagenes/dogg.jpg"), // new AssetImage("assets\\images\\dogg.jpg"),
                    //image: NetworkImage("assets/images/dogg.jpg"),
                    //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Zelda_Logo.svg/1920px-Zelda_Logo.svg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 400,
                height: 350,
                child: Text(
                  "La naturaleza, en su sentido más amplio, es equivalente al mundo natural, mundo material o universo material. El término hace referencia a los fenómenos del mundo físico, y también a la vida en general.",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    /* return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              width: 400,
              height: 350,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/imagenes/dogg.jpg"),
                  //image: AssetImage("assets/imagenes/dogg.jpg"), // new AssetImage("assets\\images\\dogg.jpg"),
                  //image: NetworkImage("assets/images/dogg.jpg"),
                  //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Zelda_Logo.svg/1920px-Zelda_Logo.svg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text("q123wwwwwwwwwwwwwwwww"),
          Text("13214qwwwwqwewwewww"),
          Text("12412qwwwwwwwwwwwwwwwww"),
        ],
      ),
    )); */
    /* body: new Stack(
        children: <Widget>[
          Text("qwwwwwwwwwwwwwwwww"),
          Text("q123wwwwwwwwwwwwwwwww"),
          Text("13214qwwwwqwewwewww"),
          Text("12412qwwwwwwwwwwwwwwwww"),
          /*  Container(
            margin: const EdgeInsets.all(5),
            width: 400,
            height: 350,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage("assets/imagenes/dogg.jpg"),
                //image: AssetImage("assets/imagenes/dogg.jpg"), // new AssetImage("assets\\images\\dogg.jpg"),
                //image: NetworkImage("assets/images/dogg.jpg"),
                //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Zelda_Logo.svg/1920px-Zelda_Logo.svg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Text("qweqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"),
          ), */
        ],
      ), */
  }
}
