#!/usr/bin/env node
var child_process = require('child_process');
child_process.execSync('npm install -D hardhat hardhat-deploy ethereum-waffle prettier prettier-plugin-solidity solhint solhint-plugin-prettier',{stdio:[0,1,2]});
console.log("HardHat.sh Project Initialized");
