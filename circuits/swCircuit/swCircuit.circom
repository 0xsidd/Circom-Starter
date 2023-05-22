pragma circom 2.1.4;

include "../../node_modules/circomlib/circuits/poseidon.circom";

template PoseidonHasher() {
    //Public signals
    signal input hash; 
    signal input txAmtPub;
    signal input callDataPub[10];


    //Private signals
    signal input preImage;
    signal input nonce;
    signal input txAmtPriv;
    signal input callDataPriv[10];

    //Internal signals
    signal nonceSquare;


    //Logic
    nonceSquare <== nonce*nonce;
    component hasher = Poseidon(1);
    hasher.inputs[0] <== preImage;
    
    hash === hasher.out;
    txAmtPriv === txAmtPub;
}

component main { public [hash,txAmtPub] } = PoseidonHasher();