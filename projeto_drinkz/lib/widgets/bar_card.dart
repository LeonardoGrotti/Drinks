import 'package:flutter/material.dart';

import '../models/modelo_bar.dart';
import '../pages/bar_detalhe.dart';
import '../scope_models/main_model.dart';

class BarCard extends StatelessWidget {
  final MainModel model;
  final int index;
  BarCard(this.model, this.index);

  @override
  

  Widget build(BuildContext context) {
    final bar = model.bares[index];
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
          return PaginaBarDetalhe(index, model);
        } ),);
      },
      child: Card(
      child: Column(children: <Widget>[
        Image.asset(bar.image),
        Container(
          alignment: AlignmentDirectional(-0.95, 1.0),
          child: Text(bar.name,
              style: TextStyle(color: Theme.of(context).accentColor, fontSize: 25.0),
              textAlign: TextAlign.right),
        ),
        SizedBox(
          height: 2.0,
        ),
       Padding(
         padding: EdgeInsets.symmetric(horizontal: 10.0),
         child:  Row(
          children: <Widget>[
            Text(bar.address, style: TextStyle(color: Colors.grey, fontSize: 17.0),),
            Text(bar.distance, style: TextStyle(color: Colors.grey, fontSize: 17.0),),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),),
      ]),
    ),);
  }
}
