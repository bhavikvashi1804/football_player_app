import '../models/models.dart';
import '../services/services.dart';

class PlayerRepository {
  PlayerApiProvider _playerApiProvider = PlayerApiProvider();

  Future<List<Players>> fetchPlayersByCountry(String countryId) =>
      _playerApiProvider.fetchPlayersByCountry(countryId);

  Future<List<Players>> fetchPlayersByName(String name) =>
      _playerApiProvider.fetchPlayersByName(name);
}

//we only need to deal with repository