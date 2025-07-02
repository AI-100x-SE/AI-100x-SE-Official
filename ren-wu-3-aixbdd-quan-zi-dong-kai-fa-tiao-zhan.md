# 任務 3 - AI x BDD 全自動開發挑戰

### 任務指示

1.  請你用 AI x BDD 開發方法，來實現象棋程式：

    ```jsx
    Feature: Chinese Chess (象棋) Rules
      As a player
      I want to follow standard Chinese Chess rules
      So that I can play the game correctly

      We use (row, col) to indicate positions on a 9×10 board.
      Row 1 is Red’s bottom row; Row 10 is Black’s top row.
      Column 1 is the leftmost column from Red’s perspective.
      
      Each scenario sets up minimal conditions with relevant pieces.

      #################################################################
      # 1) GENERAL (將/帥)
      #################################################################
      @General
      Scenario: Red moves the General within the palace (Legal)
        Given the board is empty except for a Red General at (1, 5)
        When Red moves the General from (1, 5) to (1, 4)
        Then the move is legal

      @General
      Scenario: Red moves the General outside the palace (Illegal)
        Given the board is empty except for a Red General at (1, 6)
        When Red moves the General from (1, 6) to (1, 7)
        Then the move is illegal

      @General
      Scenario: Generals face each other on the same file (Illegal)
        Given the board has:
          | Piece         | Position |
          | Red General   | (2, 4)   |
          | Black General | (8, 5)   |
        When Red moves the General from (2, 4) to (2, 5)
        Then the move is illegal

      #################################################################
      # 2) GUARD (士/仕)
      #################################################################
      @Guard
      Scenario: Red moves the Guard diagonally in the palace (Legal)
        Given the board is empty except for a Red Guard at (1, 4)
        When Red moves the Guard from (1, 4) to (2, 5)
        Then the move is legal

      @Guard
      Scenario: Red moves the Guard straight (Illegal)
        Given the board is empty except for a Red Guard at (2, 5)
        When Red moves the Guard from (2, 5) to (2, 6)
        Then the move is illegal

      #################################################################
      # 3) ROOK (車)
      #################################################################
      @Rook
      Scenario: Red moves the Rook along a clear rank (Legal)
        Given the board is empty except for a Red Rook at (4, 1)
        When Red moves the Rook from (4, 1) to (4, 9)
        Then the move is legal

      @Rook
      Scenario: Red moves the Rook and attempts to jump over a piece (Illegal)
        Given the board has:
          | Piece         | Position |
          | Red Rook      | (4, 1)   |
          | Black Soldier | (4, 5)   |
        When Red moves the Rook from (4, 1) to (4, 9)
        Then the move is illegal

      #################################################################
      # 4) HORSE (馬/傌)
      #################################################################
      @Horse
      Scenario: Red moves the Horse in an “L” shape with no block (Legal)
        Given the board is empty except for a Red Horse at (3, 3)
        When Red moves the Horse from (3, 3) to (5, 4)
        Then the move is legal

      @Horse
      Scenario: Red moves the Horse and it is blocked by an adjacent piece (Illegal)
        Given the board has:
          | Piece        | Position |
          | Red Horse    | (3, 3)   |
          | Black Rook   | (4, 3)   | # directly adjacent - “leg-block”
        When Red moves the Horse from (3, 3) to (5, 4)
        Then the move is illegal

      #################################################################
      # 5) CANNON (炮)
      #################################################################
      @Cannon
      Scenario: Red moves the Cannon like a Rook with an empty path (Legal)
        Given the board is empty except for a Red Cannon at (6, 2)
        When Red moves the Cannon from (6, 2) to (6, 8)
        Then the move is legal

      @Cannon
      Scenario: Red moves the Cannon and jumps exactly one screen to capture (Legal)
        Given the board has:
          | Piece         | Position |
          | Red Cannon    | (6, 2)   |
          | Black Soldier | (6, 5)   | # screen
          | Black Guard   | (6, 8)   | # target
        When Red moves the Cannon from (6, 2) to (6, 8)
        Then the move is legal

      @Cannon
      Scenario: Red moves the Cannon and tries to jump with zero screens (Illegal)
        Given the board has:
          | Piece         | Position |
          | Red Cannon    | (6, 2)   |
          | Black Guard   | (6, 8)   |
        When Red moves the Cannon from (6, 2) to (6, 8)
        Then the move is illegal

      @Cannon
      Scenario: Red moves the Cannon and tries to jump with more than one screen (Illegal)
        Given the board has:
          | Piece         | Position |
          | Red Cannon    | (6, 2)   |
          | Red Soldier   | (6, 4)   |
          | Black Soldier | (6, 5)   |
          | Black Guard   | (6, 8)   |
        When Red moves the Cannon from (6, 2) to (6, 8)
        Then the move is illegal

      #################################################################
      # 6) ELEPHANT (相/象)
      #################################################################
      @Elephant
      Scenario: Red moves the Elephant 2-step diagonal with a clear midpoint (Legal)
        Given the board is empty except for a Red Elephant at (3, 3)
        When Red moves the Elephant from (3, 3) to (5, 5)
        Then the move is legal

      @Elephant
      Scenario: Red moves the Elephant and tries to cross the river (Illegal)
        Given the board is empty except for a Red Elephant at (5, 3)
        When Red moves the Elephant from (5, 3) to (7, 5)
        Then the move is illegal

      @Elephant
      Scenario: Red moves the Elephant and its midpoint is blocked (Illegal)
        Given the board has:
          | Piece         | Position |
          | Red Elephant  | (3, 3)   |
          | Black Rook    | (4, 4)   | # midpoint
        When Red moves the Elephant from (3, 3) to (5, 5)
        Then the move is illegal

      #################################################################
      # 7) SOLDIER/PAWN (兵/卒)
      #################################################################
      @Soldier
      Scenario: Red moves the Soldier forward before crossing the river (Legal)
        Given the board is empty except for a Red Soldier at (3, 5)
        When Red moves the Soldier from (3, 5) to (4, 5)
        Then the move is legal

      @Soldier
      Scenario: Red moves the Soldier and tries to move sideways before crossing (Illegal)
        Given the board is empty except for a Red Soldier at (3, 5)
        When Red moves the Soldier from (3, 5) to (3, 4)
        Then the move is illegal

      @Soldier
      Scenario: Red moves the Soldier sideways after crossing the river (Legal)
        Given the board is empty except for a Red Soldier at (6, 5)
        When Red moves the Soldier from (6, 5) to (6, 4)
        Then the move is legal

      @Soldier
      Scenario: Red moves the Soldier and attempts to move backward after crossing (Illegal)
        Given the board is empty except for a Red Soldier at (6, 5)
        When Red moves the Soldier from (6, 5) to (5, 5)
        Then the move is illegal

      #################################################################
      # 8) WINNING AND LOSING (輸贏)
      #################################################################
      @Winning
      Scenario: Red captures opponent's General and wins immediately (Legal)
        Given the board has:
          | Piece         | Position |
          | Red Rook      | (5, 5)   |
          | Black General | (5, 8)   |
        When Red moves the Rook from (5, 5) to (5, 8)
        Then Red wins immediately

      @Winning
      Scenario: Red captures a non-General piece and the game continues (Legal)
        Given the board has:
          | Piece         | Position |
          | Red Rook      | (5, 5)   |
          | Black Cannon  | (5, 8)   |
        When Red moves the Rook from (5, 5) to (5, 8)
        Then the game is not over just from that capture

    ```
2.  請你確定 AI 有通過所有 Scenario 對應的測試案例，請截圖所有測試案例通過的 Cucumber report 截圖，看起來就像這樣：

    <figure><img src=".gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

### 任務結語

在執行此挑戰時，應該會開始感受到 AI Assistant 的限制，如果你希望 AI 能夠嚴格遵照 BDD 開發流程依序完成每一道 scenario 的開發，那麼就會發現 AI Assistant 可能會偶爾停下來等待人類的指示，或是很偶爾時會不小心會在錯誤的時機跳進去實作，而不是等測試寫完之後再實作，因此並無法每次都能直接可靠地完整的全自動化開發。

是的，在面對更複雜的需求，好比上百道情境的需求時，代表方法絕對還有超大的改進空間，本任務提供的做法只是一種體驗而已。

### 任務結束&#x20;

完成此任務之後，就可以提交入會審核囉！

[https://forms.gle/5Ch8cLVmUnuWKdZU9](https://forms.gle/5Ch8cLVmUnuWKdZU9)
