uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//'
