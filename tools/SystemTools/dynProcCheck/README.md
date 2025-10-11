# 💻 Dynamic Process Monitor (`dynProcessCheck.sh`)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

A simple yet powerful **Bash script** to monitor the most **resource-intensive processes** on a Linux/Unix system. It provides a real-time, refreshing view of the top processes, sorted by CPU usage, in an interval specified by the user.

---

## 🚀 Features

* **Dynamic Monitoring:** Refreshes the display at a user-defined interval (in seconds).
* **Top Processes:** Lists the processes currently consuming the most CPU resources.
* **Clear Output:** Clears the screen before each refresh for an easy-to-read, continuous output.
* **Key Metrics:** Displays crucial process information:
    * **USER** (Owner)
    * **PID** (Process ID)
    * **%CPU** (CPU Usage Percentage)
    * **%MEM** (Memory Usage Percentage)
    * **COMM** (Command Name)

---

## 🛠️ Prerequisites

* A Linux or Unix-like operating system (the script uses standard commands like `ps`, `head`, `clear`, and `sleep`).
* **Bash** shell (version 3.0 or higher is typically sufficient).

---

## 💡 Usage

The script requires **two positional arguments**: the refresh interval in seconds and the number of processes to list.

### 1. Make the script executable

Before running, ensure the script has execute permissions:

```bash
chmod +x dynProcessCheck.sh
```


### 2. Run the script

Use the following syntax:

```bash
./dynProcessCheck.sh [INTERVAL_SECONDS] [PROCESS_COUNT]
```


| Argument | Description | Example Value |
|----------|-------------|---------------|
| `[INTERVAL_SECONDS]` | The time in seconds between each process list update. | `5` |
| `[PROCESS_COUNT]` | The number of top processes to display. | `15` |

### 3. Example

To display the **top 15 processes** every **5 seconds**:

```bash
./dynProcessCheck.sh 5 15
```
The script will begin monitoring and display output until you press `CTRL+C` or `CMD+C` to quit.

### 4. Invalid Input

If you run the script without both arguments, it will display a warning and exit:

```bash
./dynProcessCheck.sh
# Output:
# [WARNING] Invalid input.
# Usage: ./dynProcessCheck.sh <seconds> <amount of processes>
```

## ⚙️ How It Works (Behind the Scenes)

The core functionality relies on a single `ps` command within a `while true` loop:

```bash
ps -eo user,pid,%cpu,%mem,comm --sort=-%cpu | head $2
``` 

- `ps -eo ...`: Displays process information with a custom output format.

   - `user,pid,%cpu,%mem,comm`: The specific columns to display.

- `--sort=-%cpu`: Sorts the list in descending order (`-`) based on CPU usage.

- `| head $2`: Pipes the sorted output to head, which limits the result to the number of lines specified by the second argument (`$2`).

The `clear` command runs before each update to give the dashboard effect.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.