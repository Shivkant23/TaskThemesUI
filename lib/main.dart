import 'package:flutter/material.dart';
import 'package:project15_01/OpenProfile.dart';
import 'package:project15_01/StandardsWidget.dart';
import 'package:project15_01/app_state.dart';
import 'package:project15_01/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider<AppState>(
    builder: (context) => AppState(),
    child:MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light ,
          home: MyHomePage(title: 'Flutter'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
      body: ListView(
        padding: EdgeInsets.only(left: 20),
          children: <Widget>[
            appBar(),
            SizedBox(height: 20,),
            buildCatogoryCard(),
            SizedBox(height: 20,),
            getMiddleText(),
            SizedBox(height: 20,),
            buildImageCards(),
          ],
        ),
        bottomNavigationBar: StandardsWidgets.bottomNavigationBar(),
    );
  }

  Widget appBar(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Paris", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
              SizedBox(height: 10,),
              Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.white,),
            ],),
            flex: 1,
          ),
          
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  StandardsWidgets.getCircleContainer(10, Colors.white12, Icons.search, Colors.white),
                  Container(width: 10,),
                  StandardsWidgets.getCircleContainer(10, Colors.white12, Icons.sort, Colors.white),
              ],),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget buildCards(String imageStr){
    return Container(
      height: 340,
      width: 250,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.black45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[

              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage(imageStr),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
              Positioned(
                bottom: -20,
                right: 15,
                child: StandardsWidgets.getCircleContainer(10, Colors.white30, Icons.favorite, Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text("FRI, DEC 19TH - MON, DEC 22TH", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text("Nocturnal and unusal visit", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("Louvre", style: TextStyle(fontSize: 12)),
          // StandardsWidgets.getText("FRI, DEC 19TH - MON, DEC 22TH", Colors.indigo, 12, FontWeight.bold),
          // StandardsWidgets.getText("Nocturnal and unusal visit", Colors.white, 18, FontWeight.bold),
          // StandardsWidgets.getText("Louvre", Colors.white38, 12, FontWeight.normal),
        ],),
      )
    );
  }

  Widget smallcards(String _icon, String _string, Color backgroundColor, Color iconBack){
    return Material(
      borderRadius: BorderRadius.circular(40),
      elevation: 1,
      // color: Theme.of(context).cardColor.withOpacity(.95),
      color: backgroundColor,
      // shadowColor: Theme.of(context).accentColor.withOpacity(.5),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            StandardsWidgets.getCircleWithImage(15, iconBack, _icon, Colors.yellowAccent),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(_string, style: TextStyle(color: Colors.white, fontSize: 14),),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCatogoryCard(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: smallcards("assets/fa2.png", "All", Colors.white30, Colors.black45),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: smallcards("assets/fa1.png", "Food", Colors.blueAccent, Colors.lightBlue),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: smallcards("assets/fa3.png", "Sport", Colors.white30, Colors.black45),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: smallcards("assets/fa4.png", "Music", Colors.white30, Colors.black45),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: smallcards("assets/fa5.png", "Bike", Colors.white30, Colors.black45),
          ),
        ],
      ),
    );
  }

  Widget getMiddleText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Popular Events", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
        Padding(
          padding: EdgeInsets.all(0),
          child: Row(children: <Widget>[
            Switch(
              value: Provider.of<AppState>(context).isDarkModeOn,
              onChanged: (value){
                Provider.of<AppState>(context).updateTheme(value);
              },
            ),
          ],),
        ),
      ],
    );
  }

  Widget buildImageCards(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Padding(
            padding: EdgeInsets.only(right: 15),
            child: buildCards('assets/paris1.jpg'),
          ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(imageName: "assets/paris1.jpg",)),
              );
            },
          ),
          GestureDetector(
            child: Padding(
            padding: EdgeInsets.only(right: 15),
            child: buildCards('assets/paris4.jpg'),
          ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(imageName: "assets/paris4.jpg",)),
              );
            },
          ),
          GestureDetector(
            child: Padding(
            padding: EdgeInsets.only(right: 15),
            child: buildCards('assets/paris3.jpg'),
          ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(imageName: "assets/paris3.jpg",)),
              );
            },
          ),
          GestureDetector(
            child: Padding(
            padding: EdgeInsets.only(right: 15),
            child: buildCards('assets/paris1.jpg'),
          ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(imageName: "assets/paris1.jpg",)),
              );
            },
          ),
        ],
      ),
    );
  }

  
}
