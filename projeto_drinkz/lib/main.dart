import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/lista_bares.dart';
import './scope_models/main_model.dart';
import './pages/perfil.dart';
import './pages/compartilhar.dart';
import './pages/apresenta_pedido.dart';

/* import './widgets/bar_card.dart';
import './models/modelo_bar.dart'; */

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MainModel _model = MainModel();
  /* final bar = Bar(name: 'Olivo', address: 'Rua teste 89', description: 'Ótimo bar para levar', distance: '2.2 km', image: 'assets/olivo.jpg'); */

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
          title: _model.nome,
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
            accentColor: Colors.red,
            fontFamily: 'Oswald',
          ),
          routes: {
            '/': (BuildContext context) => PaginaListaBares(_model),
            /* BarCard(bar) */
            '/pagina0': (BuildContext context) => PaginaPerfil(_model),
            '/pagina1': (BuildContext context) => PaginaListaBares(_model),
            '/pagina2': (BuildContext context) => PaginaCompartilhar(_model),
          }),
    );
  }
}
