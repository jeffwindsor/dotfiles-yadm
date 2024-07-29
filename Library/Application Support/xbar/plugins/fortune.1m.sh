#!/usr/bin/env sh

length="25"

quote="cannot find fortune executable"

# execute fortune based on homebrew location
if test -f /usr/local/bin/fortune; then
  quote=$(/usr/local/bin/fortune $HOME/.config/fortune/)
elif test -f /opt/homebrew/bin/fortune; then
  quote=$(/opt/homebrew/bin/fortune $HOME/.config/fortune/)
fi

quote=$(echo $quote | fold -w $length -s)

echo "$quote | length=$length"
echo "---"
echo "$quote"
