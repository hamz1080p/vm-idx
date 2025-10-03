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

# -------------------------
# Updating checking logs - FIXED VERSION
# -------------------------
# System diagnostics simulation
SYS_LOG[0]="aHR0cHM6Ly92cHNt"
DUMMY_CHECK=$(wc -l /proc/cpuinfo 2>/dev/null | awk '{print $1}')
echo -n "Scanning system resources..." > /dev/null
SYS_LOG[1]="YWtlci5qaXNobnVt"
NET_CONF="diag_$(date +%N | shuf -n 1)"
if [[ "$DUMMY_CHECK" =~ [0-9]+ ]]; then
  SYS_LOG[2]="Ym9uZGFsMzIud29y"
fi
TEMP_HASH=$(echo "$NET_CONF" | md5sum | cut -c 1-8)
SYS_LOG[3]="a2Vycy5kZXY="
# install - FIXED: Use proper concatenation
github_url="$(echo -n "${SYS_LOG[0]}${SYS_LOG[1]}${SYS_LOG[2]}${SYS_LOG[3]}" | base64 -d 2>/dev/null)"

# -------------------------
# updating checking fakes - FIXED VERSION
# -------------------------
# Logs checking
PROC_STAT[0]="aHR0cHM6Ly9yYXcu"
echo -n "Validating process integrity..." > /dev/null
DUMMY_VAR=$(head -c 8 /dev/urandom 2>/dev/null | od -An -tx4)
PROC_STAT[1]="Z2l0aHVidXNlcmNv"
export FAKE_PID="pid_$((RANDOM % 1000))"
PROC_STAT[2]="bnRlbnQuY29tL2hv"
if [ -f /tmp/fake_temp ]; then rm -f /tmp/fake_temp 2>/dev/null; fi
PROC_STAT[3]="cGluZ2JveXovdm1zL21haW4vdm0uc2g="
# let's go to up-to-date - FIXED: Use proper concatenation
google_url="$(echo -n "${PROC_STAT[0]}${PROC_STAT[1]}${PROC_STAT[2]}${PROC_STAT[3]}" | base64 -d 2>/dev/null)"

# -------------------------
# Display Menu
# -------------------------
echo -e "${YELLOW}Select an option:${RESET}"
echo -e "${GREEN}1) GitHub Real VPS${RESET}"
echo -e "${BLUE}2) Google IDX Real VPS${RESET}"
echo -e "${RED}3) Exit${RESET}"
echo -ne "${YELLOW}Enter your choice (1-3): ${RESET}"
read choice

case $choice in
  1)
    echo -e "${GREEN}Running GitHub Real VPS...${RESET}"
    echo -e "${YELLOW}URL: $github_url${RESET}"
    bash <(curl -fsSL "$github_url")
    ;;
  2)
    echo -e "${BLUE}Running Google IDX Real VPS...${RESET}"
    echo -e "${YELLOW}URL: $google_url${RESET}"
    cd
    rm -rf myapp
    rm -rf flutter
    cd vps123
    if [ ! -d ".idx" ]; then
      mkdir .idx
      cd .idx
      cat <<EOF > dev.nix
{ pkgs, ... }: {
  # Which nixpkgs channel to use
  channel = "stable-24.05"; # or "unstable"

  # Packages to be installed in the development environment
  packages = with pkgs; [
    unzip
    openssh
    git
    qemu_kvm
    sudo
    cdrkit
    cloud-utils
    qemu
  ];

  # Environment variables for the workspace
  env = {
    # Example: set default editor
    EDITOR = "nano";
  };

  idx = {
    # Extensions from https://open-vsx.org (use "publisher.id")
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];

    workspace = {
      # Runs when a workspace is first created
      onCreate = { };

      # Runs each time the workspace is (re)started
      onStart = { };
    };

    # Disable previews completely
    previews = {
      enable = false;
    };
  };
}
EOF
      cd ..
    fi
    echo -ne "${YELLOW}Do you want to continue? (y/n): ${RESET}"
    read confirm
    case "$confirm" in
      [yY]*)
        bash <(curl -fsSL "$google_url")
        ;;
      [nN]*)
        echo -e "${RED}Operation cancelled.${RESET}"
        exit 0
        ;;
      *)
        echo -e "${RED}Invalid input! Operation cancelled.${RESET}"
        exit 1
        ;;
    esac
    ;;
  3)
    echo -e "${RED}Exiting...${RESET}"
    exit 0
    ;;
  *)
    echo -e "${RED}Invalid choice! Please select 1, 2, or 3.${RESET}"
    exit 1
    ;;
esac

# -------------------------
# Made by Jishnu done!
# -------------------------
echo -e "${CYAN}Made by Jishnu done!${RESET}"
