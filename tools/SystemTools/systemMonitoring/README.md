# 🛡️ Real-time System Monitor with Logging (`systemMonitor.sh`)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

A powerful and dynamic **Bash script** designed for continuous system health monitoring. It reports on **Memory** and **Disk Space** utilization, highlights the **Top Processes**, and features **threshold-based warnings** and **automatic logging** for later analysis.

---

## 🚀 Features

* **Real-time Monitoring:** Runs in a loop with a user-defined interval.
* **Threshold Warnings:**
    * Generates a **`[WARNING]`** if RAM or a Disk Partition utilization exceeds **90%**.
    * Generates a **`[SYS-INFO]`** (or a warning for disk space) if utilization exceeds **75%**.
* **Automatic Logging:** Every output update is automatically appended to a dated log file.
* **Detailed Metrics:** Provides full and compact overviews for:
    * **Memory (RAM)** usage.
    * **Hard Drive Space** (per mounted partition).
* **Top Processes:** Lists the **top 5 processes** sorted by CPU consumption.
* **Dedicated Log Directory:** Log files are organized in a dedicated directory in your home folder.

---

## 💡 Usage

The script requires **one positional argument**: the refresh interval in seconds.

### 1. Prerequisites

The script relies on standard Linux/Unix utilities like `free`, `df`, `ps`, `awk`, `printf`, and `tee`. It is compatible with most modern Linux distributions.

### 2. Make the script executable

Ensure the script has execution permission:

```bash
chmod +x systemMonitor.sh
```


### 3. Run the script
Use the following syntax:

```bash
./systemMonitor.sh [INTERVAL_SECONDS]
```

| Argument | Description | Example Value |
|----------|-------------|---------------|
| `[INTERVAL_SECONDS]` | The time in seconds betweend each system health update. | `10` |


### 4. Example

To monitor system health and update the log every 10 second

```bash
./systemMonitor.sh 10
```
The monitoring will continue until you manually stop it by pressing `CTRL+C` or `CMD+C`.


### 5. Log Files
All output, including the system reports and warnings, is logged to a time-stamped file in the following directory:

```bash
$HOME/Documents/SystemLogs/updateLogs/
```
The log file name will be formatted as: `system_monitor_YYYY-MM-DD_HH-MM-SS`


## ⚙️ How It Works

The script performs three main functions within its continuous loop:

### 1. Memory Check

It uses the `free -h` command for a full overview and calculates the percentage usage using awk. It then checks the calculated percentage against the $75%$ and $90%$ thresholds to print alerts.

### 2. Disk Space Check

It uses df -h to report on file system disk space. It iterates through all mounted partitions to check their usage percentage against the $75%$ and $90%$ thresholds, printing a `[WARNING]` if either is exceeded.

### 3. Top Processes

It uses the command `ps -eo pid,comm,%cpu,%mem --sort=-%cpu | awk 'NR==1 || NR<=6'` to get the **top 5 CPU-consuming processes** and displays their PID, Command, CPU%, and MEM%.

### 4. Logging

The entire output block is piped to the `tee -a "$LOGFILE"` command:

- `tee` duplicates the output, sending one copy to the console (for real-time viewing) and the other to the file.

- The `-a` flag ensures that the new output is appended to the log file, preserving previous monitoring data.


## 📝 License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.


