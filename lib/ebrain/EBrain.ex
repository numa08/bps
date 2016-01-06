defmodule EBrain do
  use HTTPoison.Base

  def process_url(url) do
    "http://www.bookcyber.net" <> url
  end

  def process_response_body(body) do
    Mbcs.start
    Mbcs.decode!(body, :cp932)
    |> String.split("\n")
    |> Stream.map(&(&1))
    |> Stream.filter(&String.length(&1) > 0)
    |> CSV.decode
    |> Enum.to_list
  end

end
