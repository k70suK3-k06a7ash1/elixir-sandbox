defmodule LinearRegression do
  @learning_rate 0.01
  @epochs 1000

  # 学習関数
  def train(x, y) do
    # 標準化
    {x, mean_x, std_x} = normalize(x)
    {y, mean_y, std_y} = normalize(y)

    # 勾配降下
    {theta_0, theta_1} = gradient_descent(x, y, 0.0, 0.0, @epochs)

    # 平均と標準偏差を保存して返す
    {{theta_0, theta_1}, {mean_x, std_x, mean_y, std_y}}
  end

  # 予測関数
  def predict({theta_0, theta_1}, {mean_x, std_x, mean_y, std_y}, x) do
    # 入力の標準化
    x_norm = (x - mean_x) / std_x
    # 予測
    y_norm = theta_0 + theta_1 * x_norm
    # 元のスケールに戻す
    y_norm * std_y + mean_y
  end

  # 勾配降下
  defp gradient_descent(x, y, theta_0, theta_1, 0), do: {theta_0, theta_1}

  defp gradient_descent(x, y, theta_0, theta_1, epochs) do
    m = length(y)

    # 予測
    predictions = Enum.zip(x, y) |> Enum.map(fn {xi, _} -> theta_0 + theta_1 * xi end)

    # 勾配の計算
    d_theta_0 = (Enum.zip(predictions, y)
                 |> Enum.map(fn {predicted_y, actual_y} -> predicted_y - actual_y end)
                 |> Enum.sum()) / m
    d_theta_1 = (Enum.zip(predictions, Enum.with_index(x))
                 |> Enum.map(fn {predicted_y, {input_x, index}} -> (predicted_y - Enum.at(y, index)) * input_x end)
                 |> Enum.sum()) / m

    # パラメータの更新
    new_theta_0 = theta_0 - @learning_rate * d_theta_0
    new_theta_1 = theta_1 - @learning_rate * d_theta_1

    gradient_descent(x, y, new_theta_0, new_theta_1, epochs - 1)
  end

  # 標準化
defp normalize(data) do
  mean = Enum.sum(data) / length(data)
  variance = Enum.map(data, fn x -> :math.pow(x - mean, 2) end) |> Enum.sum()
  std_dev = :math.sqrt(variance / length(data))

  normalized_data = Enum.map(data, fn x -> (x - mean) / std_dev end)
  {normalized_data, mean, std_dev}
end

  # コスト関数（MSE）
  def cost_function(predictions, y) do
    errors = Enum.zip(predictions, y) |> Enum.map(fn {pred, yi} -> :math.pow(pred - yi, 2) end)
    Enum.sum(errors) / (2 * length(y))
  end

  def main do
    # サンプルデータ
    x = [1.0, 2.0, 3.0, 4.0, 5.0]
    y = [2.0, 4.0, 6.0, 8.0, 10.0]

    # モデルの学習
    {{theta_0, theta_1}, normalization_params} = train(x, y)

    # パラメータを表示
    IO.puts("Theta 0: #{theta_0}")
    IO.puts("Theta 1: #{theta_1}")

    # 新しいデータの予測
    prediction = predict({theta_0, theta_1}, normalization_params, 6.0)
    IO.puts("Prediction for x=6.0: #{prediction}")
  end
end

LinearRegression.main()
