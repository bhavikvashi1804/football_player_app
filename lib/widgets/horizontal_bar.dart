import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_player/bloc/player_listing_bloc.dart';
import 'package:football_player/bloc/player_listing_events.dart';

import '../models/models.dart';

class HorizontalBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
        itemBuilder: buildItem,
        itemCount: nations.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget buildItem(context, index) {
    return InkWell(
      onTap: () {
        //To-Do: list the player of that country
        BlocProvider.of<PlayerListingBloc>(context).add(CountrySelectedEvent(nationModel: nations[index]));
      },
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(nations[index].imagePath),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }

  Widget buildSeparator(context, index) {
    return VerticalDivider(
      width: 32.0,
      color: Colors.transparent,
    );
  }
}