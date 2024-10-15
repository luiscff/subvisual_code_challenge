defmodule PokemonApp.PokemonListTest do
  use ExUnit.Case

  test "search/1 returns a list of pokemons that contains the given text" do
    expected_result = [
      "charmander",
      "charmeleon",
      "charizard",
      "chimchar",
      "charjabug",
      "charcadet",
      "pecharunt"
    ]

    result = PokemonApp.PokemonList.search("char")

    assert result == expected_result
  end

  test "search/1 returns an empty list if no pokemon contains the given text" do
    expected_result = []

    result = PokemonApp.PokemonList.search("not_a_pokemon")

    assert result == expected_result
  end
end
