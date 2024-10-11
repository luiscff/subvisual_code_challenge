alias PokemonApp.PokeAPI

defmodule PokemonApp.PokemonList do
  @moduledoc """
  Módulo responsável por lidar com a lista de Pokémons.

  Este módulo é um GenServer que contém a lista dos 1025 Pokémons ordenada por id
  inicializada quando o servidor arranca.
  """
  use GenServer

  @doc """
  Inicia o GenServer
  """
  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @doc """
  Inicializa o estado do GenServer com a lista ordenada de Pokémons
  """
  @impl true
  def init(_) do
    pokemon_list = PokeAPI.get_all_pokemon_names()
    {:ok, pokemon_list}
  end

  @doc """
  Retorna a lista de Pokémons
  """
  def get do
    GenServer.call(__MODULE__, :get_pokemon_list)
  end

  @doc """
  Manipula chamadas síncronas para recuperar a lista atual de Pokémons.

  Quando uma solicitação para obter a lista de Pokémons é feita, esta função responde
  com o estado atual do GenServer, que contém a lista de Pokémons. O estado não é modificado
  por esta operação.
  """
  @impl true
  def handle_call(:get_pokemon_list, _from, state) do
    {:reply, state, state}
  end

  @doc """
  Retorna a lista de Pokémons que contém o texto fornecido.
  """
  def search(text) do
    get()
    |> Enum.filter(fn pokemon_name ->
      String.contains?(String.downcase(pokemon_name), String.downcase(text))
    end)
  end
end
