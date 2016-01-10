defmodule AmazonAdapterTest do
  use ExUnit.Case

  test "acquire plices" do
    xml = "./fixtures/amazon.xml" |> Path.expand(__DIR__) |> File.read!

    {plice} = Floki.find(xml, "item")
             |> AmazonAdapter.acquire_values(["listprice>amount"])
             |> Stream.take(1)
             |> Enum.to_list
             |> hd

    assert plice == "669"
  end

  test "acquire asin and plice" do
    xml = "./fixtures/amazon.xml" |> Path.expand(__DIR__) |> File.read!

    {asin, plice} = Floki.find(xml, "item")
                    |> AmazonAdapter.acquire_values(["asin", "listprice>amount"])
                    |> Stream.take(1)
                    |> Enum.to_list
                    |> hd

    assert asin == "409194809X"
    assert plice == "669"
  end
end
