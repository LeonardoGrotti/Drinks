import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';
import '../scope_models/main_model.dart';

class PaginaPerfil extends StatelessWidget {
  final int bottomNavBarIndex = 0;
  final MainModel model;
  PaginaPerfil(this.model);

  _buildImagemFundo(){
    return BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/perfil_fundo.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        );
  }

  Widget _buildTitulo(){
    return  Center(
              child: Text(
                'Perfil',
                style: TextStyle(fontSize: 50.0, color: Colors.white),
              ),
            );
  }

  Widget _buildEconomias(BuildContext context){
    return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Economias até agora:',
                    style: TextStyle(
                        fontSize: 25.0, color: Theme.of(context).accentColor),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'R\$ 50,00',
                    style: TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                ),
              ],
            );
  }

  Widget _buildTermosECondicoesBotao(){
    return FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Termos e Condições',
                      style: TextStyle(color: Colors.grey, fontSize: 20.0),
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                onPressed: () {});
  }

  Widget _buildContatoBotao(){
    return FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Contato',
                      style: TextStyle(color: Colors.grey, fontSize: 20.0),
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                onPressed: () {});
  }


  Widget _buildPerguntasFrequentesBotao(){
    return  FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Perguntas Frequentes',
                      style: TextStyle(color: Colors.grey, fontSize: 20.0),
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                onPressed: () {});
  }

  Widget _buildUpgradeContaBotao(BuildContext context){
    return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).accentColor,
                ),
                child: FlatButton(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Upgrade da conta',
                        style: TextStyle(fontSize: 30.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(bottomNavBarIndex, model),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          model.nome,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        //leading: Icon(Icons.local_dining),
      ),
      body: Container(
        decoration: _buildImagemFundo(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
           _buildTitulo(),
            SizedBox(
              height: 110.0,
            ),
           _buildEconomias(context),
            SizedBox(
              height: 5.0,
            ),
            Divider(),
             _buildTermosECondicoesBotao(),
            Divider(),
            _buildContatoBotao(),
            Divider(),
            _buildPerguntasFrequentesBotao(),
            Divider(),
            SizedBox(
              height: 30.0,
            ),
           _buildUpgradeContaBotao(context)
          ],
        ),
      ),
    );
  }
}
