import 'package:flutter/material.dart';

import '../scope_models/main_model.dart';


class BottomNavBar extends StatefulWidget{
  int bottomNavBarIndex;
  final MainModel model;

  BottomNavBar(this.bottomNavBarIndex, this.model); 

  @override
    State<StatefulWidget> createState() {
      return _BottomNavBarState();
    }
}


class _BottomNavBarState extends State<BottomNavBar>{
  @override
    Widget build(BuildContext context) {
      return BottomNavigationBar(
        currentIndex: widget.bottomNavBarIndex,
        onTap: (int index) {
          setState(() {
            if (index != widget.bottomNavBarIndex){
            widget.bottomNavBarIndex = index;
            Navigator.of(context).pushReplacementNamed('/pagina${widget.bottomNavBarIndex}');}
            
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Perfil')),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text(widget.model.nome)),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text('Compartilhar'))
        ],
      );
    }
}