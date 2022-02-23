var HelloBlockchain = artifacts.require("HelloBlockchain");
var GeneratePhrase = artifacts.require("GeneratePhrase");
var Arg = "Hello world";
module.exports = deployer => {
    //deployer.deploy(HelloBlockchain, Arg);
    deployer.deploy(GeneratePhrase);
};