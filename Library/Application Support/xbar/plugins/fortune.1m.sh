#!/usr/bin/env sh
if test -f /usr/local/bin/fortune; then
  /usr/local/bin/fortune $HOME/.config/fortune/quotes
elif test -f /opt/homebrew/bin/fortune; then
  /opt/homebrew/bin/fortune $HOME/.config/fortune/quotes
else
  echo "cannot find fortune"
fi
