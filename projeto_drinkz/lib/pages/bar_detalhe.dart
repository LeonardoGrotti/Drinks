import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/modelo_bar.dart';
import '../scope_models/main_model.dart';
import '../widgets/drink_card.dart';

class PaginaBarDetalhe extends StatelessWidget {
  final int indexBares;
  final MainModel model;
  PaginaBarDetalhe(this.indexBares, this.model);
  @override
  Widget build(BuildContext context) {
    Bar bar = model.bares[indexBares];
    bool verDetalhes = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          model.nome,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        //leading: Icon(Icons.local_dining),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: <Widget>[
            Image.asset(bar.image),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  bar.name,
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 20.0),
                ),
                ScopedModelDescendant<MainModel>(
                  builder:
                      (BuildContext context, Widget child, MainModel model) {
                    return GestureDetector(
                      onTap: () {
                        verDetalhes = !verDetalhes;
                        model.notifyListeners();
                      },
                      child: !verDetalhes
                          ? Container(
                              margin: EdgeInsets.only(right: 10.0, top: 20.0),
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.deepPurple,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.more_horiz),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('Ver detalhes')
                                ],
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(right: 10.0, top: 20.0),
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.deepPurple,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.more_vert),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('Ver detalhes')
                                ],
                              ),
                            ),
                    );
                  },
                )
              ],
            ),

            Text(bar.address,
                style: TextStyle(color: Colors.grey, fontSize: 15.0)),

            ScopedModelDescendant(
              builder: (BuildContext context, Widget child, MainModel model) {
                return verDetalhes
                    ? Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            bar.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Horários: ' + bar.worktime,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    : Container();
              },
            ),
            SizedBox(
              height: 30.0,
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Drinks disponíveis',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 23.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              height: 180.0,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int indexBebida) =>
                    DrinkCard(bar, indexBebida,model),
                itemCount: model.bares[indexBares].drinks.length,
              ),
            )

            //Text(bar.description),
          ],
        ),
      ),
    );
  }
}
