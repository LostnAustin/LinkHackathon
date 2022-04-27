// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

//for errors
error Staking__TransferFailed();
error Staking__NeedsMoreThanZero();

contract Staking {
  IERC20 public s_stakingToken;

  mapping(addresss => uint256) public s_balances
  
  mapping(address => uint256) public s_userRewardPerTokenPaid;
  
  mapping(address => uint256) public s_rewards;

  uint256 public s_totalSupply;
  uint256 public s_rewardPerTokenStored;
  uint256 public s_lastUpdateTime;
  uint256 public REWARD_RATE

  modifier updateReward(address account) {
    //define how much per token, last timestamp, periods of time
    s_rewardPerTokenStored = rewardperToken();
    s_lastUpdateTime = block.timestamp - s_lastUpdateTime) * REWARD_RATE * 1e18 / s_totalSupply);
    s_rewards[account] = earned(account)
}
  
  modifier moreThanZero(uint256 amount) {
    if( amount === 0) {
    revert Staking__NeedsMoreThanZero();
    _;
  }
  constructor(address stakingToken, address rewardToken) {
    s_stakingToken = IERC20(stakingToken);
    s_rewardToken = IERC@)(rewardToken);
  }
  
  function earned(address account) public view returns(uint256) {
    uint256 currentBalance = s_balances[account];
    uint256 amountPaid = s_userRewardPerTokenPaid[account];
    uint256 currentRewardPerToken = rewardPerToken();
    
    uint256 pastRewards =  s_reward[account];
    
    (currentBalance * (currentRewardPerToken - amountPaid)) / 1e18) + pastRewards;
  }

  function rewardPerToken public view returns(uint256) {
    if (s_totalSupply == 0 ) {
    return s_rewardPerTokenStored;
    }
    return s_rewardPerTokenStored + (((block.timestamp

  function stake(uint256 amount) external updateReward(msg.sender){
  //keep tracker of user, balance, staked amount

  s_balances[msg.sender] = s_balances]msg.sender] + amount;
  s_totalSupply  = s_totalSupply + amount;
  
  //emit event
  bool success = s_stakingToken.transferFrom(msg.sender, address(this), amount);
  // above same as bool success = s_stakingToken.transferFrom(address(this), msg.sender, amount);
  
  if(!success) {
  revert Staking__TransferFailed();
  }
 
 
 function withdraw(uint256 amount) external updateReward(msg.sender){
  s_balances[msg.sender] = s_balances[msg.sender] - amount;
  s_totalSupply = s_totalSupply - amount;
  bool success = s_stakingToken.transfer(msg.sender, amount);
  
  function claimReward() external updateReward(msg.sender){
    uint256 reward = s_rewards[msg.sender];
    bool success = s_rewardsToke.transfer
    //how much reward
    //the contract is going to emix X tokens per second and disperse to stakers
    
  }
  
  //need to track time and amount staked for each person in order
  //to determine staking distribution
  //time = 1 PA: 80 staked 80 earned
  //time = 2 PA: 80 staked 160 earned withdrawn 0, PC stakes 1000
  //time = 3 PA 80 staked, earned: 240 + 40, withdraw: 0
  //PB 
  // when someone stakes or withdraws, we need to do some division
  //total # stakers / 
  }
  
  
  
  
