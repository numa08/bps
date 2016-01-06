defmodule EBrainTest do
  use ExUnit.Case

  test "parse body" do
    file = "./fixtures/books_head.csv" |> Path.expand(__DIR__) |> File.read!
    body = EBrain.process_response_body(file)

    assert Enum.count(body) == 10

    [[_, t, _,  p, _, _, i, u]] = Enum.take(body, 1)
    assert t == ".NET Frameworkエッセンシャルズ 第2版"
    assert p == "540"
    assert i == "4873110947"
    assert u == "http://www.bookcyber.net/basket/detail2.cgi?key=Pgw-97588"
  end
end
