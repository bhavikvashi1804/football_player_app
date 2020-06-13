import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc/player_listing_events.dart';
import '../bloc/player_listing_states.dart';
import '../services/repository.dart';
import '../models/models.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent,PlayerListingState>{
  
  final PlayerRepository _playerRepository;
  PlayerListingBloc(this._playerRepository):assert(_playerRepository!=null);

  @override
  PlayerListingState get initialState => PlayerUninitializedState();


  //here there is one error that when every time one char user enter then search hit
  //it makes load on internet

 
  
  
  @override
  void onTransition(Transition<PlayerListingEvent, PlayerListingState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event)async* {
   
      yield PlayerFetchingState();
      try{
        List<Players> _players;

        if(event is CountrySelectedEvent){
          _players=await _playerRepository.fetchPlayersByCountry(event.nationModel.countryId);
        }
        else if(event is SearchTextChangedEvent){
          _players=await _playerRepository.fetchPlayersByName(event.searchTerm);
        }
        if(_players.length==0){
          yield PlayerEmptyState();
        }
        else{
          yield PlayerFetchedState(players: _players);
        }
      }
      catch(error){
        print(error);
        yield PlayerErrorState();
      } 
    
  }

}