import 'package:mobx/mobx.dart';
import '../models/pokemon.dart';
import 'home_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository _homeRepository;

  _HomeControllerBase(this._homeRepository) {
    getAllPokemons();
  }

  @observable
  List<Pokemon> pokemonList;

  @observable
  ObservableFuture<List<Pokemon>> pokemonFuture;

  @action
  Future getAllPokemons() async {
    pokemonFuture = ObservableFuture(_homeRepository.getAllPokemons());
    pokemonList = await pokemonFuture;
  }
}
