defmodule GitHub do
  require Logger

  def fetch_commits() do
    url = "https://api.github.com/repos/k70suK3-k06a7ash1/elixir-sandbox/commits"

    response =
      Req.get!(url, params: [per_page: 100, page: 1])

    case response.status do
      200 ->
        IO.puts(response.body)

      _ ->
        Logger.error("Failed to fetch commits: #{inspect(response.body)}")
        {:error, response.body}
    end
  end
end
