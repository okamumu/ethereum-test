
# Test for Ethereum in Docker

## Set up

1. Clone a git repository to local
    ```
    git clone https://github.com/okamumu/ethereum-test.git
    cd ethereum-test
    ```
1. Build a docker image
    ```
    docker build -t ethereum-test .
    ```
1. Run `geth` console with the docker image
    ```
    docker run --rm --name ethereum-test -it ethereum-test
    ```

## Test in the console of geth

- Example for making a transaction

```
user1 = personal.newAccount("pass1")
user2 = personal.newAccount("pass2")
miner.start()
eth.mining

// wait for a while to make some blocks

eth.blockNumber
web3.fromWei(eth.getBalance(user1), "ether")
web3.fromWei(eth.getBalance(user2), "ether")

personal.unlockAccount(user1) // type a passphrase for user1
tx = eth.sendTransaction({from: user1, to: user2, value: web3.toWei(1, "ether")})
eth.getTransaction(tx)
web3.fromWei(eth.getBalance(user1), "ether")
web3.fromWei(eth.getBalance(user2), "ether")
```
