# 🔒 Secure Password Generator (`pwGenerator.sh`)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

A simple, command-line utility for generating strong, random passwords of a user-defined length. This script utilizes a large character set for high entropy and immediately provides the password in both **plaintext** and **Base64 encoded** formats.

---

## 🚀 Features

- **High Entropy:** Uses a comprehensive character set including uppercase, lowercase, numbers, and numerous special characters (`!`, `§`, `$`, `&`, etc.) for strong randomness.
- **User-Defined Length:** The length of the generated password is controlled by a single input argument.
- **Base64 Encoding:** Automatically converts the generated password to a Base64 string, useful for applications requiring this specific format.

---

## 💡 Usage

The script requires **one positional argument**: the desired length of the password (as an integer).

### 1. Make the script executable

First, ensure the script has execution permission:

```bash
chmod +x pwGenerator.sh
```

### 2. Run the script
Use the following syntax:

```bash
.pwGenerator.sh [PASSWORD_LENGTH]
```

| Argument | Description | Example Value |
|----------|-------------|---------------|
| `[PASSWORD_LENGTH]` | The number of characters for the password. | `32` |



### 3. Example
To generate a password **32 characters longs**:
```bash
./pwGenerator.sh 32
```

#### Example Output:

```text
Genreated password: u2a?M+9:T">g&4(D#f/hS-B!sVd<Z06
BASE64: dTJhP00rOToiPmcmNChEI2YvaFMtQiFzVmQ8WjA2Cg==
```

### 4. Invalid Input
If you run the script without specifying a length, it will display a warning and exit:

```bash
./pwGenerator.sh
# Output:
# [WARNING] Invalid input.
# Usage: ./pwGenerator.sh <PW Length>
```


## ⚙️ How It Works

The script leverages the shell's internal `$RANDOM` variable and string manipulation:

- **Character Set:** A comprehensive set variable holds all possible characters.

- **Random Selection:** Inside a loop, `$RANDOM % ${#set}` generates a random index within the length of the character set.

- **String Slicing:** The expression `${set:$RANDOM % ${#set}:1}` selects a single random character from the set.

- **Base64 Encoding:** The final password is piped to the base64 utility: `echo -n "$rand" | base64`. The `-n` flag prevents `echo` from adding a newline character before encoding, ensuring the integrity of the Base64 hash.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.