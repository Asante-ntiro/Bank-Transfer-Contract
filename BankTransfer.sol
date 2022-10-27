// SPDX-Licence-Id: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";
// Imports OpenZeppelin Contracts/util/strings contract

contract Bank{

    uint pay_id = 1;
    //for tracking the bank transfer information

    struct BankTransaction{
        string payment_id;
        address sender_id;
        address receiver_id;
        uint value;
        uint timestamp;
        string note;
        bytes20 payment_hash;
    }

    function AddPayment(address payable _receiver_id, uint256 _value, string memory _note){
        string memory _payment_id = string(abi.encodedPacked("payment_id", "+", Strings.toString(pay_id));
        uint256 _timestamp = block.time;
        bytes20 _payment_hash = ripemd160(
            abi.encodePacked(
                _payment_id,
                msg.sender,
                _recipient_id,
                _value,
                _timestamp
            )
        );
        BankTransaction memory transaction = BankTransaction(
            _payment_id,
            msg.sender,
            _recipient_id,
            _value,
            _timestamp,
            _note,
            _payment_hash
        );
        bank_ts[_payment_id] = transaction;
        ts[msg.sender].push(_payment_id);

        pay_id += 1;
    }

    function payment_Info(string memory _payment_id)
        public
        view
        returns (
            string memory,
            address,
            uint256,
            uint256,
            string memory,
            bytes20
        )
    {
        return (
            bank_ts[_payment_id].payment_id,
            bank_ts[_payment_id].sender_id,
            bank_ts[_payment_id].recipient_id,
            bank_ts[_payment_id].value_id,
            bank_ts[_payment_id].timestamp_id,
            bank_ts[_payment_id].note,
            bank_ts[_payment_id].payment_hash
        );
    }

    function getpayments(address payable _sender_id)
        public
        view
        returns (string[] memory)
    {
        return ts[_sender_id];
    }
}
    }
}
