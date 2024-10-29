defmodule GitHubClient do
  use Tesla

  # 使用するアダプターを指定
  # adapter Tesla.Adapter.Finch

  # GitHubのAPIエンドポイント
  @base_url "https://api.github.com"

  def fetch_commits() do
    # ヘッダーにアクセストークンを追加
    headers = [
      {"User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; NP06; rv:11.0)"},
    ]
    |> Enum.reject(fn {_, value} -> is_nil(value) end) #if access_token, do: [{"Authorization", "Bearer #{access_token}"}], else: []

    # リクエストURL
    url = "#{@base_url}/repos/k70suK3-k06a7ash1/elixir-sandbox/commits"

    # リクエスト送信
    case get(url, headers: headers) do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        IO.puts("Response: #{inspect(body)}")
        {:ok, body}

      {:ok, %Tesla.Env{status: status, body: body}} ->
        IO.puts("Request failed with status #{status}: #{inspect(body)}")
        {:error, "Request failed with status #{status}: #{inspect(body)}"}

      {:error, reason} ->
        IO.puts("Request error: #{inspect(reason)}")
        {:error, "Request error: #{inspect(reason)}"}
    end
  end
end
