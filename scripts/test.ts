import { ethers } from "hardhat";

const main = async () => {

    // Get Bank Factory
    const bank = await ethers.getContractAt(
        "Bank",
        "0xD92d5B2331ed7784746C9e65b9fB6AF25C791183"
    );

    // Deposit 0.001 ETH
    await bank.deposit({ value: ethers.parseEther("0.001") });

    // Cek saldo
    const balance = await bank.getBalance();
    console.log("Your balance:", ethers.formatEther(balance));

    // Withdraw 0.0001 ETH
    await bank.withdraw(ethers.parseEther("0.0001"));
};

main();
