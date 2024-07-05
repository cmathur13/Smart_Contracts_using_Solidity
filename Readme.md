Solidity Smart Contracts Project

This project contains three separate smart contracts developed using Solidity for the Ethereum blockchain. Each contract demonstrates different features and functionalities, showcasing various aspects of smart contract development.
Contracts
1. CrowdFunding Contract

This contract implements a decentralized crowdfunding platform where contributors can fund a project, and the manager can create and execute spending requests based on contributor votes.
Features:

    Manager and Contributors: Manages contributors and tracks their contributions.
    Fundraising Target and Deadline: Sets a fundraising target and deadline.
    Requests: Allows the manager to create spending requests and contributors to vote on them.
    Refunds: Provides refunds to contributors if the target is not met by the deadline.

Key Functions:

    sendEth(): Allows contributors to send funds to the contract.
    getContractBalance(): Returns the balance of the contract.
    refund(): Refunds contributors if the fundraising goal is not met.
    createRequests(): Creates spending requests.
    voteRequest(): Allows contributors to vote on spending requests.
    makePayment(): Transfers funds to the recipient if the request is approved by the majority.

2. HotelRoom Contract

This contract simulates a hotel room booking system where users can book a room by sending Ether to the contract. The contract tracks the status of the room and handles payments.
Features:

    Room Status: Tracks the status of the room (Vacant or Occupied).
    Booking and Payments: Allows users to book the room by sending Ether.
    Modifiers and Events: Utilizes modifiers to check room status and event logging for bookings.

Key Functions:

    receive(): Handles Ether transfers for booking the room, checks room status, and emits an event when the room is booked.

3. ZombieFactory Contract

This contract is a simple game-like example where users can create zombies with randomly generated DNA. The contract stores the zombie data and logs the creation events.
Features:

    Zombie Creation: Generates and stores zombie data.
    Random DNA Generation: Generates random DNA for each zombie.
    Events: Logs the creation of new zombies.

Key Functions:

    _createZombie(): Creates a new zombie and emits an event.
    _generateRandomDna(): Generates random DNA based on a given string.
    createRandomZombie(): Creates a new zombie with random DNA based on a provided name.

Getting Started

To deploy and interact with these contracts, you will need:

    An Ethereum development environment (e.g., Remix, Truffle).
    A test Ethereum network or a local blockchain instance (e.g., Ganache).
    Metamask or any other Ethereum wallet.

Steps:

    Clone this repository.
    Open the contract files in your preferred Ethereum development environment.
    Compile the contracts.
    Deploy the contracts to your test network or local blockchain.
    Interact with the contracts using the provided functions.

License

This project is licensed under the GNU General Public License v3.0. See the LICENSE file for details.
