#!/bin/bash
set -euo pipefail

# -------------------------
# Color Definitions
# -------------------------
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
CYAN='\e[36m'
RESET='\e[0m'

# -------------------------
# Animate Logo
# -------------------------
animate_logo() {
  clear
  local logo=(
    " _    _                          _  ___   _  _  ____  "
    "| |__| | __ _ _ __  _ __   __ _ | ||__ \ | || ||___ \ "
    "|  __  |/ _\` | '_ \| '_ \ / _\` || |__) || || |_ __) |"
    "| |  | | (_| | |_) | |_) | (_| || |/ __/ |__   _/ __/ "
    "|_|  |_|\__,_| .__/| .__/ \__,_||_|_____|   |_|_____|"
    "             |_|   |_|                                "
  )
  
  for line in "${logo[@]}"; do
    echo -e "${CYAN}${line}${RESET}"
    sleep 0.2
  done
  echo ""
  sleep 0.5
}

# -------------------------
# Show Animated Logo
# -------------------------
animate_logo

# ... (rest of the code remains exactly the same as original)
# URLs tetap menunjuk ke repo asli Jishnu & Hopingboyz
# Credit message tetap "Made by Jishnu done!"
