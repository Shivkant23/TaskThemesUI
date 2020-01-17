import 'package:flutter/material.dart';
import 'package:project15_01/StandardsWidget.dart';

class Profile extends StatefulWidget {
  Profile({String this.imageName});
  String imageName = "";
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{

  @override
  void initState() {
    print("widget.imageName:- ${widget.imageName}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  print("widget.imageName:- ${widget.imageName}");
  final Color color1 = Color(0xffFC5CF0);
  final Color color2 = Color(0xffFE8852);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Stack(
                  children: <Widget>[
                    Image.asset(widget.imageName),
                    Icon(Icons.keyboard_arrow_left, color: Colors.black,),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 190.0, 0, 0),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.only(top: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          child: Icon(Icons.account_circle, size: 65,),
                          radius: 30,
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Izabel Peattle", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                            Text("Organizer", style: TextStyle(fontSize: 12, color: Colors.white),),
                          ],
                        ),
                        SizedBox(width: 40,),
                        RaisedButton(
                          child: Text("Follow", style: TextStyle(fontSize: 10, color: Colors.white)),
                          color: Colors.black,
                          onPressed: null,
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 300.0, 0, 0),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 40,),
                        Text("FRI, DEC 19TH - MON, DEC 22TH", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 15,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text("Nocturnal and unusal visit", style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 1,
                              child: StandardsWidgets.getCircleContainer(10, Colors.white30, Icons.favorite, Colors.red)
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Musee du Lourve, Paris", style: TextStyle(fontSize: 12,  color: Colors.white,)),
                        Center(
                          child: RaisedButton(
                          child: Text("Get Ticket"),
                          color: Colors.white,
                          padding: const EdgeInsets.only(left: 70, right: 70),
                          onPressed: null,
                        ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
        ],
      ),
    );
  }
}
