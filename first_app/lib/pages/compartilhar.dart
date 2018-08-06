import 'package:flutter/material.dart';

//import '../scope_models/main_model.dart';
import '../widgets/bottom_navbar.dart';
import '../scope_models/main_model.dart';

class PaginaCompartilhar extends StatelessWidget {
  final MainModel model;
  final bottomNavBarIndex = 2;
  PaginaCompartilhar(this.model);


   _buildImageFundo(){
    return BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/compartilhar_fundo.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        );
  }

  Widget _buildTitulo(){
    return Text(
              'Tome drinks com amigos !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
              textAlign: TextAlign.center,
            );
  }

  Widget _buildPrimeiroTexto(){
    return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'Compartilhe seu código promocional pessoal com seus amigos e eles ganharão seu primeiro mês na ${model.nome} por apenas R\$ 1,00',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            );
  }

  Widget _buildSegundoTexto(){
    return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'Para cada amigo que se tornar um membro verificado, você ganhará um MÊS GRÁTIS, podendo ganhar até SEIS MESES GRÁTIS! Isso é meio ano de drinks grátis só por ser um bom amigo. ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            );
  }

  Widget _buildCodigoDesconto(){
    return  Text(
              'e31f05b',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            );
  }

  Widget _buildBotaoCompartilhar(BuildContext context){
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
                        'Compartilhar',
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
        decoration: _buildImageFundo(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 15.0,
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
            SizedBox(height: 50.0),
           _buildCodigoDesconto(),
            SizedBox(height: 30.0),
           _buildBotaoCompartilhar(context),
          ],
        ),
      ),
    );
  }
}
