import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:intl/intl.dart';
import 'package:countdown/countdown.dart';
import '../scope_models/main_model.dart';

/* 
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';  */

class PaginaApresentaDrink extends StatefulWidget {
  final bar;
  final bebida;
  final model;

  PaginaApresentaDrink(this.bar, this.bebida, this.model);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PaginaApresentaDrinkState();
  }
}

/* final teste = initializeDateFormatting('pt_BR', null).then(null); */
class _PaginaApresentaDrinkState extends State<PaginaApresentaDrink> {
  _buildImageFundo() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/apresenta_drink.jpg'),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      ),
    );
  }

  Widget _buildTitulo() {
    return Text(
      'Estou pedindo um',
      style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    Duration falta;
    String faltaFormatado;
    final DateTime diaAgora = DateTime.now();
    final auxiliaFormatarData = DateFormat('dd/MM/yyyy');
    final auxiliaFormatarHora = DateFormat('Hm');
    String dataFormatada = auxiliaFormatarData.format(diaAgora);
    String horaFormatada = auxiliaFormatarHora.format(diaAgora);
    CountDown cd = CountDown(Duration(minutes: 3));
    var sub = cd.stream.listen(null);
    sub.onData((Duration d) {
      
      falta = d;
      faltaFormatado = '${falta.inMinutes}:${(falta.inSeconds % 60).toString().padLeft(2, '0')}';
      widget.model.notifyListeners();
    });
    sub.onDone(() {
      Navigator.of(context).pushReplacementNamed('/pagina1');
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.model.nome,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        //leading: Icon(Icons.local_dining),
      ),
      body: Container(
        decoration: _buildImageFundo(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 1000.0,
            ),
            _buildTitulo(),
            Text(
              widget.bebida['nome'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35.0, color: Theme.of(context).accentColor),
            ),
            SizedBox(
              height: 20.0,
            ),
            /*  Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                bebida['descricao'],
                textAlign: TextAlign.center,
              ),
            ), */
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 200.0,
              child: Image.asset(
                widget.bebida['foto'],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Pedido feito no dia $dataFormatada às $horaFormatada',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 40.0,
            ),
            // Divider(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ScopedModelDescendant(
                  builder:
                      (BuildContext context, Widget child, MainModel model) {
                    return Text(
                      'Você tem $faltaFormatado sobrando para mostrar esse pedido ao garçom no bar ${widget.bar.name}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    );
                  },
                )),

            SizedBox(
              height: 26.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: (Colors.deepPurple),
                ),
                child: FlatButton(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Já fiz meu pedido',
                        style: TextStyle(fontSize: 23.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                                'Só confirme se você já tiver feito o pedido ao garçom!'),
                            title: Text('Tem certeza que já fez o pedido?'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator
                                      .of(context)
                                      .pushReplacementNamed('/pagina1');
                                },
                                child: Text('Sim'),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Não'),
                              ),
                            ],
                          );
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
