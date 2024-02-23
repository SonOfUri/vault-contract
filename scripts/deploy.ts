import { ethers } from "hardhat";

async function main() {

  const beneficiaryAddress = '0x1234567890123456789012345678901234567890'; // Beneficiary's address
  const unlockTime = Math.floor(Date.now() / 1000) + 3600; // Set unlock time to 1 hour from now

  const vault = await ethers.deployContract("Vault", [beneficiaryAddress, unlockTime ]);
  await vault.waitForDeployment();


  
  console.log(
    `Vault deployed to ${vault.target}`
  );

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
