#!/bin/bash
export LC_ALL=C

echo "===== SERVER PERFORMANCE STATS ====="
echo ""


os_name=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')
uptime_info=$(uptime -p)
load_avg=$(uptime | grep -oP 'load average:\s*\K.*')

echo "OS: $os_name"
echo "Uptime: $uptime_info"
echo "Load Average (1m, 5m, 15m): $load_avg"
echo ""

# --- CPU Usage ---
idle=$(top -bn1 | grep "Cpu(s)" | grep -oP '[0-9.]+(?=\s*id)')
usage=$(echo "$idle" | awk '{print 100 - $1}')
echo "--- CPU Usage ---"
echo "Usage: ${usage}%"
echo ""

# --- Memory Usage ---
mem=$(free -m | grep "Mem:" | awk '{printf "Total: %sMB, Used: %sMB (%.1f%%), Free: %sMB (%.1f%%)", $2, $3, ($3/$2)*100, $4, ($4/$2)*100}')
echo "--- Memory Usage ---"
echo "$mem"
echo ""

# --- Disk Usage ---
disk=$(df -h / | awk 'NR==2{printf "Total: %s, Used: %s (%s), Free: %s", $2, $3, $5, $4}')
echo "--- Disk Usage ---"
echo "$disk"
echo ""

# --- Top 5 Processes by CPU ---
echo "--- Top 5 Processes by CPU ---"
ps aux --sort=-%cpu | awk 'NR>1{printf "PID: %-6s CPU: %-6s MEM: %-6s CMD: %s\n", $2, $3"%", $4"%", $11}' | head -5
echo ""

# --- Top 5 Processes by Memory ---
echo "--- Top 5 Processes by Memory ---"
ps aux --sort=-%mem | awk 'NR>1{printf "PID: %-6s CPU: %-6s MEM: %-6s CMD: %s\n", $2, $3"%", $4"%", $11}' | head -5
