import 'package:poke_flutter/source/entity/pokemon.dart';
import 'package:poke_flutter/source/remote/pokemon_remote.dart';

class PokemonRepo {
  PokemonRemote pokemonRemote = PokemonRemote();

  final List<Pokemon> _pokemons = [];
  int _counter = 1;
  final int _lastPokemonId = 151;

  Future<List<Pokemon>> getPokemons() {
    return _fetchPokemon(_counter);
  }

  Future<List<Pokemon>> _fetchPokemon(int number) {
    while (_counter < _lastPokemonId) {
      pokemonRemote
          .fetchPokemon(number)
          .then((value) => {_addPokemonAndIncreaseCounter(value)});
    }
    return Future.value(_pokemons);
  }

  void _addPokemonAndIncreaseCounter(Pokemon pokemon) {
    _pokemons.add(pokemon);
    _counter++;
    if (_counter < _lastPokemonId) {
      _fetchPokemon(_counter);
    }
  }

  Future<List<Pokemon>> getPokemons2() async {
    List<Pokemon> pokemons = [];

    for (int i = 1; i <= 151; i++) {
      Pokemon pokemon = await pokemonRemote.fetchPokemon(i);
      pokemons.add(pokemon);
    }

    print(pokemons[0].name);
    print(pokemons[150].name);

    return pokemons;
  }
}
