# Functions and Errors 

This Solidity smart contract showcases various error handling techniques using the `assert`, `revert`, and `require` functions.

# License:
This contract is released under the MIT License.

# Prerequisites:
- Solidity ^0.8.0

## Contract Overview:

The `Function and Error` contract includes the following functions:

### test_require Function:

This function allows updating the value stored in the smart contract.
It takes a parameter a as input.
It uses the require() statement to enforce a condition: a must be grater than zero.
If the condition is not met, the function will revert with an error message.
If the condition is met, the value in the contract is exected abd returns the multiplication.

### test_assert Function:

This function demonstrates the usage of the assert() statement.
It takes one parameter num.
The function asserts that num should not be equal to zero.
If the assertion fails (i.e., num==0), the contract execution will halt and any changes made are reverted.

### test_revert:

This function returns the division value of two numbers.
The function first checks if the numerator is greater than the denominator; if it is, the function immediately reverts with an error message using the revert() statement.
Otherwise, it gets executed .
Finally, the function returns the integer value.

## Instructions:

1. Ensure you have Solidity ^0.8.0 installed.
2. Compile and deploy the `ErrorHandlingExample` contract to a compatible Ethereum network.
3. Interact with the deployed contract by invoking its functions and providing necessary inputs.

# Author:
Shivam Singh
