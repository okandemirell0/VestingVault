//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TimeLocked{
    struct VestingSchedule {
    uint256 totalAmount;
    uint256 released;
    uint256 start;
    uint256 cliff;
    uint256 duration;
    bool revoked;
}
mapping(address => VestingSchedule) public vestings;
IERC20 public myToken;
address public owner;
VestingSchedule public avesting;

constructor (address _mytoken) {
    owner = msg.sender;
    myToken = IERC20(_mytoken);
}
modifier onlyOwner() {
    require(msg.sender == owner , "dont have a permission");
    _;
}

function createVesting(
    address beneficiary,
    uint256 totalAmount,
    uint256 start,
    uint256 cliffDuration,
    uint256 duration
) external onlyOwner {
    require(beneficiary != address(0), "invalid beneficiary");
    require(totalAmount > 0, "amount is zero");
    require(duration > 0, "duration is zero");
    require(cliffDuration <= duration, "cliff > duration");

    VestingSchedule memory schedule = VestingSchedule({
        totalAmount: totalAmount,
        released: 0,
        start: start,
        cliff: start + cliffDuration,
        duration: duration,
        revoked: false
    });

    vestings[beneficiary] = schedule;
}
function release(address beneficiary) external {
    require(beneficiary != address(0), "invalid beneficiary");

    VestingSchedule storage vesting = vestings[beneficiary];

    require(!vesting.revoked, "vesting revoked");
    require(block.timestamp >= vesting.cliff, "cliff not reached");

    uint256 elapsedTime = block.timestamp - vesting.start;

    if (elapsedTime > vesting.duration) {
        elapsedTime = vesting.duration;
    } 

    uint256 vestedAmount = (vesting.totalAmount * elapsedTime) / vesting.duration;
    uint256 releasable = vestedAmount - vesting.released;
    require(releasable > 0, "nothing to release");
    vesting.released += releasable;
    require(myToken.transfer(beneficiary, releasable), "transfer failed");
} 




}



    



































