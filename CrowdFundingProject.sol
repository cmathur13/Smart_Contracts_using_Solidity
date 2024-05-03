// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding{

    address public manager;
    mapping(address=>uint) contributors;
    uint public deadline;
    uint public target;
    uint minimumContribution;
    uint public raisedAmount;
    uint public noOfContributors;


    struct Request{
        string description;
        address payable recipient;
        uint value;
        bool completed;
        uint noOfVoters;
        mapping(address=>bool)voters;
    }
    mapping(uint => Request)public request;
    uint public numRequest;

    constructor(uint _target, uint _deadline)
    {
        target = _target;
        deadline = block.timestamp + _deadline;
        minimumContribution = 100 wei;
        manager = msg.sender;
    }

    function sendEth()public payable{
        require(block.timestamp < deadline , "Deadline has passed");
        require(msg.value >= minimumContribution , "Minimum contribution is not matched");

        if(contributors[msg.sender]==0){
            noOfContributors++;
        }

        contributors[msg.sender]+=msg.value;
        raisedAmount+=msg.value;
    }

    // this will represent the balance of smart contract;
    function getContractBalance()public view returns(uint){
        return address(this).balance;
    }

    // this will refund after the deadline
    function refund() public 
    {
        require(block.timestamp > deadline  && raisedAmount<target ,"You are not eligible");
        require(contributors[msg.sender]>0);
        address payable user = payable(msg.sender);
        user.transfer(contributors[msg.sender]);
        contributors[msg.sender] = 0;
    }


    //create a modifier to improve code reusability
    modifier onlyManager(){
        require(msg.sender == manager , "Only manager can call this function"); 
        _;
    }

    //to create a request
    function createRequests(string memory _description , address payable _recipient , uint _value) public onlyManager {
        //whenever a struct contains a mapping its is made up of storgae type
        //it is like reference type or pointer
        Request storage newRequest = request[numRequest];
        numRequest++;
        newRequest.description = _description;
        newRequest.recipient = _recipient;
        newRequest.value = _value;
        newRequest.completed = false;
        newRequest.noOfVoters = 0;
    } 

    //whenever a user want to vote the request of manager
    function voteRequest(uint _reuqestNo)public {
        require(contributors[msg.sender]>0 , "You must be a Contributors");
        Request storage thisRequest = request[_reuqestNo];
        require(thisRequest.voters[msg.sender]==false , "You already have voted");
        thisRequest.voters[msg.sender] = true;
        thisRequest.noOfVoters++;
    }

    //make payment on succesful vote
    function makePyament(uint _reuqestNo)public onlyManager{
        require(raisedAmount>=target);
        Request storage thisRequest = request[_reuqestNo];
        require(thisRequest.completed == false ,"The request is completed");
        require(thisRequest.noOfVoters > noOfContributors/2 , "The majority does not support");
        thisRequest.completed = true;
        thisRequest.recipient.transfer(thisRequest.value);
    }


}
