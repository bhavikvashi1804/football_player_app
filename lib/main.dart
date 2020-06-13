import 'package:flutter/material.dart';

import './services/services.dart';
import './pages/pages.dart';

void main() {
  
  PlayerRepository _playerRepository=PlayerRepository();
  runApp(MyApp(_playerRepository));
}

class MyApp extends StatelessWidget {
  
  final PlayerRepository _playerRepository;

  MyApp(this._playerRepository):assert(_playerRepository!=null);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Player',
      debugShowCheckedModeBanner: false,
      home: HomePage(_playerRepository),
    );
  }
}