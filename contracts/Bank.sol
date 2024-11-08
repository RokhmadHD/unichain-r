// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract Bank {
    mapping(address => uint256) private balances;

    // Event untuk mencatat aktivitas deposit
    event Deposit(address indexed user, uint256 amount);

    // Event untuk mencatat aktivitas penarikan
    event Withdrawal(address indexed user, uint256 amount);
    // Fungsi untuk melakukan deposit native ETH
    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        
        // Tambah saldo pengguna
        balances[msg.sender] += msg.value;

        // Emit event Deposit
        emit Deposit(msg.sender, msg.value);
    }

    // Fungsi untuk melakukan penarikan native ETH
    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdraw amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Kurangi saldo pengguna
        balances[msg.sender] -= amount;

        // Transfer ETH ke pengguna
        payable(msg.sender).transfer(amount);

        // Emit event Withdrawal
        emit Withdrawal(msg.sender, amount);
    }

    // Fungsi untuk mengecek saldo pengguna
    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}
