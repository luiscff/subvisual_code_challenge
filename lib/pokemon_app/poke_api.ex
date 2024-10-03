defmodule PokemonApp.PokeAPI do
  @moduledoc """
  Módulo responsável por lidar com a API
  """
  @api_url "https://pokeapi.co/api/v2/pokemon/"

  @doc """
  Verifica se o Pokémon existe na API, se existir, retorna os dados do mesmo. Caso contrário, retorna um erro.
  """
  def get_pokemon(pokemon_name) do
    url = "#{@api_url}#{String.downcase(pokemon_name)}"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)} # Converte o JSON para um mapa. Se falhar, lança uma exceção.

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :not_found}

      {:error, _reason} ->
        {:error, :request_failed}
    end
  end
end
