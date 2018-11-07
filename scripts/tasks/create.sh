#!/bin/bash

API="${API_ORIGIN:-http://localhost:3000}"
URL_PATH="/tasks"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "task": {
      "name": "'"${NAME}"'",
      "priority": "'"${PRIORITY}"'",
      "complete": "'"${COMPLETE}"'"
    }
  }'

echo
