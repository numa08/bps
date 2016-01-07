defmodule Amazon do
  use HTTPoison.Base

  def process_url(url) do
    "http://webservices.amazon.co.jp" <> url
  end

  def process_response_body(body) do
    Floki.find(body, "Items")
  end

end
