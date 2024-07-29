#!/usr/bin/env sh

# execute fortune based on homebrew location
quote="cannot find fortune executable"

if test -f /usr/local/bin/fortune; then
  quote=$(/usr/local/bin/fortune $HOME/.config/fortune/)
elif test -f /opt/homebrew/bin/fortune; then
  quote=$(/opt/homebrew/bin/fortune $HOME/.config/fortune/)
fi

echo "$quote | length=75"
echo "---"
echo "$quote"
