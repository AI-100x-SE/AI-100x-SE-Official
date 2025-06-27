# 入會限時任務 1 - AI x BDD 快速上手

### 練習 1 - 感受一下 AI x BDD 軟體全自動化開發的基本運作

1. 下載此 [Github 目錄（訂單優惠模組）](https://github.com/Waterball-Limited-Company/AI-100x-SE-Official/tree/main/%E5%85%A5%E6%9C%83%E4%BB%BB%E5%8B%99/%E8%A8%82%E5%96%AE%E5%84%AA%E6%83%A0%E6%A8%A1%E7%B5%84)下的所有檔案（須報名後才能存取）
2. 開啟你的 AI Assistant (Cursor, Windsurf, Claude Code, ...)。
3.  在專案目錄下執行底下的 Prompt 來感受一下 AI x BDD 的運行方式：

    ```
    # Task
    請你嚴格遵照「行為驅動開發 (BDD)」的方式，來完成 @order.feature 中所有驗收情境的開發。
    不可同時進行 BDD 開發流程中多個步驟也不能略過任何一步驟，必須一步一步扎實執行並確認每一步的結果。

    # Context

    ## Design Guideline
    - 參考 entities ERD: @ERD.png 以及 OOD 設計圖：@OOD.png 。兩張圖中所指示的類別屬性及操作只是基準，你可視情況增加新的類別、屬性或行為。


    ## Tech Stack
    1. Language Env：Java
    2. BDD Test framework: Cucumber
    3. Native test framework: Junit5

    ## Application Environment
    1. App 類型：純模組程式碼
    2. 此 feature file 中的所有優惠邏輯存放至 OrderService 中
    3. Source code root: src/

    # BDD 開發流程
    1. 先建置出 cucumber walking skeleton  - 可順利運行 cucumber 以及至少一個 scenario ，確認至少有一個 test case 被 測試框架執行到。

    2. 嚴格遵守 BDD 以及最小增量原則來開發所有程式碼，針對所有 scenario，一次開發一個 scenario，依序進行：
        A. 一次選擇一個 scenario 實作，除此 scenario 之外的測試全部都 ignore。撰寫此 scenario 對應的 Steps (given, when, then)、開啟相關類別，但是每個類別的行為都不實作，並且執行測試，確認測試失敗 (test fail)，並且測試失敗的原因並非框架層級的錯誤，而是期望的「值」上的錯誤。嚴格確認這步驟完成後才能進行下一步的實作。
        B. 為了通過上一步所撰寫的測試程式碼，請實作相關類別所需的程式碼，並確認能讓所有的測試程式碼都通過。請嚴格確認有執行到測試程式碼，從 test report 中覆述一次目前 test passed 的數量。
        C. 遵守 clean code 原則，思考是否要重構每個類別的內部程式碼，如果必要重構的話，在重構完成之後，再執行一次測試，確保所有測試仍然通過，否則需修正邏輯直到測試全數通過。

    ```


4. 執行之後，閱讀一下專案中的「features/order.feature」裡面的內容，裡面的內容為「訂單優惠總價計算」的所有情境列舉，整體運作如下：
   1. Cucumber 會讀入此檔案的內容，並且綁定對應的測試程式碼。
   2. AI 會先依照我們指示的 feature file 內容，先撰寫對應 Cucumber 自動化測試程式碼（AI 知道如何使用 Cucumber，省去了以前要人工花大量時間撰寫 Cucumber 的麻煩）
   3. AI 實作完測試程式碼之後，接著會開始去實作目標類別，來達成訂單建立及優惠的所有驗收行為。
5. 從上述你可感受到，這就是所謂的「結果導向」的開發方法，你只需要用 Feature file 這類 scenario-based 來去訂定好極其清楚的系統行為預期結果，接著全部交給 AI 就行了。
6. 人類只需要做什麼事？只需要檢查一下測試程式碼有沒有寫對就好（這部分對 AI 來說通常最簡單），快速對照一下值的部分沒錯就好。

### 練習 2 - 迭代下一個 User Story

1. 想像一下，接下來你收到一個「雙十一優惠」的需求，你家 PM 竟然砸了一個雙十一優惠的需求，並且內容如下：
   1. \<TODO>
2. 接著，你需要使用上述的 BDD Prompt，直接以「結果導向」的方式來讓 AI 幫你直接支援雙十一優惠的請求。

