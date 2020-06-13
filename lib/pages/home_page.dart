import 'package:flutter/material.dart';
import '../services/services.dart';
import '../themes/themes.dart';


class HomePage extends StatelessWidget {

  final PlayerRepository _playerRepository;

  HomePage(this._playerRepository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Players',style: appBarTextStyle,),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(child: Text('Hello'),) ,
    );
  }
}