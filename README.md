# Intro to Ethereum and Sample Solidity Contracts

This repo is meant to be a guide to help developers get up and running with solidity contracts.

#### Useful javascript console commands:

    personal.newAccount()
    personal.unlockAccount(eth.accounts[0])
    eth.accounts
    web3.fromWei(eth.getBalance(eth.accounts[0]))
    eth.sendTransaction({from:eth.accounts[0], to:"0x78cceb41fbc9a3db8746ead04d2db81b37ae9617",value:web3.toWei(1)})
    personal.unlockAccount(eth.accounts[0])
    admin.peers
    admin.nodeInfo
    eth.getTransaction(<tx_hash>)


#### Guest List Contract Helpers:

    var guestlistContract = web3.eth.contract([{"constant":false,"inputs":[{"name":"_name","type":"string"}],"name":"signList","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"guests","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"printLastGuest","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"guestNumber","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"guestList","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"inputs":[],"type":"constructor"}]);
    var guestlist = guestlistContract.at("0x0de4f2933334333253642fcfa855d71f37e7b83a");
    guestlist.signList("Your_Name",{from:eth.accounts[0],gas:300000})
    guestlist.printLastGuest.call();
    guestlist.guests(eth.accounts[0]);




#### Useful Links:

Solidity Online Compiler - https://ethereum.github.io/browser-solidity/#version=soljson-v0.4.2+commit.af6afb04.js

Solidity (smart contract language) - https://solidity.readthedocs.io/en/develop/

Javascript console commands (interact with blockchain using this console) - https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console
