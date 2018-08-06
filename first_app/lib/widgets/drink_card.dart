import 'package:flutter/material.dart';

import '../models/modelo_bar.dart';
import '../pages/explica_drinks.dart';

class DrinkCard extends StatelessWidget {
  final Bar bar;
  final int indexBebidas;
  final model;

  DrinkCard(this.bar, this.indexBebidas, this.model);

  @override
  Widget build(BuildContext context) {
    final Map bebida = bar.drinks[indexBebidas];
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Text(
                    bebida['nome'],
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 25.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 150.0,
                    child: Image.asset(
                      bebida['foto'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepPurple,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return PaginaExplicaDrink(bar, bebida,model);
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Pedir Bebida',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    bebida['descricao'],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 18.0),
                  )
                ],
              );
            });
      },
      child: Container(
        height: 180.0,
        width: 180.0,
        child: Card(
          child: Column(
            children: <Widget>[
              Text(
                bebida['nome'],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),

              Image.asset(
                bebida['foto'],
                fit: BoxFit.cover,
                height: 100.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.monetization_on),
                    Text(bebida['preço'])
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.0),
              )

              //Text(bebida['descricao'], textAlign: TextAlign.center, overflow: TextOverflow.fade,)
            ],
          ),
        ),
      ),
    );
  }
}
