const GeneratePhrase = artifacts.require("GeneratePhrase");
contract('GeneratePhrase', (accounts) => {

    it('testing getRamdomPhrase of GeneratePhrase', async () => {
        const GeneratePhraseInstance = await GeneratePhrase.deployed();
        const bob = accounts[0];

        const returnedPhrase = await GeneratePhraseInstance.getRamdomPhrase({ from: bob });
        console.log('\n\n\n\n\n\tLA FRASE QUE TOCO ES:  ----------------------------------->\n\n\t\t"' + returnedPhrase + '"\n\n\n\n');

        await GeneratePhraseInstance.getPhrases({ from: bob }).then(result => {
            for (const element of result) {
                if (element == returnedPhrase) {
                    assert.equal(returnedPhrase, element);
                }
            }
        }
        )
    });
});