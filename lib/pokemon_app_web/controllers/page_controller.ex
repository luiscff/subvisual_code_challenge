defmodule PokemonAppWeb.PageController do
  use PokemonAppWeb, :controller
  alias PokemonApp.PokeAPI
  alias PokemonApp.PokemonList

  def home(conn, %{"pokemon" => pokemon_name}) do
    case Integer.parse(pokemon_name) do
      #quando é um número trata como id (problema: caso se pesquise "50", encontra o id 50 e não pokemons com 50
      # no nome [ex: "zygarde-50"])
      {_pokemon_id, _} ->
        case PokeAPI.get_pokemon(pokemon_name) do
          {:ok, pokemon_data} ->
            conn |> render(:home, pokemon_list: [], pokemon: pokemon_data)

          {:error, _reason} ->
            conn
            |> put_flash(:error, "Pokémon not found")
            |> render(:home, pokemon_list: [], pokemon: nil)
        end

      #tudo o resto trata como um nome de pokemon
      _ ->
        pokemon_names = PokemonList.search(pokemon_name)

        pokemon_data_list =
          Enum.reduce(pokemon_names, [], fn pokemon_name, acc ->
            case PokeAPI.get_pokemon(pokemon_name) do
              {:ok, pokemon_data} -> [pokemon_data | acc]
              {:error, _reason} -> acc
            end
          end)

        case pokemon_data_list do
          [] ->
            conn
            |> put_flash(:error, "Pokémon not found")
            |> render(:home, pokemon_list: [], pokemon: nil)

          [pokemon] ->
            conn |> render(:home, pokemon_list: [], pokemon: pokemon)

          _ ->
            conn |> render(:home, pokemon_list: Enum.reverse(pokemon_data_list), pokemon: nil)
        end
    end
  end

  def home(conn, _params) do
    # Lida com o caso em que o não há pokemon na query
    render(conn, :home, pokemon_list: [], pokemon: nil)
  end
end
