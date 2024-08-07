// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Test3 {
/*
간단한 게임이 있습니다.
유저는 번호, 이름, 주소, 잔고, 점수를 포함한 구조체입니다. 
참가할 때 참가비용 0.01ETH를 내야합니다. (payable 함수)
4명까지만 들어올 수 있는 방이 있습니다. (array)
선착순 4명에게는 각각 4,3,2,1점의 점수를 부여하고 4명이 되는 순간 방이 비워져야 합니다.

예) 
방 안 : "empty" 
-- A 입장 --
방 안 : A 
-- B, D 입장 --
방 안 : A , B , D 
-- F 입장 --
방 안 : A , B , D , F 
A : 4점, B : 3점 , D : 2점 , F : 1점 부여 후 
방 안 : "empty" 

유저는 10점 단위로 점수를 0.1ETH만큼 변환시킬 수 있습니다.
예) A : 12점 => A : 2점, 0.1ETH 수령 // B : 9점 => 1점 더 필요 // C : 25점 => 5점, 0.2ETH 수령

* 유저 등록 기능 - 유저는 이름만 등록, 번호는 자동적으로 순차 증가, 주소도 자동으로 설정, 점수도 0으로 시작
* 유저 조회 기능 - 유저의 전체정보 번호, 이름, 주소, 점수를 반환. 
* 게임 참가시 참가비 제출 기능 - 참가시 0.01eth 지불 (돈은 smart contract가 보관)
* 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전
* 관리자 인출 기능 - 관리자는 0번지갑으로 배포와 동시에 설정해주세요, 관리자는 원할 때 전액 혹은 일부 금액을 인출할 수 있음 (따로 구현)
---------------------------------------------------------------------------------------------------
* 예치 기능 - 게임할 때마다 참가비를 내지 말고 유저가 일정금액을 미리 예치하고 게임할 때마다 자동으로 차감시키는 기능.
*/


struct user {
    uint Num;
    string Name;
    string Address;
    uint Asset;
    uint Point;
}

user[4] users;

    function givePoint() public {
       users[] = users(Name, Address, Asset, Score);

        if (user[0]) {
            user[0].Point += 4;
        } else if (user[1]) {
             user[1].Point += 3;
        } else if (user[2]) {
             user[2].Point += 2;
        } else if (user[3]) {
             user[3].Point += 1;
        } 
    }

    function changeP(uint _point) public pure returns(uint) {
        require(_point % 10 == 0, "Per 10Point");

      
        for (uint i = 1; i < _point; i++){
            if (_point / 10 == i) {
                return i * 0.1; 
            }}
    }

    

}



/*
address payable owner;
mapping(address=>USER) users;
USER[4] room;
uint public idx=1;

constructor() {
    owner = payable(msg.sender);
}

    function withDraw(uint _n) public {
        require(msg.sender == owner, "nope")
        owner.transfer(_n * 0.01 ether);
    }

    function withDraOwnerMax() public {
        require(msg.sender == owner, "nope");
        owner.transfer(address(this).balance)
    }

    function signIN(string memory _name) public {
      users[msg.sender]  = USER(idx++, _name, msg.sender, 0 ,0)
    }

    function search(address _addr) public view returns(USER memory) {
        
    }

    function join() public payable {
        require(msg.value == 0.01 ether || users[msg.sender].balance >= 0.01 ether, "Nope");

        if(msg.value ==0) {
            users[msg.sender].balance -= 0.01 ether;
        }

        if(getLength()==3){
            room[3] = users[msg.sender];
            delete room;
        } else {
            room[getLength()] = users[msg.sender]
        }

    }

    function getLength() public view returns(uint) {
        for(uint i=0; i<4; i++) {
            if(room[i].number == 0){
                return i;
        }
        return 4;
    }

    function getScore() public {
        for(uint i=0; i<4; i++){
            room[i].score += 4 - i;
    }

    function withDrawTen() public {
        require(users[msg.sender].score >= 10, "nope");
        users[msg.sender].score -=10;
        payable(msg.sender).transfer(0.1 ether);
    }

    function withDraw(uint _n) public {
     require(users[msg.sender].score >= _n, "nope");
        users[msg.sender].score -= _n;
        payable(msg.sender).transfer((_n/10) * 0.1 ether);
    }

    function deposit() public payable {
        users[msg.sender].balance += msg.value;
    }

   

*/

