defmodule BPS do
  use Application

  def start(_type, _args) do
    # EBrain.start
    # case EBrain.get("/DL/download.csv")  do
    #   {:error, r} -> IO.puts inspect r
    #   {:ok, r} -> IO.puts inspect r
    # end
    {:ok, self()}
  end

end
