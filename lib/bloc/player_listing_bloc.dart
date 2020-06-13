import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/player_listing_events.dart';
import '../bloc/player_listing_states.dart';
import '../services/repository.dart';
import '../models/models.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent,PlayerListingState>{
  
  final PlayerRepository _playerRepository;
  PlayerListingBloc(this._playerRepository):assert(_playerRepository!=null);

  @override
  PlayerListingState get initialState => PlayerUninitializedState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event)async* {
    if(event is CountrySelectedEvent){
      yield PlayerFetchingState();
      try{
        final List<Players> players=await _playerRepository.fetchPlayersByCountry(event.nationModel.countryId);
        if(players.length==0){
          yield PlayerEmptyState();
        }
        else{
          yield PlayerFetchedState(players: players);
        }
      }
      catch(error){
        print(error);
        yield PlayerErrorState();
      } 
    }
  }

}