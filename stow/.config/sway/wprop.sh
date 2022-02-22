#!/usr/bin/env sh
# Based on https://gitlab.com/wef/dotfiles/-/blob/28e5cdc2c085a264dbe8039583cadb74ddf3c288/bin/sway-prop

# Copyright (C) 2020-2021 Bob Hepple <bob dot hepple at gmail dot com>
# Copyright (C) 2022 lilithium-hydride

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

case "$1" in
    -h|--help)
        echo "Usage: $PROG"
        echo
        echo 'Shows the properties of the focused window.'
        exit 0
        ;;
esac

TMP=/tmp/wprop-$$.tmp

trap 'rm $TMP' EXIT

swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true)' > "$TMP"

# Only open new terminal window if not currently running in one.
if [ -n "$1" ] || [ -t 1 ]; then
    cat "$TMP"
else
    if type foot > /dev/null 2>&1 && [ -n "$WAYLAND_DISPLAY" ]; then
        foot --app-id floating -e dash -c "less $TMP"
    elif type kitty > /dev/null 2>&1; then
        kitty --class floating -e dash -c "less $TMP"
    else
        # ... but sway doesn't have anything like i3-sensible-terminal.
        # swaynag is always installed with sway, so:
        swaynag -l -m "sway-prop" < "$TMP"
    fi
fi
