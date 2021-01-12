// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$pokemonListAtom = Atom(name: '_HomeControllerBase.pokemonList');

  @override
  List<Pokemon> get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(List<Pokemon> value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  final _$pokemonFutureAtom = Atom(name: '_HomeControllerBase.pokemonFuture');

  @override
  ObservableFuture<List<Pokemon>> get pokemonFuture {
    _$pokemonFutureAtom.reportRead();
    return super.pokemonFuture;
  }

  @override
  set pokemonFuture(ObservableFuture<List<Pokemon>> value) {
    _$pokemonFutureAtom.reportWrite(value, super.pokemonFuture, () {
      super.pokemonFuture = value;
    });
  }

  final _$getAllPokemonsAsyncAction =
      AsyncAction('_HomeControllerBase.getAllPokemons');

  @override
  Future<dynamic> getAllPokemons() {
    return _$getAllPokemonsAsyncAction.run(() => super.getAllPokemons());
  }

  @override
  String toString() {
    return '''
pokemonList: ${pokemonList},
pokemonFuture: ${pokemonFuture}
    ''';
  }
}
