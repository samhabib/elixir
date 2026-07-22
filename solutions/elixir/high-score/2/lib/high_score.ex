defmodule HighScore do
  @starting_score 0
  
  def new(), do: %{}

  def add_player(scores, name, score \\ @starting_score), do: Map.put(scores, name, score)
  
  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: add_player(scores, name)

  def update_score(scores, name, score) do 
    result = Map.get(scores, name) || @starting_score
    add_player(scores, name, result + score)
  end

  def get_players(scores), do: Map.keys(scores)
end
