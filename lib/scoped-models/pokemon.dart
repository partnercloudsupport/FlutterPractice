import 'package:scoped_model/scoped_model.dart';

import '../models/pokemon.dart';

class PokemonModel extends Model {
  List<Pokemon> _pokemonList = [];
  int _selectedPokemonIndex;

  List<Pokemon> get pokemonList {
    return List.from(_pokemonList);
  }

  int get selectedPokemonIndex {
    return _selectedPokemonIndex;
  }

  Pokemon get selectedPokemon {
    return _selectedPokemonIndex != null ? _pokemonList[_selectedPokemonIndex] : null;
  }

  void addPokemon(Pokemon pokemon) {
    _pokemonList.add(pokemon);
    _selectedPokemonIndex = null;
  }

  void updatePokemon(Pokemon pokemon) {
    _pokemonList[_selectedPokemonIndex] = pokemon;
    _selectedPokemonIndex = null;
  }

  void deletePokemon(int index) {
    _pokemonList.removeAt(_selectedPokemonIndex);
    _selectedPokemonIndex = null;
  }

  void selectPokemon(int index) {
    _selectedPokemonIndex = index;
  }
}
