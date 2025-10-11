# ⚡ Multi-Scan Nmap Utility (`moreFlexScan.sh`)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

An enhanced **Bash script** built on top of Nmap, allowing you to execute **multiple scan types** against a single target IP in one command. It also supports specifying a custom port range and provides detailed logging for every scan executed.

---

## ⚠️ Important Note: Network Scanning

* **Prerequisites:** The **`nmap`** network scanning tool must be installed on your system.
* **Permissions:** Scan types like the default **TCP SYN Scan (`-sS`)** often require **root/sudo** privileges to run. You may need to execute the script using `sudo ./moreFlexScan.sh ...`.
* **Ethical Use:** Only scan networks and hosts you have explicit permission to test. Unauthorized network scanning may be illegal or violate terms of service.

---

## 🚀 Features

* **Multi-Scan Execution:** Run combinations of `tcp`, `udp`, and `service` scans in a single command.
* **Optional Port Range:** Use the dedicated `-p` flag to target specific ports or port ranges (e.g., `1-1024`).
* **Detailed Logging:**
    * Each scan type (`tcp`, `udp`, `service`) gets its **own log file**.
    * A **`_ALL_` summary log file** is created, concatenating the output of all individual scans for a complete report.
* **Log Organization:** All results are saved to a dedicated, time-stamped directory in your home folder.

---

## 💡 Usage

The script requires the **target IP address** followed by **at least one scan type**. The port range option is entirely optional.

### 1. Make the script executable

Ensure the script has execution permission:

```bash
chmod +x moreFlexScan.sh
```


### 2. Run the script

Use the following syntax:

```bash
./moreFlexScan.sh <IP-ADDRESS> <SCANTYPE_1> [<SCANTYPE_2> ...] [-p <PortRange>]
```


| Argument | Descrption | Valid Options | Nmap Command Used |
|----------|------------|---------------|-------------------|
| `[IP_ADDRESS]` | The target IP address or hostname. | `192.168.1.10` | N/A |
| `[SCANTYPE]` | The type of scan to perform. | `tcp`, `udp`, `version` | `-sS` TCP-Scan, `-sU` UDP-Scan, `-sV` Service/Version Detection |
| `-p [PortRange]` | *Optional:* Specifies a custom port range. | `-p 80,443,8080 or -p 1-1000` | |


### 3. Examples

#### Example 1: Full TCP and Service Scan on default ports

This will run a SYN scan followed by a Version detection scan:

```bash
./moreFlexScan.sh 10.0.0.5 tcp service
```

#### Example 2: UDP Scan on a specific port range

This will run an intensive UDP scan only on the first 1000 ports:
```bash
./moreFlexScan.sh 10.0.0.5 udp -p 1-1000
```

#### Example 3: Multiple scans with port range

Runs all three specified scans (`tcp`, `udp`, `service`) on ports `20` through `500`:

```bash
./moreFlexScan.sh 10.0.0.5 tcp udp service -p 20-500
```


## ⚙️ Log File Management

All log files are saved to a time-stamped directory created in:

```bash
$HOME/Documents/logFiles/moreFlexScanLogs/
```

### Log File Names

1. **Individual Logs:** For each successful scan, a specific log is created:
    - `moreFlexScan_<tcp>_YYYY-MM-DD_HH-MM-SS.log`
    - `moreFlexScan_<udp>_YYYY-MM-DD_HH-MM-SS.log` 
    - `moreFlexScan_<service>_YYYY-MM-DD_HH-MM-SS.log` 

2. **Summary Log:** The main file containing the combined output of all scans:
    - `moreFlexScan_ALL_YYYY-MM-DD_HH-MM-SS.log`


## 📝 License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.