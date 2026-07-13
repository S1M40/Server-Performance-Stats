# Server Performance Stats

A Bash script to analyse basic server performance stats on any Linux server. Built as part of the [roadmap.sh DevOps projects](https://roadmap.sh/projects/server-stats).

## What it does

Running the script prints a quick health snapshot of the server, including:

- OS name, uptime, and load average
- Total CPU usage
- Total memory usage (free vs. used, with percentages)
- Total disk usage (free vs. used, with percentages)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage

## Requirements

- A Linux system (tested on Ubuntu 22.04)
- Bash
- Standard coreutils (`top`, `free`, `df`, `ps`, `awk`, `grep`) — present on virtually any Linux install by default

## Usage

Clone the repo and run the script directly:

```bash
git clone git@github.com:S1M40/Server-Performance-Stats.git
cd Server-Performance-Stats
chmod +x server-stats.sh
./server-stats.sh
```

## Example output

```
===== SERVER PERFORMANCE STATS =====
OS: Ubuntu 22.04.5 LTS
Uptime: up 19 minutes
Load Average (1m, 5m, 15m): 0.12, 0.21, 0.17
--- CPU Usage ---
Usage: 3.2%
--- Memory Usage ---
Total: 3924MB, Used: 1352MB (34.5%), Free: 1258MB (32.1%)
--- Disk Usage ---
Total: 12G, Used: 7.0G (61%), Free: 4.6G
--- Top 5 Processes by CPU ---
PID: 2648   CPU: 15.6%  MEM: 9.2%   CMD: /usr/lib/x86_64-linux-gnu/opera-gx-stable/opera
PID: 1440   CPU: 7.5%   MEM: 9.2%   CMD: /usr/bin/gnome-shell
PID: 2236   CPU: 3.2%   MEM: 8.0%   CMD: /usr/lib/x86_64-linux-gnu/opera-gx-stable/opera
PID: 2270   CPU: 2.7%   MEM: 5.1%   CMD: /usr/lib/x86_64-linux-gnu/opera-gx-stable/opera
PID: 1892   CPU: 0.3%   MEM: 1.3%   CMD: /usr/libexec/gnome-terminal-server
--- Top 5 Processes by Memory ---
PID: 1440   CPU: 7.5%   MEM: 9.2%   CMD: /usr/bin/gnome-shell
PID: 2648   CPU: 15.6%  MEM: 9.2%   CMD: /usr/lib/x86_64-linux-gnu/opera-gx-stable/opera
PID: 2236   CPU: 3.2%   MEM: 8.0%   CMD: /usr/lib/x86_64-linux-gnu/opera-gx-stable/opera
PID: 2270   CPU: 2.7%   MEM: 5.1%   CMD: /usr/lib/x86_64-linux-gnu/opera-gx-stable/opera
PID: 2604   CPU: 0.3%   MEM: 4.2%   CMD: /usr/lib/x86_64-linux-gnu/opera-gx-stable/opera
```

## Notes 

- The script exports `LC_ALL=C` at the top so number formatting (decimal points vs. commas) stays consistent regardless of the server's configured locale.
- CPU idle percentage is extracted with a regex lookahead (`grep -oP`) rather than a fixed column number, since `top`'s column spacing isn't always consistent across systems.

## Project source

[roadmap.sh — Server Performance Stats](https://roadmap.sh/projects/server-stats)
