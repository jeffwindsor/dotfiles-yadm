#!/usr/bin/env sh

# execute fortune based on homebrew location
if test -f /usr/local/bin/fortune; then
  /usr/local/bin/fortune $HOME/.config/fortune/
elif test -f /opt/homebrew/bin/fortune; then
  /opt/homebrew/bin/fortune $HOME/.config/fortune/
else
  echo "cannot find fortune"
fi
