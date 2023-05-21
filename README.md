# circom-starter
This is a starter kit to develop zk-snark based application in which constraints can be written in circom and verification can be done in the solidity code which can be deployed and verified on-chain.


## Installation

Dependencies node,circom,circomlib,snarkjs

mandatory 
```Commands
npm install
```

1) Compiles circom circuit (npm run compile ./circuits/circuit).
```Commands
1) npm run compile 
```
2) Compiles circuit, generates witness, performs powers of tau ceremony, contributes to pot, exports verification key, generates proof and verifies it.
```Commands
2) npm run build 
```
3) generates a solidity verifier.
```Commands
3) npm run gen-sc 
```
4) generates zkproof which can be passes into a smart contract verifier.

```Commands
5) npm run gen-calldata 
```

6) generates bot publinInput proof and callData for sc.
```Commands
6) npm run gen-params 
```
7) clears circuit related data from current directory.

```Commands
7) npm run clean
```


## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.