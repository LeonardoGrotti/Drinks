import 'package:flutter/material.dart';
//import 'package:scoped_model/scoped_model.dart';

import '../scope_models/main_model.dart';
import '../widgets/bar_card.dart';
import '../widgets/bottom_navbar.dart';

class PaginaListaBares extends StatefulWidget {
  final MainModel model;
  PaginaListaBares(this.model);

  @override
  State<StatefulWidget> createState() {
    return _PaginaListaBaresState();
  }
}

class _PaginaListaBaresState extends State<PaginaListaBares> {
  int bottomNavBarIndex = 1;

  Widget _buildListaBares(){
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            BarCard(widget.model, index),
        itemCount: widget.model.bares.length,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(bottomNavBarIndex, widget.model),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          widget.model.nome,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        //leading: Icon(Icons.local_dining),
      ),
      body: _buildListaBares()
    );
  }
}
