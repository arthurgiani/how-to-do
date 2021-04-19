import 'package:dio/dio.dart';
import 'package:offline_first_app/helpers/db_helper.dart';
import 'package:offline_first_app/modules/home/models/pokemon.dart';
import 'package:sqflite/sqflite.dart';

class LocalPokemonRepository {
  var databaseFuture = DatabaseHelper.db.database;
  static const POKEMON_TABLE_NAME = 'pokemon';

  Future<List<Pokemon>> getAllPokemons() async {
    late final List<Pokemon> pokemonList;
    final Database database = await databaseFuture;
    final pokemonMap = await database.query(POKEMON_TABLE_NAME);
    pokemonList =
        pokemonMap.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
    return pokemonList;
  }

  Future<void> updateLocalPokemonDatatable(List<Pokemon> pokemonList) async {
    final Database database = await databaseFuture;
    Batch batch = database.batch();
    pokemonList.forEach((pokemon) async {
      batch.insert(
        POKEMON_TABLE_NAME,
        pokemon.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
    batch.commit();
  }
}
