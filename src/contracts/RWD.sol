pragma solidity ^0.5.16;

// 送金するコントラクト

contract RWD {
  string public name = 'Reward Token';
  string symbol = 'RWD';
  uint256 public totalSupply = 1000000000000000000; // 1 million tokens
  uint public decimals = 18;

  event Transfer(
    address indexed _from
    address indexed _to,
    uint _value
  );

  event Approval(
    address indexed _owner
    address indexed _spender,
    uint _value
  );

  mapping(address => uint256) public balanceOf;
  mapping(address => mapping(address => uint256)) public allowance;

  constructor(){
    balanceOf[msg.sender] = totalSupply
  }
  // 送信先アドレスと金額を引数にとる
  function transfer(address _to, uint256 _value) public return (bool success) {
    // require that the value is greater or equal for transfer
    require(balanceOf[msg.sender] >= _value);
    // transfer the amount and subtract the balane
    // 送信者のアカウントから金額を減らす
    balanceOf[msg.sender] -= _value;
    // add the balance
    // 受信者の金額を増やす
    balanceOf[_to] += _value;
    // eventを実行
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  function approve(_spender, uint256 _value) public returns (bool success){
    allowance[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns(bool success){
    require(_value <= balanceOf[_from]);
    require(_value <= allowance[_from][msg.sender]);
    // add the balance
    balanceOf[_to] += _value;
    // subtract the balance for transfrom
    balanceOf[_from] -= _value;
    allowance[msg.sender][_from] -= _value;
    emit Transfer(_from, _to, _value);
    return true;
  }
}
