# 🧠 Week 1 – EVM & Solidity Foundations

Welcome to **Week 1** of the Celo Cipher Session!  
We’ve already stepped into the world of smart contracts — now it’s time to build something real and understand what powers it.

---

> 🗓️ **Deadline: Tuesday, April 29th, 2025**

All tasks must be submitted as a **pull request** to the class repo before the deadline.

---

## ✅ Your Tasks

This week, you’ll complete two parts:

---

### 1. 🔍 Research Prompt

Write a short research summary (200–400 words) answering:

> ❓ **What is the Ethereum Virtual Machine (EVM), and how does it execute smart contracts?**

Write the explanation in your **own words** — it doesn’t need to be too technical, but show that you understand the core idea.

📄 Save this as:

```bash
week-1/your-name/research.txt
```

_Example:_ `week-1/emmanuel/research.txt`

---

### 2. 🧮 Solidity Task – `Calculator.sol`

You're going to write a basic calculator contract using what we covered in class:

- Variables
- Functions
- Data types
- Variable access types (`public`, `private`)
- Function modifiers (`view`, `pure`)

📄 Save your contract as:

```
week-1/your-name/Calculator.sol
```

_Example:_ `week-1/emmanuel/Calculator.sol`

#### 🛠️ Your Contract Must Include

A contract named `Calculator` with the following functions:

| Function                | Description |
|-------------------------|-------------|
| `add(uint a, uint b)`         | Returns the sum of `a` and `b` |
| `subtract(uint a, uint b)`    | Returns the result of `a - b` |
| `multiply(uint a, uint b)`    | Returns the result of `a * b` |
| `divide(uint a, uint b)`      | Returns the result of `a / b` (assume `b` ≠ 0) |
| `storeResult(uint result)`    | Stores a result in a state variable |
| `getLastResult()`             | Returns the last stored result (state variable) |

#### ✅ Contract Requirements

- Use **`pure`** for functions that do not interact with state (`add`, `subtract`, etc.).
- Use **`view`** for functions that only read state (`getLastResult`).
- Use a **`public` state variable** to store the result.
- Use meaningful function and variable names.
- Add comments to explain what each function does.

---

## 📁 Folder Structure

Please follow this structure strictly:

```tree
week-1/
  your-name/
    research.txt
    Calculator.sol
```

---

## 📚 Helpful Resources

### On EVM & Ethereum

- [Ethereum.org – What is the EVM?](https://ethereum.org/en/developers/docs/evm/)
- [EVM Illustrated (Medium)](https://takenobu-hs.github.io/downloads/ethereum_evm_illustrated.pdf)
- [Ethereum Yellow Paper (for nerds)](https://ethereum.github.io/yellowpaper/paper.pdf)

### On Solidity

- [Solidity by Example](https://solidity-by-example.org/)
- [Solidity Docs](https://docs.soliditylang.org/)
- [Solidity Cheatsheet (GitHub)](https://github.com/manojpramesh/solidity-cheatsheet)

---

## ❗ Reminders

- **Don’t copy-paste code blindly.** You’ll learn faster by typing and debugging yourself.
- **No seed phrases, private keys, or `.env` files** should be pushed to GitHub — ever.
- Ask questions on the group if you get stuck. Debugging is part of the learning process.
- Late submissions are not guaranteed to be accepted unless you talk to me early.

---
