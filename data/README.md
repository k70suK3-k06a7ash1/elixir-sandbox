```bash
git --no-pager log --since=2022-10-29  --until=2024-10-29 \
--pretty=format:"\"%ad\",\"%h\",\"%an\",\"%s\"" \
--date=short --no-merges --all --date-order > commits.txt
```