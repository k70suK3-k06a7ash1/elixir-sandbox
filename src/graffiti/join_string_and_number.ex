defmodule Main do
  def main do
    # 整数の入力
    {a, _} = Integer.parse(IO.gets("Enter an integer: "))

    # スペース区切り整数の入力
    input = IO.gets("Enter two integers separated by a space: ")
    [b, c] = input
    |> String.trim()
    |> String.split()
    # string to number
    |> Enum.map(&String.to_integer/1)

    # 文字列の入力
    s = IO.gets("Enter a string: ") |> String.trim()

    # 出力
    IO.puts("#{a + b + c} #{s}")
  end
end

Main.main()
