# How to play ?
```bash
iex KeepProcess.ex


# After

iex > pid = spwn(KeepProcess, ;message, [])
iex > send pid, "hello"
iex > send pid, "hello world"
```