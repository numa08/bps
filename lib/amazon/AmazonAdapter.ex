defmodule AmazonAdapter do
  def acquire_values(items, tags) do
    Stream.map(items, fn(i) ->
      Enum.map(tags, fn(t) ->
        Floki.find(i, t)
        |> Floki.text
      end) |> List.to_tuple
    end)
  end
end
