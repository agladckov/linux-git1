#!/usr/bin/env bash
token="$(</home/users/agladckov/linux-git1/github_token)"
curl -H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer ${token}" \
"https://api.github.com/repos/datamove/linux-git2/pulls?state=all&per_page=100&page=0" -o /tmp/info0.json

token="$(<./github_token)"
curl -H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer ${token}" \
"https://api.github.com/repos/datamove/linux-git2/pulls?state=all&per_page=100&page=1" -o /tmp/info1.json

token="$(<./github_token)"
curl -H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer ${token}" \
"https://api.github.com/repos/datamove/linux-git2/pulls?state=all&per_page=100&page=2" -o /tmp/info2.json

token="$(<./github_token)"
curl -H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer ${token}" \
"https://api.github.com/repos/datamove/linux-git2/pulls?state=all&per_page=100&page=3" -o /tmp/info3.json

token="$(<./github_token)"
curl -H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer ${token}" \
"https://api.github.com/repos/datamove/linux-git2/pulls?state=all&per_page=100&page=4" -o /tmp/info4.json

token="$(<./github_token)"
curl -H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer ${token}" \
"https://api.github.com/repos/datamove/linux-git2/pulls?state=all&per_page=100&page5" -o /tmp/info5.json

token="$(<./github_token)"
curl -H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer ${token}" \
"https://api.github.com/repos/datamove/linux-git2/pulls?state=all&per_page=100&page=6" -o /tmp/info6.json

cat /tmp/info0.json /tmp/info1.json /tmp/info2.json /tmp/info3.json /tmp/info4.json /tmp/info5.json /tmp/info6.json > /tmp/info.json
name="$1"
num=$(jq --arg NAME "$name" '.[] | select(.user.login==$NAME) | .number' /tmp/info.json | wc -l)
echo "PULLS ${num}"
jq --arg NAME "$name" '.[] | select(.user.login==$NAME) | .number' /tmp/info.json > /tmp/num
earliest=$(sort /tmp/num | head -1)
echo "EARLIEST ${earliest}"
ismerged=$(jq --arg NAME "$name" --arg EARLIEST "$earliest" '.[] | select(.user.login==$NAME) | .merged_at' /tmp/info.json)
if [ "$ismerged" == "null" ]; then
  ismerged="0"
else
  ismerged="1"
fi
echo "MERGED ${ismerged}"
