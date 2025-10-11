# 📜 Vigenère Cipher Table Generator (`vigenereTable.sh`)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

A simple, pure **Bash script** to generate and display the **Vigenère Square** (also known as the *Tabula Recta*) directly in your terminal. This tool is primarily educational, helping to visualize the basis for Vigenère encryption and decryption.

---

## 🚀 Features

* **Educational Tool:** Provides a clear visual representation of the $26 \times 26$ grid used in the Vigenère cipher.
* **Pure Bash:** Uses standard Unix commands (`head`, `tail`, `sed`) and built-in shell features, requiring no external packages.
* **Clear Formatting:** Formats the output with spacing and a header for easy readability.

---

## 💡 Usage

This script requires **no arguments**. Simply run it to generate the full Vigenère table.

### 1. Make the script executable

First, ensure the script has execution permission:

```bash
chmod +x vigenereTable.sh
```

### Run the script

Execute the script directly:

```bash
./vigenereTable.sh
```

## Example Output

The output will display the alphabet header followed by the 26 cyclically shifted rows:

![Vigenère-Table Output](/tools/cybersec/cryptoUtils/vignereTable/ressourcen/vigenereTableOutput.png)



## ⚙️ How It Works

The script's primary function is to cyclically shift the alphabet 26 times. It uses a `for` loop combined with `head` and `tail` for efficient string manipulation:

1. The base `alphabet` variable is set to 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
2. In each iteration of the loop, the alphabet is split into a **prefix** (the part to move to the end) and a **suffix** (the part that remains at the front).

3. The `head` command takes the first $i$ characters (the part to be moved).

4. The `tail` command takes the remaining $26−i$ characters (the new starting segment).

5. These two parts are concatenated as `$suffix$prefix` to create the cyclically shifted row.

6. The sed command (`sed 's/./& /g'`) is used to insert a space after every character, ensuring the output is visually aligned.




## 📝 License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.