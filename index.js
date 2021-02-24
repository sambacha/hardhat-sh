#!/usr/bin/env node
import { execSync } from 'child_process';
console.log("==> Installing Hardhat and friends....");
execSync('npm install -D hardhat hardhat-deploy ethereum-waffle prettier prettier-plugin-solidity solhint solhint-plugin-prettier',function(error, stdout, stderr){
// {stdio:[0,1,2]});
	console.log(stdout);
});
