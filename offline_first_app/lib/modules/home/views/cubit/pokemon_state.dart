part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class RemotePokemonLoaded extends PokemonState {
  final List<Pokemon> pokemonList;

  RemotePokemonLoaded({required this.pokemonList});
}

class LocalPokemonLoaded extends PokemonState {
  final List<Pokemon> pokemonList;

  LocalPokemonLoaded({required this.pokemonList});
}

class LocalPokemonSync extends PokemonState {}

class PokemonError extends PokemonState {}
