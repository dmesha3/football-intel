#!/bin/sh

set -eu

copy_if_missing() {
  source_file="$1"
  target_file="$2"

  if [ -f "$target_file" ]; then
    echo "skip  $target_file"
    return
  fi

  cp "$source_file" "$target_file"
  echo "create $target_file"
}

copy_if_missing ".env.example" ".env"
copy_if_missing "apps/api/.env.example" "apps/api/.env"
copy_if_missing "apps/admin/.env.local.example" "apps/admin/.env.local"
copy_if_missing "apps/mobile/.env.local.example" "apps/mobile/.env.local"
copy_if_missing "services/data-ingestion/.env.example" "services/data-ingestion/.env"
copy_if_missing "packages/db/.env.example" "packages/db/.env"
copy_if_missing "scripts/seed/.env.example" "scripts/seed/.env"
