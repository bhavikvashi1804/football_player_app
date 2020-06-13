import '../models/models.dart';
import 'package:meta/meta.dart';

abstract class PlayerListingState {}

//Initial State
class PlayerUninitializedState extends PlayerListingState{}


//User has clicked  now start to fetch the data
class PlayerFetchingState extends PlayerListingState{}


//now data is fetched 
class PlayerFetchedState extends PlayerListingState{
  final List<Players> players;
  PlayerFetchedState({@required this.players}) : assert (players != null);
}

//there is error in fetch
class PlayerErrorState extends PlayerListingState{}


//there is no player
class PlayerEmptyState extends PlayerListingState{}