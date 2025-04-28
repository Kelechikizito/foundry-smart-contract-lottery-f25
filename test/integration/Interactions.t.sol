// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// import {Test, console} from "forge-std/Test.sol";
// import {Raffle} from "../../src/Raffle.sol";
// import {DeployRaffle} from "../../script/DeployRaffle.s.sol";
// import {VRFCoordinatorV2_5Mock} from "@chainlink/contracts/src/v0.8/vrf/mocks/VRFCoordinatorV2_5Mock.sol";
// import {CreateSubscription, AddConsumer, FundSubscription} from "../../script/Interactions.s.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";

// contract Interactions is Test {
//     Raffle raffle;
//     HelperConfig public helperConfig;

//     address PLAYER_ONE = makeAddr("playerOne");
//     address PLAYER_TWO = makeAddr("playerTwo");
//     address PLAYER_THREE = makeAddr("playerThree");
//     address PLAYER_FOUR = makeAddr("playerFour");
//     uint256 constant STARTING_BALANCE = 10 ether;

//     function setUp() external {
//         DeployRaffle deploy = new DeployRaffle();
//         (raffle, helperConfig) = deploy.run();
//         vm.deal(PLAYER_ONE, STARTING_BALANCE);
//         vm.deal(PLAYER_TWO, STARTING_BALANCE);
//         vm.deal(PLAYER_THREE, STARTING_BALANCE);
//         vm.deal(PLAYER_FOUR, STARTING_BALANCE);
//     }

//     function testRaffleFlow() public {
//         // Arrange: Set up the subscription and add raffle as consumer
//         CreateSubscription createSub = new CreateSubscription();
//         createSub.createSubscriptionUsingConfig();

//         FundSubscription fundSub = new FundSubscription();
//         fundSub.fundSubscriptonUsingConfig();

//         AddConsumer addConsumer = new AddConsumer();
//         addConsumer.addConsumerUsingConfig(address(raffle));

//         // Act: Players enter the raffle
//         uint256 entranceFee = raffle.getEntranceFee();
//         vm.startPrank(PLAYER_ONE);
//         raffle.enterRaffle{value: entranceFee}();
//         vm.stopPrank();

//         vm.startPrank(PLAYER_TWO);
//         raffle.enterRaffle{value: entranceFee}();
//         vm.stopPrank();

//         vm.startPrank(PLAYER_THREE);
//         raffle.enterRaffle{value: entranceFee}();
//         vm.stopPrank();

//         vm.startPrank(PLAYER_FOUR);
//         raffle.enterRaffle{value: entranceFee}();
//         vm.stopPrank();

//         // Assert: Check players are added
//         assertEq(raffle.getNumberOfPlayers(), 4);

//         // Act: Fast-forward time to trigger upkeep
//         uint256 interval = helperConfig.getConfig().interval;
//         vm.warp(block.timestamp + interval + 1);
//         vm.roll(block.number + 1);

//         // Act: Perform upkeep to request random number
//         raffle.performUpkeep("");

//         // Act: Simulate Chainlink VRF response
//         VRFCoordinatorV2_5Mock vrfCoordinatorMock = VRFCoordinatorV2_5Mock(
//             helperConfig.getConfig().vrfCoordinator
//         );
//         uint256 requestId = 1; // Simplified for mock
//         uint256[] memory randomWords = new uint256[](1);
//         randomWords[0] = 12345; // Mock random number
//         vm.startPrank(address(vrfCoordinatorMock));
//         vrfCoordinatorMock.fulfillRandomWords(requestId, address(raffle));
//         vm.stopPrank();

//         // Assert: Verify raffle state and winner
//         assertEq(
//             uint256(raffle.getRaffleState()),
//             uint256(Raffle.RaffleState.OPEN)
//         );
//         assertEq(raffle.getNumberOfPlayers(), 0);
//         assert(raffle.getRecentWinner() != address(0));

//         // Assert: Verify winner received funds
//         address winner = raffle.getRecentWinner();
//         uint256 winnerBalance = winner.balance;
//         assertGt(winnerBalance, STARTING_BALANCE - entranceFee);
//     }
// }
