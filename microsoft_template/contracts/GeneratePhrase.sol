// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

contract GeneratePhrase {
    string[] public phrases = [
        "The positive consequences of globalization outnumber the negative ones. (RELATE THIS IDEA TO BNW NOVEL)",
        "The negative consequences of globalization outnumber the positive ones. (RELATE THIS IDEA TO BNW NOVEL)",
        "Due to globalization, some cultures are at risk. (RELATE THIS IDEA TO BNW NOVEL)",
        "The process of globalization favours smaller economies. (RELATE THIS IDEA TO BNW NOVEL)",
        "English is spoken worldwide because of globalization. (RELATE THIS IDEA TO BNW NOVEL)",
        "Most of our traditions are disappearing due to globalization. (RELATE THIS IDEA TO BNW NOVEL)",
        "DISCRIMINATION IS PRESENT IN ALL THE JOBS. RELATE THIS IDEA TO BNW",
        "POSITIVE DISCRIMINATION DOES NOT EXIST IN NOWADAYS SOCIETY. RELATE THIS IDEA TO BNW.",
        "DISCRIMINATION IS NEVER UNCOUNSCIOUS. RELATE THIS IDEA TO BNW",
        "DISCRIMINATION, PREJUDICE AND STEREOTYPES ARE SYNONYMS. RELATE THIS IDEA TO BNW",
        "LEADERS ARE ESSENTIAL IN POLITICS. RELATE THIS IDEA TO BNW",
        "BOSSES AND LEADERS SHOULD CO-EXIST IN ANY JOB. RELATE THIS IDEA TO BNW",
        "LEADERS ARE BORN, NOT MADE. RELATE THIS IDEA TO BNW",
        "LEADERS SHOULD ALWAYS HAVE BETTER SKILLS THAN THEIR EMPLOYEES IN ORDER TO BE RESPECTED. RELATE THIS IDEA TO BNW"
    ];

    function getRamdomPhrase() public view returns (string memory) {
        uint256 phrasesCount = phrases.length;
        uint256 nowTime = block.timestamp;
        uint256 randomObtained = uint256(keccak256(abi.encodePacked(nowTime)));
        uint256 randomPosition = randomObtained % phrasesCount;

        return phrases[randomPosition];
    }

    function getPhrases() public view returns (string[] memory) {
        return phrases;
    }
}
