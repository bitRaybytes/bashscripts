# 🩺 System Health Snapshot (`sysHealth.sh`)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

A minimalist **Bash script** designed to provide an instant, comprehensive snapshot of critical system resources: **Memory Usage** and **Disk Space**. This is perfect for quick checks on server or desktop health.

---

## 🚀 Features

* **Memory Status:** Displays total, used, free, shared, buffer/cache memory, and available memory, all in human-readable format.
* **Disk Status:** Shows mounted file systems, size, used space, available space, and usage percentage for all partitions.
* **Human-Readable:** All output uses the `-h` flag for easy comprehension (e.g., MB, GB).

---

## 💡 Usage

This script requires **no arguments**. Simply execute it, and it will immediately output the system health report.

### 1. Make the script executable

First, ensure the script has execution permission:

```bash
chmod +x sysHealth.sh
```


### 2. Run the script

Execute the script directly:

```bash
./sysHealth.sh
```


### Example Output:
```text
===== Memory Overview =====
              total        used        free      shared  buff/cache   available
Mem:          7.7Gi       4.2Gi       1.2Gi       231Mi       2.3Gi       3.1Gi
Swap:         2.0Gi          0B       2.0Gi
===========================

===== Hard Drive Overview =====
Filesystem      Size  Used Avail Use% Mounted on
udev            3.9G     0  3.9G   0% /dev
tmpfs           796M  2.2M  794M   1% /run
/dev/sda2       228G   95G  122G  44% /
tmpfs           3.9G   76M  3.8G   2% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
/dev/sda1       511M  5.3M  506M   2% /boot/efi
tmpfs           796M  3.7M  793M   1% /run/user/1000
===============================
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

The script is a simple wrapper for two essential Linux commands, presented with clear section headers:

- Memory Overview:

```bash
free -vh
```
The `free` command reports on memory usage. The flags `-v` (optional/non-standard on some systems, but generally implied or part of standard formatting) and `-h` (human-readable) ensure the output is easily digestible.


- Hard Drive Overview:
```bash
df -h
```
The `df` (disk filesystem) command reports file system disk space usage. The `-h` flag ensures output is in human-readable units (KB, MB, GB, etc.).




## 📝 License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.