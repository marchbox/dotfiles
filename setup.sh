#!/usr/bin/env sh
# Bootstrap entry point: wire up symlinks, then install packages.
# Each step can also be run independently.

set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

"$DIR/setup-symlinks.sh"
"$DIR/setup-install.sh"
