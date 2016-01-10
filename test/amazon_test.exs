defmodule AmazonTest do
  use ExUnit.Case

  test "parse body" do
    xml = "./fixtures/amazon.xml" |> Path.expand(__DIR__) |> File.read!

    body = Amazon.process_response_body(xml)

    assert Enum.count(body) == 10

  end
end
