import 'package:flutter/material.dart';

class Bar {
  final int id;
  final String name;
  final String image;
  final String worktime;
  final String description;
  final String address;
  final distance;
  final List<Map<String, String>> drinks;
  //final List drinks;

  Bar(
      {@required this.id,
      @required this.name,
      @required this.image,
      @required this.worktime,
      @required this.description,
      @required this.address,
      @required this.distance,
      @required this.drinks});
}
