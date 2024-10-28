# what is OTP ?
- open telecom platform

## How to play ?

```bash
iex Conunter.ex

iex > GenServer.start_link(Conunter , 0)  # state 0 で初期化
```


## Knowledge
- 同期呼び出し：処理が完了して初めてレスポンスが返却される
- 非同期呼び出し：リクエストが到達したタイミングでレスポンスが返却され、非同期で処理は別途実行される


### Sync
```bash
iex Sync.ex

iex > {:ok , pid} = GenServer.start_link(Sync , 0)
iex > GenServer.call(pid, :up)
iex > GenServer.call(pid, :down)
```


### Async
```bash
iex Async.ex

iex > {:ok , pid} = GenServer.start_link(Async , 0)
iex > GenServer.cast(pid, :up)
iex > GenServer.cast(pid, :down)
```