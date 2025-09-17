#!/usr/bin/env -S awk -f
function trim(input) { gsub(/^[ \t]+|[ \t]+$/, "", input); return input }
BEGIN { max_days = 0; code = ""; FS="|" }
{
  if (substr($1, 0, 1) == "#") { next }
  else if (trim($3) == "Mars" && trim($4) == "Completed" && $6+0.0 > max_days) {
    max_days = $6+0.0; code = trim($8)
  }
}
END { print max_days; print code }
