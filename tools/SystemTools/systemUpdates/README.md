# 🚀 Automated System Maintenance & Logger (`update.sh`)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

A robust **Bash script** designed to streamline system updates, manage unnecessary packages, and automatically log every action for auditing. It provides an **interactive and safe** way to keep your Debian/Ubuntu-based system secure and clean.

---

## ⚠️ Important Note: OS Compatibility

This script uses the **`apt`** package manager. It is designed to run exclusively on **Debian, Ubuntu, Linux Mint**, and other **Debian-based** distributions.

---

## 🚀 Features

* **Automated Logging:** Every command and output is recorded to a time-stamped log file for easy review and troubleshooting.
* **Interactive Control:** Prompts the user to confirm whether the upgrade should run automatically (`-y`) or interactively.
* **Optional Cleanup:** Asks the user if they want to run `sudo apt autoremove` to clear out old, unused dependency packages.
* **Log Rotation:** Automatically deletes log files older than **30 days** to prevent excessive disk usage.
* **Summary Report:** Provides a final list of upgradable packages and an overview of current log files.

---

## 💡 Usage

This script requires **no arguments**. Simply run it and follow the on-screen prompts.

### 1. Prerequisites

* A **Debian or Ubuntu-based** operating system.
* The user must have **`sudo`** privileges, as the script executes system-level commands.

### 2. Make the script executable

First, ensure the script has execution permission:

```bash
chmod +x update.sh
```


### 3. Run the script
Execute the script directly:

```bash
./update.sh
```

You will be guided through two questions:

1. **Confirm update automatically (y/N):**
    - `y`: Runs `sudo apt upgrade -y` (non-interactive).
    - `N`: Runs `sudo apt upgrade` (interactive, requires manual confirmation for packages).

2. **Remove old, unnecaissary packages (y/N):**
    - `y`: Runs `sudo apt autoremove -y`.
    - `N`: Skips the package cleanup step.

## ⚙️ Log File Management

All log files are created in the following directory structure:

```bash
$HOME/Documents/updateLogs/
```

### Log Naming Convention

Each log file is uniquely named with a timestamp:   
`update_<scanType>_YYYY-MM-DD_HH-MM-SS.log`

**Note:** The `scanType` placeholder in the script suggests you might have had other scan types planned; in this current version, the script will likely output a log file with the name `update_*.log` depending on your shell's interpretation of the undefined function `scanType`.

### Log Rotation
The script automatically cleans up old logs by running:

```bash
find "$LOGDIR" -type f -name "update_*.log" -mtime 30 -exec rm -v {} \;
```

This command finds and deletes any log file older than 30 days.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.


