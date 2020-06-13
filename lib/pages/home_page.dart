import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_player/bloc/player_listing_bloc.dart';
import 'package:football_player/pages/player_listing.dart';
import 'package:football_player/widgets/search_bar.dart';
import '../services/services.dart';
import '../themes/themes.dart';
import '../widgets/widgets.dart';


class HomePage extends StatefulWidget {

  final PlayerRepository _playerRepository;

  HomePage(this._playerRepository);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> PlayerListingBloc(widget._playerRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Football Players',style: appBarTextStyle,),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            HorizontalBar(),
            SizedBox(height: 10,),
            SearchBar(),
            SizedBox(height: 10,),
            PlayerListing()
          ],
        ) ,
      ),
    );
  }
}