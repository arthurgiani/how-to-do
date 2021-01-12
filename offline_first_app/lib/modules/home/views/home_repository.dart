import 'package:dio/dio.dart';
import 'package:offline_first_app/helpers/db_helper.dart';
import 'package:offline_first_app/modules/home/models/pokemon.dart';
import 'package:sqflite/sqflite.dart';

class HomeRepository {
  final dio = Dio();
  var databaseFuture = DatabaseHelper.db.database;
  static const POKEMON_TABLE_NAME = 'pokemon';
  static const POKEMON_API_URL =
      'https://pokeapi.co/api/v2/pokemon?limit=100&offset=200';

  Future<List<Pokemon>> getAllPokemons() async {
    final Database database = await databaseFuture;
    try {
      //Try to fetch data from API
      Response response = await dio.get(POKEMON_API_URL);

      if (response.statusCode == 200) {
        final pokemons = (response.data['results'] as List);

        //update local DB with fresh new data
        Batch batch = database.batch();
        pokemons.forEach((pokemon) async {
          batch.insert(
            POKEMON_TABLE_NAME,
            pokemon,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        });
        batch.commit();
 
        //return new data to controller
        final pokemonList = pokemons.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
        return pokemonList;
      }
    } on DioError catch (_) {
      // return data from local DB
      final pokemonList = await database.query(POKEMON_TABLE_NAME);
      return pokemonList.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
    }
    return null;
  }
}
