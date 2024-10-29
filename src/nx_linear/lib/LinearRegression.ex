defmodule LinearRegression do
  import Nx

  def fit(x, y) do
    # xとyの形状を確認
    x_shape = Nx.shape(Nx.tensor(x))
    y_shape = Nx.shape(Nx.tensor(y))

    # 正規方程式を使用して係数を計算
    # (X^T * X)^(-1) * X^T * y
    x_transpose_x = Nx.dot(Nx.transpose(x), x)
    x_transpose_y = Nx.dot(Nx.transpose(x), y)

    coefficients = Nx.linalg.inv(x_transpose_x) |> Nx.dot(x_transpose_y)

    # バイアス項を削除する
    bias = Enum.at(coefficients, 0)
    coefficients = List.delete_at(coefficients, 0)

    {coefficients, bias}
  end

  def main do
    # 入力
    x = [[1], [2], [3], [4], [5]]
    # 出力
    y = [2.2, 2.8, 3.6, 4.5, 5.1]

    coefficients, bias = fit(x, y)

    IO.inspect(coefficients)
    IO.inspect(bias)
  end
end
