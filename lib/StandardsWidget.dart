import 'package:flutter/material.dart';

class StandardsWidgets{
  static getCircleContainer(int padding, Color color, IconData icon, Color iconColor){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(icon, color: iconColor,),
    );
  }

  static getCircleWithImage(int padding, Color color, String iamgeName, Color iconColor){
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Image.asset(iamgeName),
    );
  }

  static Widget bottomNavigationBar(){
    return  BottomNavigationBar(
      backgroundColor: Colors.white12,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home ,),
          title: Text('Account'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Event'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          title: Text('Dashboard'),
        ),
      ],
      currentIndex: 1,
      selectedItemColor: Colors.amber[800],
      // onTap: (){},
    );
  }

  static getText(String text, Color fontColor, double size, FontWeight weight){
    return Text(
      text, 
      style: TextStyle(
        color: fontColor,
        fontSize: size,
        fontWeight: weight
      ),
    );
  }
}