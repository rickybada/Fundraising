// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fundraising {
    address public owner;
    uint public balance = 0;
    uint public goal;
    uint public uniqueDonorsCount;
    enum Status {Open, Closed}
    Status public currentStatus;

    // Event to record a donation
    event DonationReceived(address donor, uint amount);

    // Mapping to check if an address has already donated
    mapping (address => bool) public hasDonated;

    // Variables set at the time of deployment
    constructor(uint _goal) payable {
        owner = msg.sender; 
        goal = _goal;
        currentStatus = Status.Open;
        balance = msg.value; // If you send Ether at deployment, it updates the balance
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be Owner");
        _;
    }

    // Function to allow donations
    function makeDonation() public payable {
        require(currentStatus == Status.Open, "Fundraising is closed, you cannot donate");
        require(msg.value >= 1, "The minimum donation is 1 Wei");
        balance += msg.value;

        emit DonationReceived(msg.sender, msg.value); // Emitting the event

        if (!hasDonated[msg.sender]) {
            // If it's the first time this address donates, increment the count of unique donors
            uniqueDonorsCount++;
            hasDonated[msg.sender] = true;
        }
    }

    // Function to withdraw (by founder)
    function makeWithdraw() external onlyOwner {
        require(balance > 0, "No funds to withdraw");

        uint amount = balance;
        balance = 0;
        payable(owner).transfer(amount);
    }

    // Function to monitor the fundraising target
    function checkTarget() external view returns (string memory) {
        if (balance == goal){
            return "Target achieved";
        } else if (balance > goal) {
            return "Target exceeded";
        } else {
            return "Target not achieved yet";
        }
    }

    // Function to close the fundraising
    function fundraisingClosure() public onlyOwner {
        require(currentStatus == Status.Open, "Fundraising already closed");
        currentStatus = Status.Closed;
    }
}
