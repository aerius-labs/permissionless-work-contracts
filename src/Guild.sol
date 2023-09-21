// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solmate/auth/Owned.sol";
import "solmate/utils/ReentrancyGuard.sol";
import "openzeppelin/utils/structs/EnumerableMap.sol";

contract Guild is Owned, ReentrancyGuard {
    using EnumerableMap for EnumerableMap.UintToUintMap;

    struct Contributor {
        string name;
        address contributorAddress;
    }

    struct Salary {
        uint256 cumulativeSalary;
        uint256 claimedSalary;
    }

    struct Contribution {
        uint256 cumScore;
        EnumerableMap data;
    }

    mapping(address => Contributor) public contributors;
    mapping(address => mapping(uint8 => Contribution)) public contributions;

    mapping(address => Salary) public claimedSalary;

    constructor(address owner) Owned(owner) {}

    function addContributor(
        address contributorAddress,
        uint256 devScore,
        uint256 problemSolvingScore,
        uint256 designScore
    ) external onlyOwner {
        contributors[contributorAddress] = Contributor(devScore, problemSolvingScore, designScore);
    }

    function addMoneyToSalaryPool(uint256 month, uint256 year, uint256 amount) external onlyOwner {
        salaryPool[year][msg.sender] += amount;
    }

    function calculateCumSalary(address contributorAddress) external {
        Contributor storage contributor = contributors[contributorAddress];
        uint256 totalSalary = 0;

        // Calculate salary based on scores or other criteria
        // Replace with your actual salary calculation logic

        claimedSalary[contributorAddress] += totalSalary;
    }

    function claimSalary(address contributorAddress, uint256[] memory months) external {
        require(msg.sender == contributorAddress, "Only contributor can claim salary");
        uint256 totalUnclaimedSalary = 0;

        // Calculate total unclaimed salary for specified months
        // Replace with your actual calculation logic

        claimedSalary[contributorAddress] += totalUnclaimedSalary;
        // Transfer totalUnclaimedSalary to the contributor
        // Replace with actual transfer logic
    }
}
