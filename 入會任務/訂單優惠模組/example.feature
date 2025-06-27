@game_creation
Feature: Game Creation
  As a player
  I want to create or join a game
  So that I can start playing 1A2B game

  Scenario: Create a new game
    Given no existing game
    When a player joins a game with:
      | gameId | playerName |
      | ABC | Johnny |
    Then a new game should be created with:
      | gameId | state |
      | ABC | Waiting for player |
    And the game 'ABC' should have 1 player:
      | playerId | playerName |
      | P1 | Johnny |

  Scenario: P2 Join an existing game
    Given scenario Game Creation: Create a new game
    When a player joins a game with:
      | gameId | playerName |
      | ABC | Sean   |
    Then the game 'ABC' should be:
      | state |
      | Setting secret |
    And the game 'ABC' should have 2 players:
      | id | name |
      | P1 | Johnny   |
      | P2 | Sean  |

  Scenario: Game join fails when game is full
    Given scenario Game Creation: P2 Join an existing game
    When a player joins a game with:
      | gameId | playerName |
      | ABC | Roy   |
    Then the request fails