import 'package:scoped_model/scoped_model.dart';

import '../models/modelo_bar.dart';

class MainModel extends Model {
  final String _nome = 'Drinkz';
  final List<Bar> bares = [
    Bar(
        id: 0,
        name: 'Olívio Bar e Gatronomia',
        address: 'Rua Delfina, 196',
        worktime: 'O bar funciona todos os dias das 14h às 22h',
        description: 'Ótimo bar para levar os amigos e experimentar bebidas novas. A especialidade da casa são drinks estilizados, que além de um delicioso gosto trazem uma bela foto no Instagram!',
        distance: '0.8 km',
        image: 'assets/olivio.jpg',
        drinks: [
          {
            'nome': 'Caipirinha',
            'preço': 'R\$ 20,00',
            'descricao':
                'Limão, Cachaça, Açúcar e Gelo para formar uma deliciosa capirinha',
            'foto': 'assets/caipirinha.jpg'
          },
          {
            'nome': 'Sex on the Beach',
            'preço': 'R\$ 23,00',
            'descricao':
                'Vodka, Licor de Pêssego, Suco de Laranja, Groselha e Gelo para formar um delicioso Sex on The Beach',
            'foto': 'assets/sex_on_the_beach.jpg'
          },
          {
            'nome': 'Dry Martini',
            'preço': 'R\$ 33,00',
            'descricao':
                'Vermouth, Gin e Twist de limão para formar um delicioso Dry Martini',
            'foto': 'assets/dry_martini.jpg'
          }
        ]),
    Bar(
        id: 1,
        name: 'Riviera Bar e Restaurante',
        address: 'Avenida Paulista, 2584',
         worktime: 'O bar funciona todos os dias das 14h às 22h',
        description: 'Ótimo bar para levar os amigos e experimentar bebidas novas. A especialidade da casa são drinks estilizados, que além de um delicioso gosto trazem uma bela foto no Instagram!',
        distance: '1.2 km',
        image: 'assets/riviera.jpg',
        drinks: [
          {
            'nome': 'Caipirinha',
            'preço': 'R\$ 20,00',
            'descricao':
                'Limão, Cachaça, Açúcar e Gelo para formar uma deliciosa capirinha',
            'foto': 'assets/caipirinha.jpg'
          },
          {
            'nome': 'Sex on the Beach',
            'preço': 'R\$ 23,00',
            'descricao':
                'Vodka, Licor de Pêssego, Suco de Laranja, Groselha e Gelo para formar um delicioso Sex on The Beach',
            'foto': 'assets/sex_on_the_beach.jpg'
          },
          {
            'nome': 'Dry Martini',
            'preço': 'R\$ 33,00',
            'descricao':
                'Vermouth, Gin e Twist de limão para formar um delicioso Dry Martini',
            'foto': 'assets/dry_martini.jpg'
          }
        ]),
    Bar(
        id: 2,
        name: 'Vesúvio on Tap Bar',
        address: 'Rua Desembargador do Vale, 824',
        worktime: 'O bar funciona todos os dias das 14h às 22h',
        description: 'Ótimo bar para levar os amigos e experimentar bebidas novas. A especialidade da casa são drinks estilizados, que além de um delicioso gosto trazem uma bela foto no Instagram!',
        distance: '2.4 km',
        image: 'assets/versuvio.jpeg',
         drinks: [
          {
            'nome': 'Caipirinha',
            'preço': 'R\$ 20,00',
            'descricao':
                'Limão, Cachaça, Açúcar e Gelo para formar uma deliciosa capirinha',
            'foto': 'assets/caipirinha.jpg'
          },
          {
            'nome': 'Sex on the Beach',
            'preço': 'R\$ 23,00',
            'descricao':
                'Vodka, Licor de Pêssego, Suco de Laranja, Groselha e Gelo para formar um delicioso Sex on The Beach',
            'foto': 'assets/sex_on_the_beach.jpg'
          },
          {
            'nome': 'Dry Martini',
            'preço': 'R\$ 33,00',
            'descricao':
                'Vermouth, Gin e Twist de limão para formar um delicioso Dry Martini',
            'foto': 'assets/dry_martini.jpg'
          }
        ]),
  ];

  String get nome {
    return _nome;
  }
}
