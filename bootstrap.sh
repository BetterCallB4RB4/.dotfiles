#!/usr/bin/env bash
# Post-install bootstrap. Herdr plugins are registered through the CLI
# (`herdr plugin install`), not declared in config.toml.
set -euo pipefail

if ! command -v herdr >/dev/null 2>&1; then
    echo "herdr not found; run 'mise install' first" >&2
    exit 1
fi

# Idempotent: reinstalling a GitHub plugin is allowed and keeps the old
# installation until new invocations pick up the new one.
herdr plugin install -y aimdevlee/herdr-nvim-nav
