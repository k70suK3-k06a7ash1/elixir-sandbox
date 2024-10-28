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