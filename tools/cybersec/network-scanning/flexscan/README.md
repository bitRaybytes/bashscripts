# 📡 Flexible Nmap Scanner (`flexScan.sh`)

A utility **Bash script** that acts as a simple wrapper for **Nmap**, allowing users to quickly execute common scan types against a target IP address. All scan results are automatically saved to a time-stamped log file for easy review.



## ⚠️ Important Note: Network Scanning

- **Prerequisites:** The **`nmap`** network scanning tool must be installed on your system.
- **Permissions:** Scan types like the default **TCP SYN Scan (`-sS`)** often require **root/sudo** privileges to run. You may need to execute the script using `sudo ./moreFlexScan.sh ...`.
- **Ethical Use:** Only scan networks and hosts you have explicit permission to test. Unauthorized network scanning may be illegal or violate terms of service.




## 🚀 Features

- **Pre-defined Scans:** Simplifies complex Nmap commands into easy-to-remember options: tcp, udp, and service.

- **Automatic Logging:** Every scan output is written to a unique, time-stamped log file, ensuring no results are lost.

- **Dedicated Log Directory:** Log files are organized in a specific directory within your home folder.




## 💡 Usage

The script requires **two positional arguments**: the target IP address and the desired scan type.

### 1. Prerequisites

- The `nmap` network scanning tool must be installed on your system.

- Execution permission (and potentially `sudo` access).

### 2. Make the script executable

First, ensure the script has execution permission:

```bash
chmod +x flexScan.sh
```


### 3. Run the script

Use the following syntax:

```bash
./flexScan.sh [IP_ADDRESS] [SCANTYPE]
```

| Argument | Descrption | Valid Options | Nmap Command Used |
|----------|------------|---------------|-------------------|
| `[IP_ADDRESS]` | The target IP address or hostname. | `192.168.1.1` | N/A |
| `[SCANTYPE]` | The type of scan to perform. | `tcp`, `udp`, `version` | `-sS` TCP-Scan, `-sU` UDP-Scan, `-sV` Service/Version Detection |


### 4. Examples

To run a **TCP SYN** scan against `192.168.1.100`:

```bash
./flexScan.sh 192.168.1.100 tcp
```

To run a **Service/Version** scan against the target (useful after a TCP scan):
```bash
./flexScan.sh 192.168.1.100 service
```


#### Example Output

Once the scan is complete, the script will output the location of the log file:
```text
Starting nmap scan: -sS 192.168.1.100
Scan completed.
Scan log saved in:
/home/user/Documents/logFiles/FlexScanLogs/flexScan_tcp_2025-10-12_08-30-00.log
```


## ⚙️ Log File Management

All scan results are saved to a time-stamped log file in the following directory:

```bash
$HOME/Documents/logFiles/FlexScanLogs/
```

The log file name will be formatted as: `flexScan_<SCANTYPE>_YYYY-MM-DD_HH-MM-SS.log`



## 📝 License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.