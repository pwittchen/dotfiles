#!/bin/bash
input=$(cat)
user=$(whoami)
host=$(hostname -s)
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')
dir_name=$(basename "$current_dir")
git_info=""
if git -C "$current_dir" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$current_dir" symbolic-ref --short HEAD 2>/dev/null || git -C "$current_dir" rev-parse --short HEAD 2>/dev/null)
  if ! git -C "$current_dir" diff --quiet --no-lock-index 2>/dev/null || \
     ! git -C "$current_dir" diff --cached --quiet --no-lock-index 2>/dev/null || \
     [ -n "$(git -C "$current_dir" ls-files --others --exclude-standard 2>/dev/null)" ]; then
    dirty="*"
  fi
  ahead_behind=$(git -C "$current_dir" rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
  if [ -n "$ahead_behind" ]; then
    ahead=$(echo "$ahead_behind" | awk '{print $1}')
    behind=$(echo "$ahead_behind" | awk '{print $2}')
    arrows=""
    [ "$behind" -gt 0 ] && arrows="⇣"
    [ "$ahead" -gt 0 ] && arrows="${arrows}⇡"
    [ -n "$arrows" ] && arrows=" $arrows"
  fi
  git_info=" $(printf '\033[38;5;242m')${branch}${dirty}${arrows}$(printf '\033[0m')"
fi
context=""
if [ -n "$SSH_CONNECTION" ] || [ "$EUID" -eq 0 ]; then
  context="$(printf '\033[38;5;242m')${user}@${host}$(printf '\033[0m') "
fi
dir_display="$(printf '\033[38;5;117m')${dir_name}$(printf '\033[0m')"

# Token usage
input_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
output_tokens=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
total_tokens=$((input_tokens + output_tokens))
if [ "$total_tokens" -ge 1000000 ]; then
  tokens_fmt="$(printf '%.1fM' "$(echo "$total_tokens / 1000000" | bc -l)")"
elif [ "$total_tokens" -ge 1000 ]; then
  tokens_fmt="$(printf '%.1fk' "$(echo "$total_tokens / 1000" | bc -l)")"
else
  tokens_fmt="${total_tokens}"
fi

# Cost
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
cost_fmt=$(printf '$%.2f' "$cost")

# Context window usage
ctx_pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0')
ctx_pct_int=$(printf '%.0f' "$ctx_pct")
if [ "$ctx_pct_int" -ge 80 ]; then
  ctx_color="$(printf '\033[31m')"  # red
elif [ "$ctx_pct_int" -ge 50 ]; then
  ctx_color="$(printf '\033[33m')"  # yellow
else
  ctx_color="$(printf '\033[32m')"  # green
fi

# Duration
duration_ms=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')
duration_sec=$((duration_ms / 1000))
mins=$((duration_sec / 60))
secs=$((duration_sec % 60))

# Rate limits
rate_5h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
rate_7d=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
rate_info=""
if [ -n "$rate_5h" ]; then
  rate_5h_int=$(printf '%.0f' "$rate_5h")
  if [ "$rate_5h_int" -ge 80 ]; then
    rate_5h_color="$(printf '\033[31m')"
  elif [ "$rate_5h_int" -ge 50 ]; then
    rate_5h_color="$(printf '\033[33m')"
  else
    rate_5h_color="$(printf '\033[38;5;242m')"
  fi
  rate_info=" | 5h:${rate_5h_color}${rate_5h_int}%%$(printf '\033[0m')"
fi
if [ -n "$rate_7d" ]; then
  rate_7d_int=$(printf '%.0f' "$rate_7d")
  if [ "$rate_7d_int" -ge 80 ]; then
    rate_7d_color="$(printf '\033[31m')"
  elif [ "$rate_7d_int" -ge 50 ]; then
    rate_7d_color="$(printf '\033[33m')"
  else
    rate_7d_color="$(printf '\033[38;5;242m')"
  fi
  rate_info="${rate_info} 7d:${rate_7d_color}${rate_7d_int}%%$(printf '\033[0m')"
fi

dim="$(printf '\033[38;5;242m')"
reset="$(printf '\033[0m')"

# Model name
model=$(echo "$input" | jq -r '.model.display_name // "unknown"')

printf "${context}${dir_display}${git_info} ${dim}|${reset} ${dim}[${reset}${model}${dim}]${reset} ${dim}tok:${reset}${tokens_fmt} ${dim}ctx:${reset}${ctx_color}${ctx_pct_int}%%${reset} ${dim}cost:${reset}${cost_fmt} ${dim}time:${reset}${mins}m${secs}s${rate_info}"
