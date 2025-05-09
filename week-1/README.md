# 🧠 Week 1 – EVM & Solidity Foundations

Welcome to **Week 1** of the Celo Cipher Session!  
We’ve already stepped into the world of smart contracts — now it’s time to build something real and understand what powers it.

---

## Tuesday Tasks

> 🗓️ **Deadline: Tuesday, April 29th, 2025**

All tasks must be submitted as a **pull request** to the class repo before the deadline.

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

## Friday Tasks

Welcome back, builders!  
This week, you’ll be combining **everything** you've learned so far into **real projects** and **solid research**.

Please **complete all tasks** below before the deadline:

> 🗓️ **Deadline: Friday, 2nd May, 2025**

---

### 1. Research and Summarize 📖

**Reading Assignment**:  
Read the article:  
🔗 [Introduction to Smart Contracts - Solidity Docs](https://docs.soliditylang.org/en/v0.8.29/introduction-to-smart-contracts.html)

Then:

- Summarize the **key concepts** discussed.
- Write your summary in a `reading.txt` file.

Some key points to focus on while reading:
- How smart contracts work on Ethereum
- What is the EVM?
- How contract deployment works
- Gas usage and why it matters

🗂️ Save your summary here:

```
week-1/your-first-name/reading.txt
```

---

### 2. Build a Smart Contract Project 💻

You are to build a **Simple Voting App** smart contract!

**Contract Name**: `SimpleVoting.sol`

---

### 📜 Contract Requirements

✅ Your contract must:

- **Use a struct** to define a `Candidate`.
- **Use an array** to store candidates.
- **Use a mapping** to track if an address has voted.
- **Use an immutable** to store the owner address.
- **Use a custom modifier** (`onlyOwner`) to restrict some actions.

---

### 📚 Functions to Implement:

1. `addCandidate(string memory _name)`  
   - Only the owner can add candidates.

2. `vote(uint256 _candidateIndex)`  
   - A user can vote only **once**.
   - Voting increases the candidate’s vote count.

3. `getCandidate(uint256 _index)`  
   - Return the candidate’s name and vote count.

4. `getAllCandidates()`  
   - Return all candidates' details.

5. `winner()` *(Bonus Task)*  
   - Loop through candidates and find the candidate with the highest votes.

---

### 📂 Folder Structure

Your work should be organized like this:

```
week-1/
  your-first-name/
    reading.txt
    SimpleVoting.sol
```

Example:

```
week-1/
  emmanuel/
    reading.txt
    SimpleVoting.sol
```

---

### ✍🏽 Important Notes

- Make sure your code compiles without errors!
- Use **if/else** where necessary to control logic.
- **Use loops** (`for` or `while`) where appropriate.
- Apply **break** and **continue** where it makes sense.
- Practice writing clean and readable Solidity code.
- Comment your code briefly so others can understand your logic.

---

## 📚 Resources to Help You

- [Introduction to Smart Contracts - Solidity Docs](https://docs.soliditylang.org/en/v0.8.29/introduction-to-smart-contracts.html)
- [Solidity by Example - Structs and Mappings](https://solidity-by-example.org/structs/)
- [Control Structures in Solidity (if/else, loops)](https://docs.soliditylang.org/en/v0.8.29/control-structures.html)
- [Solidity Units and Globally Available Variables](https://docs.soliditylang.org/en/v0.8.29/units-and-global-variables.html)
- [Solidity Data Types](https://docs.soliditylang.org/en/v0.8.29/types.html)

---

# 🏆 Deliverables

By the deadline, you should have:

- A `reading.txt` with your article summary.
- A fully working `SimpleVoting.sol` smart contract.
- Neatly organized files under `week-1/your-name/`.

---

# 🚨 Reminders

- **Never upload your seed phrases or private keys to GitHub.**
- **Keep your file names neat.**
- **Ask for help** if you are stuck — don't copy your classmates' code.

### **Let's keep building! LFG 🚀**
