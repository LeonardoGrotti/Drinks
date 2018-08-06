import 'package:flutter/material.dart';

import './apresenta_pedido.dart';

class PaginaExplicaDrink extends StatelessWidget {
  final bar;
  final bebida;
  final model;

  PaginaExplicaDrink(this.bar, this.bebida, this.model);

  _buildImageFundo() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/drink_explicacao.jpg'),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      ),
    );
  }

  Widget _buildTitulo() {
    return Text(
      'Tem certeza que deseja pegar o drink agora?',
      style: TextStyle(
        color: Colors.white,
        fontSize: 40.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPrimeiroTexto() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        'Depois que confirmar o pedido do drink, você terá 3 minutos para apresentar a próxima página para o garçom! ',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17.0, color: Colors.grey),
      ),
    );
  }

  Widget _buildSegundoTexto() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        'Por isso, espere estar ao lado do garçom para clicar em confirmar, dessa forma você poderá aproveitar seu drink grátis agora sem nenhuma complicação! Caso não esteja ao lado do garçom, clique em cancelar. Você não precisa pré ordenar seu drink!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17.0, color: Colors.grey),
      ),
    );
  }

  Widget _buildBotaoConfirmar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: (Colors.green),
        ),
        child: FlatButton(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Confirmar',
                style: TextStyle(fontSize: 23.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          onPressed: (){  Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return PaginaApresentaDrink(bar, bebida,model);
                            },
                          ),
                        );
                      },
        
        ),
      ),
    );
  }

  Widget _buildBotaoCancelar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: (Colors.red),
        ),
        child: FlatButton(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Cancelar',
                style: TextStyle(fontSize: 23.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          model.nome,
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
              height: 19.0,
            ),
            _buildTitulo(),
            SizedBox(
              height: 50.0,
              width: 1000.0,
            ),
            _buildPrimeiroTexto(),
            SizedBox(
              height: 20.0,
            ),
            _buildSegundoTexto(),
            SizedBox(height: 90.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildBotaoConfirmar(context),
                _buildBotaoCancelar(context)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
