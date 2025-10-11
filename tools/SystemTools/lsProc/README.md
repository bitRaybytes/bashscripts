# 🔍 Process Snapshot Tool (`lsProc.sh`)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

A lightweight **Bash script** to quickly list a specified number of running processes on a Linux/Unix-like system. It's a snapshot tool that's great for checking the **most CPU-intensive tasks** at a given moment.

---

## 🚀 Features

* **Custom Count:** List any number of running processes specified by the user.
* **CPU Sorted:** The output is sorted to show the processes consuming the most **CPU resources** at the top.
* **Key Metrics:** Displays essential process details:
    * **USER** (The process owner)
    * **PID** (Process ID)
    * **%CPU** (CPU Usage Percentage)
    * **%MEM** (Memory Usage Percentage)
    * **COMM** (Command Name)

---

## 💡 Usage

The script requires **one positional argument**: the number of processes you wish to display.

### 1. Make the script executable

First, ensure the script has execution permission:

```bash
chmod +x lsProc.sh
```


### 2. Run the script

Use the following syntax:

```bash
./lsProc.sh [PROCESS_COUNT]
```

| Argument | Description | Example Value |
|----------|-------------|---------------|
| `[PROCESS_COUNT]` | The maximum number of processes to display. | `10` |



### 3. Example
To display the **top 20 processes** consuming the most CPU:

```bash
./lsProc.sh 20
```

#### Example Output:
```text
==== Running processes on myhostname =====
==== date ====
------------------------------------
USER      PID %CPU %MEM COMMAND
user1    1234 10.5 5.2 firefox
root      567 2.1  0.1 systemd-journal
user2    8901 0.8  1.5 code
... (17 more lines)
```


### 4. Invalid Input

Running the script without the required count will result in a warning:

```bash
./lsProc.sh
# Output:
# [WARNING] Invalid input.
# [INFO] Usage: ./lsProc.sh <INTEGER>
```

### ⚙️ How It Works

The script leverages the standard Unix `ps` command for process information and `head` for limiting the output:

```bash
ps -eo user,pid,%cpu,%mem,comm --sort %cpu | head "-$1"
```

- `ps -eo ...`: Displays process information using a custom output format.

- `--sort %cpu`: **Sorts** the list by **CPU usage** in descending order (highest CPU first).

- `| head "-$1"`: **Pipes** the sorted list to `head`, which limits the number of lines to the integer supplied as the first argument (`$1`). The hyphen (`-`) on the `head` command ensures it counts from the start of the output.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.